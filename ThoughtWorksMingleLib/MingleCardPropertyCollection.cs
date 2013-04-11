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
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Represents a collection of properties of a Mingle card
    /// </summary>
    /// <remarks>
    /// Each Mingle card has a fixed set of members also known as attributes.
    /// A card also has a variable colleciton of properties as determined
    /// by the card type. MingleCardProperty model the colleciton of properties.
    /// </remarks>
    [System.Serializable]
    public class MingleCardPropertyCollection : Dictionary<string, MingleCardProperty>, IXmlSerializable
    {
        /// <summary>
        /// ID (not name) of the project
        /// </summary>
        public string ProjectId { get; private set; }

        /// <summary>
        /// MingleProject object
        /// </summary>
        public IMingleProject Project { get; private set; }

        /// <summary>
        /// Constructs a new MingleCardPropertyCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleCardPropertyCollection(IMingleProject project)
        {
            Project = project;
            ProjectId = project.ProjectId;
        }

        /// <summary>
        /// Parses the xml of all the card properties into a collection of MingleCardProperty
        /// </summary>
        /// <param name="properties"></param>
        /// <returns></returns>
        public MingleCardPropertyCollection Parse(XElement properties)
        {
            properties.Elements("property").ToList().ForEach(e => Add(e.Element("name").Value, new MingleCardProperty(e.ToString(), Project)));

            return this;
        }

        /// <summary>
        /// This method is reserved and should not be used. When implementing the IXmlSerializable interface, you should return null (Nothing in Visual Basic) from this method, and instead, if specifying a custom schema is required, apply the <see cref="T:System.Xml.Serialization.XmlSchemaProviderAttribute"/> to the class.
        /// </summary>
        /// <returns>
        /// An <see cref="T:System.Xml.Schema.XmlSchema"/> that describes the XML representation of the object that is produced by the <see cref="M:System.Xml.Serialization.IXmlSerializable.WriteXml(System.Xml.XmlWriter)"/> method and consumed by the <see cref="M:System.Xml.Serialization.IXmlSerializable.ReadXml(System.Xml.XmlReader)"/> method.
        /// </returns>
        public XmlSchema GetSchema()
        {
            return null;
        }

        /// <summary>
        /// Generates an object from its XML representation.
        /// </summary>
        /// <param name="reader">The <see cref="T:System.Xml.XmlReader"/> stream from which the object is deserialized. </param>
        public void ReadXml(XmlReader reader)
        {
            var keySerializer = new XmlSerializer(typeof(string));
            var valueSerializer = new XmlSerializer(typeof(MingleCardProperty));
 
            var wasEmpty = reader.IsEmptyElement;
            reader.Read();
 
            if (wasEmpty)
                return;
 
            while (reader.NodeType != System.Xml.XmlNodeType.EndElement)
            {
                reader.ReadStartElement("item");
 
                reader.ReadStartElement("key");
                var key = (string)keySerializer.Deserialize(reader);
                reader.ReadEndElement();
 
                reader.ReadStartElement("value");
                var value = (MingleCardProperty)valueSerializer.Deserialize(reader);
                reader.ReadEndElement();
 
                this.Add(key, value);
 
                reader.ReadEndElement();
                reader.MoveToContent();
            }
            reader.ReadEndElement();
        }

        /// <summary>
        /// Converts an object into its XML representation.
        /// </summary>
        /// <param name="writer">The <see cref="T:System.Xml.XmlWriter"/> stream to which the object is serialized. </param>
        public void WriteXml(XmlWriter writer)
        {
            var keySerializer = new XmlSerializer(typeof(string));
            var valueSerializer = new XmlSerializer(typeof(MingleCardProperty));

            foreach (string key in this.Keys)
            {
                writer.WriteStartElement("item");

                writer.WriteStartElement("key");
                keySerializer.Serialize(writer, key);
                writer.WriteEndElement();

                writer.WriteStartElement("value");
                var value = this[key];
                valueSerializer.Serialize(writer, value);
                writer.WriteEndElement();

                writer.WriteEndElement();
            }
        }
    }
}