//
// Copyright 2011 ThoughtWorks, Inc.
//
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models a "link" element of an event "entry" tag
    /// </summary>
    public class MingleEventsLink : XElementWrapper
    {
        /// <summary>
        /// Constructs a MingleEventsLink
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsLink(XElement xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventsLink
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsLink(string xml) : base(xml) { }

        /// <summary>
        /// Link's "href" attribute
        /// </summary>
        public string Href
        {
            get { return XAttributeString("href"); }
        }

        /// <summary>
        /// Link's "rel" attribute
        /// </summary>
        public string Rel
        {
            get { return XAttributeString("rel"); }
        }

        /// <summary>
        /// Link's "type" attribute
        /// </summary>
        public string Type
        {
            get { return XAttributeString("type"); }
        }

        /// <summary>
        /// Link's "title" attribute
        /// </summary>
        public string Title
        {
            get { return XAttributeString("title"); }
        }
    }
}