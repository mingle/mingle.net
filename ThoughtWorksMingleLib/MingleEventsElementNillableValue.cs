//
//Copyright 2011 ThoughtWorks, Inc.
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
    /// Models a tag potentially carrying a data value payload.
    /// </summary>
    public class MingleEventsElementNillableValue : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsElementsNillableValue
        /// </summary>
        /// <param name="xml"></param>
        public MingleEventsElementNillableValue(XElement xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventselementNillableValue
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsElementNillableValue(string xml) : base(xml) { }

        /// <summary>
        /// Returns the value or null
        /// </summary>
        public string Value
        {
            get
            {
                bool hasNil;
                bool.TryParse(XAttributeString("nil"), out hasNil);
                return hasNil ? null : Xml.Value;
            }
        }
    }
}