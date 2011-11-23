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
    /// Models the "change" tag
    /// </summary>
    public class MingleEventsChange : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsChange
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsChange(XElement xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventsChange
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsChange(string xml) : base(xml) { }

        /// <summary>
        /// The Type
        /// </summary>
        /// <remarks>
        /// Example: name-change, description-change, property-change
        /// </remarks>
        public string Type
        {
            get { return XAttributeString("type"); }
        }

        /// <summary>
        /// The Field Name
        /// </summary>
        /// <remarks>
        /// Example: If the Type is "name-change" this property returns "name"
        /// </remarks>
        public string TypeFieldName
        {
            get
            {
                var split = Type.Split('-');
                return split.Length == 2 ? Type.Split('-')[0] : null;
            }
        }

        /// <summary>
        /// The Action
        /// </summary>
        /// <remarks>
        /// Example: If the Type is "name-change" this property returns "change"
        /// </remarks>
        public string TypeAction
        {
            get
            {
                var split = Type.Split('-');
                return split.Length == 2 ? Type.Split('-')[1] : null;
            }
        }

        /// <summary>
        /// The old_value
        /// </summary>
        public MingleEventsElementNillableValue OldValue
        {
            get { return new MingleEventsElementNillableValue(XElements("old_value")); }
        }

        /// <summary>
        /// The new_value
        /// </summary>
        public MingleEventsElementNillableValue NewValue
        {
            get { return new MingleEventsElementNillableValue(XElements("new_value")); }
        }

        /// <summary>
        /// property_definition object
        /// </summary>
        /// <remarks>
        /// If the change type is "property_definition" this property returns a 
        /// MingleEventsPropertyDefinition object otherwise it returns null.
        /// </remarks>
        public MingleEventsPropertyDefinition PropertyDefinition
        {
            get {return Type.CompareTo("property-change") == 0 ? 
                new MingleEventsPropertyDefinition(XElements("property_definition")) :
                null;}
        }
    }
}