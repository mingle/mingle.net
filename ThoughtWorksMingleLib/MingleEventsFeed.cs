//
// Copyright 2011 ThoughtWorks, Inc.
//

using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models the "feed" tag
    /// </summary>
    public class MingleEventsFeed : XElementWrapper
    {
        private static readonly Properties.Settings Settings = new Properties.Settings(); 

        /// <summary>
        /// Constructs a new MingleEventsFeed
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsFeed(string xml) : base(xml) { }

        /// <summary>
        /// Contrstucts a new MingleEventsFeed
        /// </summary>
        /// <param name="xml"></param>
        public MingleEventsFeed(XElement xml) : base(xml) { }

        /// <summary>
        /// The "title" tag
        /// </summary>
        public string Title
        {
            get { return XElementString("title"); }
        }

        /// <summary>
        /// The "id" tag
        /// </summary>
        public string Id
        {
            get { return XElementString("id"); }
        }

        /// <summary>
        /// List of "link" tags
        /// </summary>
        public IEnumerable<MingleEventsLink> Links
        {
            get
            {
                return (from el in Xml.Elements()
                        where el.Name.LocalName == "link"
                        select new MingleEventsLink(el)).ToList();
            }
        }

        /// <summary>
        /// The "updated" tag
        /// </summary>
        public DateTime Updated
        {
            get { return Convert.ToDateTime(XElementString("updated")); }
        }

        /// <summary>
        /// List of "entry" tags
        /// </summary>
        public IEnumerable<MingleEventsFeedEntry> Entries
        {
            get
            {
                return (from el in Xml.Elements()
                        where el.Name.LocalName == "entry"
                        select new MingleEventsFeedEntry(el)).ToList();
            }
        }
    }
}