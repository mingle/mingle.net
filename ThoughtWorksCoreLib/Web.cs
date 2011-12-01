//
//Copyright 2011 ThoughtWorks, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at:
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
//

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;

namespace ThoughtWorksCoreLib
{
    /// <summary>
    /// Returns an HttpWebresponse
    /// </summary>
    public interface IResponse
    {
        /// <summary>
        /// Response body
        /// </summary>
        String Body { get; }
    }

    /// <summary>
    /// Class implementing IWeb
    /// </summary>
    public class Web : IWeb
    {
        private readonly Action<HttpWebRequest> _authenticate;
        private readonly Action<HttpWebRequest> _packPostData;

        /// <summary>
        /// Constructs a new Web
        /// </summary>
        public Web(): this(r => { }) {}

        /// <summary>
        /// Performs Action on Web
        /// </summary>
        /// <param name="authenticate"></param>
        public Web(Action<HttpWebRequest> authenticate)
        {
            _authenticate = authenticate;
        }

        /// <summary>
        /// Performs Action on Web
        /// </summary>
        /// <param name="authenticate"></param>
        /// <param name="packPostData"></param>
        public Web(Action<HttpWebRequest> authenticate, Action<HttpWebRequest> packPostData)
        {
            _authenticate = authenticate;
            _packPostData = packPostData;
        }

        /// <summary>
        /// Returns an HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public IResponse Get(string url)
        {
            return Get(url, new List<string> {});
        }

        /// <summary>
        /// Returns an HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Get(string url, IEnumerable<string> data)
        {
            var completeUrl = new StringBuilder(url + "?");
            if (data != null) data.ToList().ForEach(s => completeUrl.Append(s + "&"));
            completeUrl.Remove(completeUrl.Length - 1, 1);
            var request = (HttpWebRequest)WebRequest.Create(completeUrl.ToString());
            request.Method = "get";
            request.ContentType = "text/html";
            _authenticate(request);

            using (var response = (HttpWebResponse)request.GetResponse())
            {
                var body = new StreamReader(response.GetResponseStream()).ReadToEnd();
                return new Response(body);
            }
        }

        /// <summary>
        /// Performns a PUT and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Put(string url, IEnumerable<string> data)
        {
            return GetResponse("PUT", url, data);
        }

        /// <summary>
        /// Performns a POST and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Post(string url, IEnumerable<string> data)
        {
            return GetResponse("POST", url, data);
        }

        private IResponse GetResponse(string method, string url, IEnumerable<string> data)
        {
            var me = new StackFrame().GetMethod().Name;
            var postData = new StringBuilder();
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = method;
            request.ContentType = "application/x-www-form-urlencoded";

            try
            {
                // Add parameter form data if any
                if (data != null)
                {
                    if (data.Count() > 0)
                    {
                        data.ToList().ForEach(s => postData.Append(s + "&"));
                        postData.Remove(postData.Length - 1, 1);
                    }
                    var encodedBytes = Encoding.UTF8.GetBytes(postData.ToString());

                    // Write the encoded data to the request.
                    using (var stream = request.GetRequestStream())
                    {
                        stream.Write(encodedBytes, 0, encodedBytes.Length);
                    }
                }

                TraceLog.WriteLine(me, "Post Data:" + postData);

                _authenticate(request);

                using (var response = (HttpWebResponse)request.GetResponse())
                {
                    var body = new StreamReader(response.GetResponseStream()).ReadToEnd();
                    return new Response(body);
                }
            }

            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

        }

        /// <summary>
        /// Performns a DELETE and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public IResponse Delete(string url)
        {
            throw new NotImplementedException();
        }


        class Response : IResponse
        {
            /// <summary>
            /// Sets the response body
            /// </summary>
            /// <param name="body"></param>
            public Response(string body) { Body = body; }
            /// <summary>
            /// Returns the response body
            /// </summary>
            public String Body { get; private set; }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public class AuthenticatingWeb : IWeb
    {
        private readonly string _login;
        private readonly string _password;
        private readonly Web _authenticated;

        /// <summary>
        /// Constructs an AutnenticatingWeb that is used to wrap an HttpWebRequest with authentication
        /// </summary>
        /// <param name="login"></param>
        /// <param name="password"></param>
        public AuthenticatingWeb(string login, string password)
        {
            _login = login;
            _password = password;
            _authenticated = new Web(Authenticate);
        }
        /// <summary>
        /// Performns a GET and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public IResponse Get(string url)
        {
            return _authenticated.Get(url);
        }

        /// <summary>
        /// Performns a GET and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Get(string url, IEnumerable<string> data)
        {
            return _authenticated.Get(url, data);
        }

        /// <summary>
        /// Performns a PUT and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Put(string url, IEnumerable<string> data)
        {
            return _authenticated.Put(url, data);
        }

        /// <summary>
        /// Performns a POST and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public IResponse Post(string url, IEnumerable<string> data)
        {
            return _authenticated.Post(url, data);
        }

        /// <summary>
        /// Performns a DELETE and returns HttpWebResponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public IResponse Delete(string url)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Add credentials to the request
        /// </summary>
        /// <param name="request"></param>
        private void Authenticate(HttpWebRequest request)
        {
            request.Credentials = new NetworkCredential(_login, _password);
            request.PreAuthenticate = true;
            
            var unmanagedString = Marshal.StringToHGlobalUni(_password);
            var authBytes =
                Encoding.UTF8.GetBytes(
                    string.Format("{0}:{1}", _login, Marshal.PtrToStringUni(unmanagedString)).ToCharArray());

            request.Headers["Authorization"] = "Basic " + Convert.ToBase64String(authBytes);

        }

    }
    /// <summary>
    /// IWeb interface
    /// </summary>
    public interface IWeb
    {
        /// <summary>
        /// Performs a GET and returns HttpWebresponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        IResponse Get(string url);

        /// <summary>
        /// Performs a GET and returns HttpWebresponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        IResponse Get(string url, IEnumerable<string> data);

        /// <summary>
        /// Performs a PUT and returns HttpWebresponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        IResponse Put(string url, IEnumerable<string> data );

        /// <summary>
        /// Performs a POST and returns HttpWebresponse
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        IResponse Post(string url, IEnumerable<string> data);
        /// <summary>
        /// Performs a DELETE and returns HttpWebresponse
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        IResponse Delete(string url);
    }
}
