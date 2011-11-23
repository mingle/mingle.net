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

using System.Collections.Generic;
using System.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// 
    /// </summary>
    public class Mingle 
    {
        private readonly IWebApi _webApi;

        /// <summary>
        /// General-purpose web wrapper
        /// </summary>
        /// <param name="webApi"></param>
        public Mingle(IWebApi webApi)
        {
            _webApi = webApi;
        }

        /// <summary>
        /// Returns an enumerable set of MingleMurmor
        /// </summary>
        /// <param name="project"></param>
        /// <returns></returns>
        public IEnumerable<MingleMurmur> GetMurmurs(string project)
        {
            var murmurs = _webApi.Get(project + "/murmurs.xml");
            return murmurs.Elements("murmur").Select(e => new MingleMurmur(e));
        }

        /// <summary>
        /// Returns an enumerable set of MingleResult
        /// </summary>
        /// <param name="project">Name of a Mingle project</param>
        /// <param name="mql">MQL statement</param>
        /// <returns></returns>
        public IEnumerable<MingleResult> GetResults(string project, string mql)
        {
            var results = _webApi.Get(project + "/cards/execute_mql.xml?mql=" + mql);
            return results.Elements("result").Select(e => new MingleResult(e));
        }
    }
}