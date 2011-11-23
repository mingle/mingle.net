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

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// MingleServer interface
    /// </summary>
    public interface IMingleServer
    {
        /// <summary>
        /// Performs a GET operation on the Mingle API
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <returns></returns>
        string Get(string project, string url);

        /// <summary>
        /// Performs a GET operation on the Mingle API with a query string
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="paramaters"></param>
        /// <returns></returns>
        string Get(string project, string url, IEnumerable<string> paramaters);

        /// <summary>
        /// Performs a PUT operation on the Mingle API with associated POST data
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="data"></param>
        string Put(string project, string url, IEnumerable<string> data );

        /// <summary>
        /// Performs a POST operation on the Mingle API with associated POST data
        /// </summary>
        /// <param name="project"></param>
        /// <param name="url"></param>
        /// <param name="postData"></param>
        /// <param name="absoluteUrl"></param>
        string Post(string project, string url, IEnumerable<string> postData, bool absoluteUrl);

        /// <summary>
        /// Returns a Sorted list of project names and identifiers
        /// </summary>
        /// <returns></returns>
        SortedList<string, string> GetProjectList();

        /// <summary>
        /// Returns a MingleProject
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        MingleProject GetProject(string projectId);
    }
}