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

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Serialization;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// An ObservableCollection of MingleProjectMember
    /// </summary>
    [System.Serializable]
    public class MingleProjectMemberCollection : Dictionary<string, MingleProjectMember>, IMingleXmlObjectCollection, IXmlSerializable
    {
        /// <summary>
        /// MingleProject associated with this object
        /// </summary>
        public MingleProject Project { get; private set; }

        /// <summary>
        /// Mingle project identifier
        /// </summary>
        public string ProjectId { get { return Project.ProjectId; } }

        /// <summary>
        /// Constructs a MingleProjectMemberCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleProjectMemberCollection (MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// Load a MingleObjectMember collection from Mingle
        /// </summary>
        public object Parse()
        {

            try
            {
                XElement.Parse(Project.Mingle.Get(ProjectId, "/users.xml")).
                    Elements("projects_member").ToList().ForEach(e => Add(e.Element("user").
                        Element("login").Value, new MingleProjectMember(e.ToString())));
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                return new MingleProjectMemberCollection(Project);
            }

            return this;
        }

        /// <summary>
        /// Parses the results of Mingle's favorites.xml resource and populates the collection
        /// </summary>
        /// <param name="xml">Results of calling Mingle's API for the favorites.xml resource</param>
        /// <returns></returns>
        public object Parse(string xml)
        {
            XElement.Parse(xml).Elements("project_member").ToList().ForEach(f => Add(f.Element("name").Value, new MingleProjectMember(f.ToString())));
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
            var valueSerializer = new XmlSerializer(typeof(MingleProjectMember));

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
                var value = (MingleProjectMember)valueSerializer.Deserialize(reader);
                reader.ReadEndElement();

                Add(key, value);

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
            var valueSerializer = new XmlSerializer(typeof(MingleProjectMember));

            foreach (var key in this.Keys)
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