using System;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Represents a property of a Mingle card
    /// </summary>
    /// <remarks>
    /// Each Mingle card has a fixed set of members also known as attributes.
    /// A card also has a variable colleciton of properties as determined
    /// by the card type. MingleCardProperty model each or these properties.
    /// </remarks>
    public class MingleCardProperty
    {
        /// <summary>
        /// XElement backing this object
        /// </summary>
        public XElement RawData { get; private set; }

        private readonly MingleProject _project;

        /// <summary>
        /// Name of the property
        /// </summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set { RawData.SetElementValue("name", value);}
        }

        /// <summary>
        /// Property value
        /// </summary>
        public string Value
        {
            get { return RawData.Element("value").Value; }
            set { RawData.SetElementValue("value", value); }
        }

        /// <summary>
        /// If the Value is a card then this returns the Url of the card
        /// </summary>
        public string ValueUrl
        {
            get
            {
                string retval;
                try
                {
                    retval = RawData.Element("value").Attribute("url").Value;
                }
                catch (NullReferenceException)
                {
                    retval = string.Empty;
                }
                return retval;
            }

            set { RawData.Element("value").SetAttributeValue("url", value); }
        }

        /// <summary>
        /// returns the associated MinglePropertyDefinition of this property
        /// </summary>
        public MinglePropertyDefinition PropertyDefinition 
        { 
            get { return null != _project && _project.Properties.ContainsKey(Name) ? _project.Properties[Name] : null; }
        }

        /// <summary>
        /// Constructs a new MingleCardProperty
        /// </summary>
        /// <param name="xml">Xml for the property</param>
        public MingleCardProperty(string xml)
        {
            RawData = XElement.Parse(xml);
        }

        /// <summary>
        /// Constructs a new MingleCardProperty
        /// </summary>
        /// <param name="xml">Xml for the property</param>
        /// <param name="project">MingleProject associated with this property</param>
        public MingleCardProperty(string xml, MingleProject project)
        {
            RawData = XElement.Parse(xml);
            _project = project;
        }
    }
}
