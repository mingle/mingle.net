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