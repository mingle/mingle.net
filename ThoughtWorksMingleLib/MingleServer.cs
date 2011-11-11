﻿//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A class for interacting with the Mingle server
    /// </summary>
    public class MingleServer : IMingleServer
    {
        private SecureString _password;
        private string _host;
        private string _login;

        #region Constructors
        /// <summary>
        /// Constructs a new MingleServer
        /// </summary>
        /// <param name="hostUrl">Host url</param>
        /// <param name="loginName">Login name of the user</param>
        /// <param name="password">password</param>
        public MingleServer(string hostUrl, string loginName, SecureString password)
        {
            _host = hostUrl;
            _login = loginName;
            _password = password;
        }

        /// <summary>
        /// Constructs a new MingleServer
        /// </summary>
        /// <param name="hostUrl">Host url</param>
        /// <param name="loginName">Login name of the user</param>
        /// <param name="password">password</param>
        public MingleServer(string hostUrl, string loginName, string password)
        {
            _host = hostUrl;
            _login = loginName;
            _password = new SecureString();
            foreach (var c in password.ToCharArray()) _password.AppendChar(c);
        } 
        #endregion

        #region Implements IMingleServer

        private string Get(string url)
        {
            var web = new AuthenticatingWeb(_login, GetStringFromSecureString(_password));
            return web.Get(url).Body;
        }

        /// <summary>
        /// Performs a GET on the url with optional query paramaters and returns HttpWebResponse
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <returns></returns>
        public string Get(string project, string url)
        {
            var qurl = FullyQualifiedMingleUrl(project, url);
            var web = new AuthenticatingWeb(_login, GetStringFromSecureString(_password));
            return web.Get(qurl).Body;
        }

        /// <summary>
        /// Performs a GET on the url with optional query paramaters and returns HttpWebResponse
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public string Get(string project, string url, IEnumerable<string> data)
        {
            var qurl = FullyQualifiedMingleUrl(project, url);
            var web = new AuthenticatingWeb(_login, GetStringFromSecureString(_password));
            return web.Get(qurl, data).Body;
        }

        /// <summary>
        /// Performs a PUT on the Mingle url with optional post data and returns HttpWebResponse
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns>URL of the card from the Location header</returns>
        public string Put(string project, string url, IEnumerable<string> data)
        {
            var qurl = FullyQualifiedMingleUrl(project, url);
            var web = new AuthenticatingWeb(_login, GetStringFromSecureString(_password));
            return web.Put(qurl, data).Body;
        }

        /// <summary>
        /// Performs a POST on the Mingle url with optional post data and returns HttpWebResponse
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns>URL of the card from the Location header</returns>
        public string Post(string project, string url, IEnumerable<string> data)
        {
            var qurl = FullyQualifiedMingleUrl(project, url);
            var web = new AuthenticatingWeb(_login, GetStringFromSecureString(_password));
            return web.Post(qurl, data).Body;
        }
        #endregion

        #region EnablePreAuthentication
        /// <summary>
        /// Enables pre-wuthentication on web requests. Improves performance.
        /// </summary>
        /// <remarks>See MSDN Library documentation for AuthenticaionManager: http://msdn.microsoft.com/en-us/library/3dx32b0y.aspx </remarks>
        /// <param name="uri"></param>
        /// <param name="authenticationType"></param>
        private static void EnablePreAuthentication(Uri uri, string authenticationType)
        {
            var e = AuthenticationManager.RegisteredModules;
            while (e.MoveNext())
            {
                var module = e.Current as IAuthenticationModule;
                if (string.Compare(module.AuthenticationType, authenticationType, true) == 0)
                {
                    var mi = typeof (AuthenticationManager).GetMethod("BindModule",
                                                                             BindingFlags.NonPublic |
                                                                             BindingFlags.Static);
                    mi.Invoke(null, new object[] {uri, new Authorization(null), module});
                    return;
                }
            }
            return;
        }
        #endregion

        #region AcceptAllCertifications x509 (necessary for getting a web response)
        /// <summary>
        /// Allows all certificates to be considered acceptable.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="certification"></param>
        /// <param name="chain"></param>
        /// <param name="sslPolicyErrors"></param>
        /// <returns></returns>
        private static bool AcceptAllCertifications(object sender, X509Certificate certification, X509Chain chain,
                                                    SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }
        #endregion

        #region GetProject()
        /// <summary>
        /// Returns the MingleProject for the project Id on this MingleServer (instance)
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public MingleProject GetProject(string projectId)
        {
            return new MingleProject(projectId, this);
        }
        #endregion

        #region GetProjectList()
        /// <summary>
        /// Returns a Sorted list of project names and identifiers
        /// </summary>
        /// <returns></returns>
        public SortedList<string, string> GetProjectList()
        {
            var url = string.Format("{0}/api/v2/projects.xml", _host);
            var query =
                from p in XElement.Parse(Get(url)).Descendants("project")
                let name = p.Element("name").Value
                let identifier = p.Element("identifier").Value
                select new
                {
                    name,
                    identifier
                };

            // we're creating an anonymous type here, so it's easier to go
            // from the IEnumeration<,> to a Dictionary<,>
            // nothing is parsed (xml) or enumerated until ToDictionary is executed
            // -- probably in a single pass over the doc

            return new SortedList<string, string>(query.ToDictionary(x => x.name, x => x.identifier));

        }
        #endregion

        #region Utilities

        /// <summary>
        /// Adds "/api/v2" to the front of a URL segment
        /// </summary>
        /// <param name="project">Mingle project id (not name)</param>
        /// <param name="segment">URL segment string</param>
        /// <returns></returns>
        private string FullyQualifiedMingleUrl(string project, string segment)
        {

            return string.Format("{0}/api/v2/projects{1}{2}", 
                                            _host, 
                                            NormalizeUrlSegment(project), 
                                            NormalizeUrlSegment(segment));
        }

        /// <summary>
        /// Ensures a URL segment, passed as a string, begins and does not end with "/"
        /// </summary>
        /// <param name="url">The url string to normalize</param>
        /// <returns></returns>
        private static object NormalizeUrlSegment(string url)
        {
            return url.StartsWith("/") ? url : "/" + url;
        } 

        /// <summary>
        /// Converts a String into a read-only SecureString
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static SecureString GetSecureStringFromString(string value)
        {
            var ss = new SecureString();
            if (string.IsNullOrEmpty(value)) throw new ArgumentNullException("value");

            foreach (var c in value.ToCharArray())
            {
                ss.AppendChar(c);
            }
            ss.MakeReadOnly();
            return ss;
        }

        /// <summary>
        /// Converts a SecureString to String
        /// </summary>
        /// <param name="secureString"></param>
        /// <returns>The password as a string or if the conversion fails then an empty string is returned.</returns>
        private static string GetStringFromSecureString(SecureString secureString)
        {
            if (null == secureString)
            {
                secureString = new SecureString();
            }

            var unmanagedString = Marshal.SecureStringToGlobalAllocUnicode(secureString);
            try
            {
                return Marshal.PtrToStringUni(unmanagedString);
            }
            catch (Exception)
            {
                return string.Empty;
            }
            finally
            {
                Marshal.ZeroFreeGlobalAllocUnicode(unmanagedString);
            }
        }
        #endregion

    }
}