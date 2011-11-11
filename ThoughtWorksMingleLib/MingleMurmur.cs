using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A Mingle murmur 
    /// </summary>
    public class MingleMurmur
    {
        private readonly XElement _xElement;

        /// <summary>
        /// Constructs a new Murmur from an XElement payload
        /// </summary>
        /// <param name="xElement"></param>
        public MingleMurmur(XElement xElement)
        {
            _xElement = xElement;
        }

        /// <summary>
        /// Body of the Murmur
        /// </summary>
        public string Body
        {
            get { return _xElement.Element("body").Value; }
        }

        /// <summary>
        /// Author of the Murmur
        /// </summary>
        public string AuthorName
        {
            get { return _xElement.Element("author").Element("name").Value; }
        }
    }
}