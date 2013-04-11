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
    /// Models the property_definition tag
    /// </summary>
    [System.Serializable]
    public class MingleEventsPropertyDefinition : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsPropertyDefinition
        /// </summary>
        /// <param name="xml">XML in XElement form</param>
        public MingleEventsPropertyDefinition(XElement xml) : base(xml) {}

        /// <summary>
        /// Constructs a new MingleEventsPropertyDefinition
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsPropertyDefinition(string xml) : base(xml) { }

        /// <summary>
        /// Url attribute
        /// </summary>
        public string Url
        {
            get { return XAttributeString("url"); }
        }

        /// <summary>
        /// Name element
        /// </summary>
        public string Name
        {
            get { return XElementString("name"); }
        }

        /// <summary>
        ///  data_type element
        /// </summary>
        public string DataType
        {
            get { return XElementString("data_type"); }
        }

        /// <summary>
        /// is_numeric element
        /// </summary>
        public bool IsNumeric
        {
            get { return bool.Parse(XElementString("is_numeric")); }
        }

        /// <summary>
        /// is_numeric element
        /// </summary>
        public string Position
        {
            
            get
            {
                var position = XElementString("position");
                return string.IsNullOrEmpty(position) ? null : position;
            }
        }
    }
}