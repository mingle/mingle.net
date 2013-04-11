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

using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models the "content" tag of an "entry"
    /// </summary>
    [System.Serializable]
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