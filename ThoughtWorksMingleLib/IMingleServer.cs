using System;
using System.Collections.Generic;
using System.Net;
using System.Security;
using System.Xml.Linq;
using System.Collections.ObjectModel;

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
        string Post(string project, string url, IEnumerable<string> postData);

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