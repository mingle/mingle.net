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