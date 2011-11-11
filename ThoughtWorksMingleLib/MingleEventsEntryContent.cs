//
// Copyright 2011 ThoughtWorks, Inc.
//
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models the "content" tag of an "entry"
    /// </summary>
    public class MingleEventsEntryContent : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsEntryContent
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsEntryContent(XElement xml) : base (xml) {}

         /// <summary>
        /// Constructs a new MingleEventsEntryContent
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsEntryContent(string xml) : base(xml) { }

       /// <summary>
        /// List of "change" tags within the "content"
        /// </summary>
        public IEnumerable<MingleEventsChange> Changes
        {
            get
            {
                var changes = (from el in Xml.Descendants()
                        where el.Name.LocalName == "change"
                        select new MingleEventsChange(el)).ToList();
                return changes;
            }
        }

    }
}