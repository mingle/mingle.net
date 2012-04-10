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