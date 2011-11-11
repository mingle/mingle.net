//
// Copyright 2011 ThoughtWorks, Inc.
//
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models a "category" element of an event "entry" tag
    /// </summary>
    public class MingleEventsCategory : XElementWrapper
    {

        /// <summary>
        /// Constructs a MingleEventsCategory
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsCategory(XElement xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventsCategory
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsCategory(string xml) : base(xml) { }

        /// <summary>
        /// Category's "term" attribute
        /// </summary>
        public string Term
        {
            get { return XAttributeString("term"); }
        }

        /// <summary>
        /// Category's "scheme" attribute
        /// </summary>
        public string Scheme
        {
            get { return XAttributeString("scheme"); }
        }

    }
}