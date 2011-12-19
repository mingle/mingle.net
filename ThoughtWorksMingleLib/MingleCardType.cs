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

using System.Collections;
using System.Collections.Generic;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Describes a Card Type
    /// </summary>
    public class MingleCardType
    {
        /// <summary>
        /// Returns an XElement backing this object
        /// </summary>
        public XElement RawData { get; private set; }

        /// <summary>
        /// Constructs a MingleCardType from card_type XML
        /// </summary>
        /// <param name="cardType">XML for a card_type</param>
        public MingleCardType(string cardType)
        {
            RawData = XElement.Parse(cardType);
        }

        /// <summary>
        /// Constructs a MingleCardType from card_type XML
        /// </summary>
        /// <param name="cardType">XML for a card_type</param>
        public MingleCardType(XElement cardType)
        {
            RawData = cardType;
        }

        /// <summary>
        /// Card Id
        /// </summary>
        public int Id {
            get { return int.Parse(RawData.Element("id").Value); }
            set { RawData.SetElementValue("id", value);}
        }

        /// <summary>
        /// Card name
        /// </summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set { RawData.SetElementValue("name", value); }
        }

        /// <summary>
        /// Color (consult Mingle documentation)
        /// </summary>
        public string Color
        {
            get { return RawData.Element("color").Value; }
            set { RawData.SetElementValue("color", value); }
        }

        /// <summary>
        ///  Position (consult Mingle documentation)
        /// </summary>
        public int Position
        {
            get { return int.Parse(RawData.Element("position").Value); }
            set { RawData.SetElementValue("position", value); }
        }

        /// <summary>
        /// Returns the list of property_definition names associated with this card type
        /// </summary>
        public Hashtable PropertyDefinitions
        {
            get
            {
                var properties = new Hashtable();
                foreach (var property in RawData.Element("property_definitions").Elements("property_definition"))
                    properties.Add(property.Element("name").Value, "");
                    
                return properties;
            }
        }
    }
}