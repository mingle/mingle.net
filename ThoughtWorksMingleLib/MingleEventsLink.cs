//
// Copyright 2012-2013 ThoughtWorks, Inc.
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

using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models a "link" element of an event "entry" tag
    /// </summary>
    [System.Serializable]
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