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
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A Mingle Card
    /// </summary>
    public class MingleCard
    {
        private readonly MingleProject _project;
        private readonly SortedList<string,MingleTransition> _transitions = new SortedList<string, MingleTransition>();
        private readonly SortedList<string,MinglePropertyDefinition> _properties = new SortedList<string, MinglePropertyDefinition>();

        #region Mingle Card Attributes

        ///<summary>
        /// One line short name
        ///</summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set { RawData.SetElementValue("name", value); }
        }
        /// <summary>
        /// Card ID, Transition ID, atc.
        /// </summary>
        public int Id
        {
            get { return int.Parse(RawData.Element("id").Value); }
            set { RawData.SetElementValue("id", value); }
        }
        /// <summary>
        /// Url string to use for next CRUD operation
        /// </summary>
        public string Url
        {
            get { return string.Format("/cards/{0}.xml", Number); }
        }
        /// <summary>
        /// Card description
        /// </summary>
        public string Description
        {
            get { return RawData.Element("description").Value; }
            set { RawData.SetElementValue("description", value); }
        }
        /// <summary>
        /// Card type (see Mingle schema)
        /// </summary>
        public string Type
        {
            get { return RawData.Element("card_type").Value; }
            set { RawData.SetElementValue("card_type", value); }
        }
        /// <summary>
        /// Url for the card type
        /// </summary>
        public string CardTypeUrl
        {
            get { return RawData.Element("card_type").Attribute("url").Value; }
            set { RawData.Element("card_type").SetAttributeValue("name", value); }
        }
        /// <summary>
        /// Card Number
        /// </summary>
        public int Number
        {
            get { return int.Parse(RawData.Element("number").Value); }
            set { RawData.SetElementValue("number", value); }
        }
        /// <summary>
        /// Project name, e.g. Blue Diamond
        /// </summary>
        public string ProjectName
        {
            get { return RawData.Element("project").Element("name").Value; }
            set { RawData.Element("project").SetElementValue("identifier", value); }
        }
        /// <summary>
        /// Project Identifier as used in HTML, e.g. blue_diamond
        /// </summary>
        public string ProjectId
        {
            get { return RawData.Element("project").Element("identifier").Value; }
            set { RawData.Element("project").SetElementValue("identifier", value); }
        }
        /// <summary>
        /// URL (URI) used to retrieve the project from Mingle
        /// </summary>
        public string ProjectUrl
        {
            get { return RawData.Element("project").Attribute("url").Value; }
            set { RawData.Element("project").SetAttributeValue("name", value); }
        }
        /// <summary>
        /// Mingle card version
        /// </summary>
        public string Version
        {
            get { return RawData.Element("version").Value; }
            set { RawData.SetElementValue("version", value); }
        }
        /// <summary>
        ///  Card rank
        /// </summary>
        public int ProjectCardRank
        {
            get { return int.Parse(RawData.Element("project_card_rank").Value); }
            set { RawData.SetElementValue("project_card_rank", value); }
        }
        /// <summary>
        /// Date the card was created
        /// </summary>
        public DateTime CreatedOn
        {
            get { return Convert.ToDateTime(RawData.Element("created_on").Value); }
            set { RawData.SetElementValue("created_on", value); }
        }
        /// <summary>
        /// Date the card was last changed
        /// </summary>
        public DateTime ModifiedOn
        {
            get { return Convert.ToDateTime(RawData.Element("modified_on").Value); }
            set { RawData.SetElementValue("modified_on", value); }
        }
        /// <summary>
        /// The last user login to change the card
        /// </summary>
        public string ModifiedByLogin
        {
            get { return RawData.Element("modified_by").Element("login").Value; }
            set { RawData.Element("modified_by").SetElementValue("login", value); }
        }
        /// <summary>
        /// Url for the user that modified the card
        /// </summary>
        public string ModifiedByUrl
        {
            get { return RawData.Element("modified_by").Attribute("url").Value; }
            set { RawData.Element("modified_by").SetAttributeValue("url", value); }
        }
        /// <summary>
        /// The user login that created the card
        /// </summary>
        public string CreatedByLogin
        {
            get { return RawData.Element("created_by").Element("login").Value; }
            set { RawData.Element("created_by").SetElementValue("login", value); }
        }
        /// <summary>
        /// Url for the user that created the card
        /// </summary>
        public string CreatedByUrl
        {
            get { return RawData.Element("created_by").Attribute("url").Value; }
            set { RawData.Element("created_by").SetAttributeValue("url", value); }
        }
        /// <summary>
        /// The name of the user who last modified the card
        /// </summary>
        public string ModifiedByName
        {
            get { return RawData.Element("modified_by").Element("name").Value; }
            set { RawData.Element("modified_by").SetElementValue("name", value); }
        }
        /// <summary>
        /// The name of the user who created the card
        /// </summary>
        public string CreatedByName
        {
            get { return RawData.Element("created_by").Element("name").Value; }
            set { RawData.Element("created_by").SetElementValue("name", value); }
        }
        #endregion

        /// <summary>
        /// Returns an XElement backing this object.
        /// </summary>
        public XElement RawData { get; private set; }

        /// <summary>
        /// Constructs a Mingle Card object
        /// </summary>
        public MingleCard()
        {
            CreatedByLogin = "";
            CreatedByName = "";
            CreatedByUrl = "";
            CreatedOn = DateTime.Now;
            Description = "";
            Id = 0;
            ModifiedByLogin = "";
            ModifiedByName = "";
            ModifiedByUrl = "";
            ModifiedOn = DateTime.Now;
            Name = "";
            Number = -1;
            ProjectCardRank = 1;
            ProjectId = "";
            ProjectName = "";
            ProjectUrl = "";
            Type = "";
            Version = "1";
        }

        /// <summary>
        /// Constructs a Mingle Card object
        /// </summary>
        /// <param name="card">XML for a card</param>
        /// <param name="project">Mingle project</param>
        public MingleCard(string card, MingleProject project)
        {
            RawData = XElement.Parse(card);
            PostData = new Collection<string>();
            _project = project;
        }


        /// <summary>
        /// A list of card properties
        /// </summary>
        public MingleCardPropertyCollection CardProperties
        { 
            get
            {
                return new MingleCardPropertyCollection(_project).Parse(RawData.Element("properties"));
            }
        }

        /// <summary>
        /// A list of transitions for this card
        /// </summary>
        public SortedList<string, MingleTransition> Transitions
        // TODO Should join with transition definitions
        {
            get
            {
                _transitions.Clear();
                foreach (var t in from MingleTransition t in _project.Transitions.Values where Type == t.CardTypeName select t)
                {
                    _transitions.Add(t.Name, t);
                }

                return _transitions;
            }
        }

        /// <summary>
        /// List of fields changing on Update
        /// </summary>
        /// <remarks>
        /// It is recommended you use AddField() and AddProperty(), which properly
        /// format data in this list.
        /// </remarks>
        public Collection<string> PostData { get; set; }

        /// <summary>
        /// Adds a field to the PostData for subsequent use in POST operations.
        /// </summary>
        /// <param name="name">Name of the field in the card</param>
        /// <param name="value">Value of the data</param>
        public void AddCardAttributeFilterToPostData(string name, string value)
        {
            PostData.Add(string.Format(CultureInfo.InvariantCulture, "card[{0}]={1}", name, value));
        }

        /// <summary>
        /// Adds a property to the PostData for subsequent use in POST operations.
        /// </summary>
        /// <param name="name">Name of the property in the card</param>
        /// <param name="value">Value of the property</param>
        /// <remarks>
        /// Property data is actually a pair of list elements. One for the name and one for the value.
        /// </remarks>
        public void AddPropertyFilterToPostData(string name, string value)
        {
            var nameParam = string.Format(@"card[properties][][name]={0}", name);
            PostData.Add(nameParam);

            var valueParam = string.Format(@"card[properties][][value]={0}", value);
            PostData.Add(valueParam);
        }

        /// <summary>
        /// Updates the persisted instance of this Card with properties associated with this object
        /// </summary>
        public void Update()
        {
            try
            {
                RawData = XElement.Parse(_project.Mingle.Put(ProjectId, Url, PostData).Body);
                PostData.Clear();
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }
        }
    }
}