//
// Copyright 2012 ThoughtWorks, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at:
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
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