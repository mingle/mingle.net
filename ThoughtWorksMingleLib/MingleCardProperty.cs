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

using System;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Represents a property of a Mingle card
    /// </summary>
    /// <remarks>
    /// Each Mingle card has a fixed set of members also known as attributes.
    /// A card also has a variable colleciton of properties as determined
    /// by the card type. MingleCardProperty model each or these properties.
    /// </remarks>
    public class MingleCardProperty
    {
        /// <summary>
        /// XElement backing this object
        /// </summary>
        public XElement RawData { get; private set; }

        private readonly IMingleProject _project;

        /// <summary>
        /// Name of the property
        /// </summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set { RawData.SetElementValue("name", value);}
        }

        /// <summary>
        /// Property value
        /// </summary>
        public string Value
        {
            get
            {
                if (IsValueNil) return string.Empty;
                switch (RawData.Attribute("type_description").Value.ToLower())
                {
                    case "date":
                    case "managed text lis":
                    case "managed number list":
                    case "any number":
                        {
                            return RawData.Element("value").Value;
                        }

                    case "card":
                    case "any card used in tree":
                        {
                            return RawData.Element("value").Element("number").Value;
                        }

                    case "automatically generated from the team list":
                        {
                            return RawData.Element("value").Element("login").Value;
                        }

                    default:
                        {
                            return RawData.Element("value").Value;
                        }


                }
            }

        }

        /// <summary>
        /// True if the 'nil' attribute exists
        /// </summary>
        public bool IsValueNil
        {
            get
            {
                try
                {
                    return !string.IsNullOrEmpty(RawData.Element("value").Attribute("nil").Value);
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// If the Value is a card then this returns the Url of the card
        /// </summary>
        public string ValueUrl
        {
            get
            {
                string retval;
                try
                {
                    retval = RawData.Element("value").Attribute("url").Value;
                }
                catch (NullReferenceException)
                {
                    retval = string.Empty;
                }
                return retval;
            }

            set { RawData.Element("value").SetAttributeValue("url", value); }
        }

        /// <summary>
        /// returns the associated MinglePropertyDefinition of this property
        /// </summary>
        public MinglePropertyDefinition PropertyDefinition 
        { 
            get { return null != _project && _project.Properties.ContainsKey(Name) ? _project.Properties[Name] : null; }
        }

        /// <summary>
        /// Constructs a new MingleCardProperty
        /// </summary>
        /// <param name="xml">Xml for the property</param>
        public MingleCardProperty(string xml)
        {
            RawData = XElement.Parse(xml);
        }

        /// <summary>
        /// Constructs a new MingleCardProperty
        /// </summary>
        /// <param name="xml">Xml for the property</param>
        /// <param name="project">MingleProject associated with this property</param>
        public MingleCardProperty(string xml, IMingleProject project)
        {
            RawData = XElement.Parse(xml);
            _project = project;
        }
    }
}
