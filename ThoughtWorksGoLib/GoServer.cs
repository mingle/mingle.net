//
// Copyright 2012 ThoughtWorks, Inc.
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