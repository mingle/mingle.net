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
    /// Models the "entry" tag
    /// </summary>
    public class MingleEventsFeedEntry : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsFeedEntry
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsFeedEntry(string xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventsFeedEntry
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsFeedEntry(XElement xml) : base(xml) { }

        /// <summary>
        /// The "id" tag
        /// </summary>
        public int Id
        {
            get
            {
                var segments = new Uri(XElementString("id")).Segments;
                return int.Parse(segments[segments.Count() - 1]);
            }
        }

        /// <summary>
        /// The "title" tag
        /// </summary>
        public string Title
        {
            get
            {
                return XElementString("title");
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
        /// The Name tag withing Author
        /// </summary>
        public string AuthorName
        {
            get { return Xml.Element("{http://www.w3.org/2005/Atom}author").Element("{http://www.w3.org/2005/Atom}name").Value; }
        }

        /// <summary>
        /// The URI tag within Author
        /// </summary>
        public string AuthorUri
        {
            get { return Xml.Element("{http://www.w3.org/2005/Atom}author").Element("{http://www.w3.org/2005/Atom}uri").Value; }

        }
        /// <summary>
        /// A list of "link" tags
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
        /// A list of "category" tags
        /// </summary>
        public IEnumerable<MingleEventsCategory> Categories
        {
            get
            {
                return (from el in Xml.Elements()
                        where el.Name.LocalName == "category"
                        select new MingleEventsCategory(el)).ToList();
            }
        }

        /// <summary>
        /// The "content" tag
        /// </summary>
        public MingleEventsEntryContent Content
        {
            get
            {
                var content = (from el in Xml.Elements()
                               where el.Name.LocalName == "content"
                               select new MingleEventsEntryContent(el)).ToList();
                return content.Count == 1 ? content[0] : null;
            }
        }

        /// <summary>
        /// Returns the url of the latest version of the card
        /// </summary>
        /// <returns></returns>
        public string GetCardUrlPathForApi()
        {
            foreach (var link in Links.Where(link => link.Type.CompareTo("application/vnd.mingle+xml") == 0 &&
                                                     link.Rel.CompareTo("http://www.thoughtworks-studios.com/ns/mingle#event-source") == 0))
                                             return link.Href;
            return string.Empty;
        }

        /// <summary>
        /// Returns the card number
        /// </summary>
        public int CardNumber
        {
            get
            {
                var segs = new Uri(GetCardUrlPathForApi()).PathAndQuery.Replace(".xml", string.Empty).Split('/');
                return int.Parse(segs[segs.Length-1]);
            }
        }
    }
}