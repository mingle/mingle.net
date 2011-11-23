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
using System.Xml.Linq;

namespace ThoughtWorksCoreLib
{
    /// <summary>
    /// IWebApi interface
    /// </summary>
    public interface IWebApi
    {
        /// <summary>
        /// Returns XML
        /// </summary>
        /// <param name="uri"></param>
        /// <returns></returns>
        XElement Get(string uri);
    }

    /// <summary>
    /// Class for WebApi
    /// </summary>
    public class WebApi : IWebApi
    {
        private readonly IWeb _web;
        private readonly Uri _hostname;

        /// <summary>
        /// Establishes WebApi
        /// </summary>
        /// <param name="web"></param>
        /// <param name="hostname"></param>
        public WebApi(IWeb web, string hostname)
        {
            _web = web;
            _hostname = new Uri(hostname).Append("/api/v2/");
        }

        /// <summary>
        /// Returns XML
        /// </summary>
        /// <param name="uri"></param>
        /// <returns></returns>
        public XElement Get(string uri)
        {
            var body = _web.Get(_hostname.Append(uri).ToString()).Body;
            return XElement.Parse(body);
        }
    }
}