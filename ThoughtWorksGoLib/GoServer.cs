//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System.Collections.ObjectModel;
using System.Security;

namespace ThoughtWorksGoLib
{
    /// <summary>
    /// Represents an instance of a GO server supporting http/https requests
    /// </summary>
    public class GoServer
    {
        private SecureString _password = new SecureString();
        private string _host;
        private string _login;

        /// <summary>
        /// Creates a new GO server
        /// </summary>
        /// <param name="host">URL of the GO server</param>
        /// <param name="login">Login name</param>
        /// <param name="password">Password</param>
        public GoServer (string host, string login, string password)
        {
            _host = host;
            _login = login;
            foreach (var c in password.ToCharArray()) _password.AppendChar(c);
        }

        /// <summary>
        /// Creates a new GO server
        /// </summary>
        /// <param name="host">URL of the GO server</param>
        /// <param name="login">Login name</param>
        /// <param name="password">Password</param>
        public GoServer(string host, string login, SecureString password)
        {
            _host = host;
            _login = login;
            _password = password;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ObservableCollection<GoPipeline> GetPipelineList()
        {
            return null;
        }

        
    }

    /// <summary>
    /// Class describing a pipeline
    /// </summary>
    public class GoPipeline
    {
    }
}