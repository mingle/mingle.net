//
// Copyright 2011 ThoughtWorks, Inc.
//
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models the property_definition tag
    /// </summary>
    public class MingleEventsPropertyDefinition : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsPropertyDefinition
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsPropertyDefinition(XElement xml) : base(xml) {}

        /// <summary>
        /// Constructs a new MingleEventsPropertyDefinition
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsPropertyDefinition(string xml) : base(xml) { }

        /// <summary>
        /// Url attribute
        /// </summary>
        public string Url
        {
            get { return XAttributeString("url"); }
        }

        /// <summary>
        /// Name element
        /// </summary>
        public string Name
        {
            get { return XElementString("name"); }
        }

        /// <summary>
        ///  data_type element
        /// </summary>
        public string DataType
        {
            get { return XElementString("data_type"); }
        }

        /// <summary>
        /// is_numeric element
        /// </summary>
        public bool IsNumeric
        {
            get { return bool.Parse(XElementString("is_numeric")); }
        }

        /// <summary>
        /// is_numeric element
        /// </summary>
        public string Position
        {
            
            get
            {
                var position = XElementString("position");
                return string.IsNullOrEmpty(position) ? null : position;
            }
        }
    }
}