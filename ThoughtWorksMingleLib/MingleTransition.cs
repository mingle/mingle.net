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
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A Mingle Transition
    /// </summary>
    public class MingleTransition
    {

        /// <summary>
        /// MingleProject associated with this object
        /// </summary>
        public MingleProject Project { get; private set; }

        /// <summary>
        /// Returns an XElement backing this object
        /// </summary>
        public XElement RawData { get; private set; }

        /// <summary>
        /// Constructs a new Transition
        /// </summary>
        public MingleTransition(string transitionXml, MingleProject project)
        {
            RawData = XElement.Parse(transitionXml);
            Project = project;
        }

        #region Properties

        ///<summary>
        /// One line short name
        ///</summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set {RawData.SetElementValue("name", value);}
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
        /// transition_execution_url
        /// </summary>
        public string Url
        {
            get { return RawData.Element("transition_execution_url").Value; }
            set { RawData.SetElementValue("transition_execution_url", value); }
        }

        /// <summary>
        /// require_comment
        /// </summary>
        public bool RequireComment
        {
            get { return bool.Parse(RawData.Element("require_comment").Value); }
            set { RawData.SetElementValue("require_comment", value); }
        }

        /// <summary>
        /// user_input_required
        /// </summary>
        public Collection<MinglePropertyDefinition> RequiredUserInput
        {
            get
            {
                var d = new Collection<MinglePropertyDefinition>();
                RawData.Element("user_input_required").Elements("property_definition").ToList().
                    ForEach(p => d.Add(Project.Properties[p.Element("name").Value]));
                return d;
            }
        }

        /// <summary>
        /// user_input_optional
        /// </summary>
        public Collection<MinglePropertyDefinition> OptionalUserInput
        {
            get
            {
                var d = new Collection<MinglePropertyDefinition>();
                RawData.Element("user_input_optional").Elements("property").ToList().
                    ForEach(p => d.Add(Project.Properties[p.Element("name").Value]));
                return d;
            }
        }

        /// <summary>
        /// if_card_has_properties
        /// </summary>
        public Collection<MinglePropertyDefinition> IfCardHasProperties
        {
            get
            {
                var d = new Collection<MinglePropertyDefinition>();
                RawData.Element("if_card_has_properties").Elements("property").ToList().
                    ForEach(p => d.Add(Project.Properties[p.Element("name").Value]));
                return d;
            }
        }

        /// <summary>
        /// will_set_card_properties
        /// </summary>
        public Collection<MinglePropertyDefinition> WillSetCardProperties
        {
            get 
            { 
                var d = new Collection<MinglePropertyDefinition>();
                RawData.Element("will_set_card_properties").Elements("property").ToList().
                    ForEach(p => d.Add(Project.Properties[p.Element("name").Value]));
                return d;
            }
        }

        /// <summary>
        /// card_type.name
        /// </summary>
        public string CardTypeName
        {
            get { return RawData.Element("card_type").Element("name").Value; }
            set { RawData.Element("card_type").SetElementValue("name", value); }
        }

        /// <summary>
        /// card_type.url
        /// </summary>
        public string CardTypeUrl
        {
            get { return RawData.Element("card_type").Attribute("url").Value; }
            set { RawData.Element("card_type").SetAttributeValue("url", value); }
        }

        #endregion

        /// <summary>
        /// Performs the POST operation to Mingle
        /// </summary>
        /// <remarks>
        /// This method POSTs the Transition on the Card indicated by cardNumber.
        /// </remarks>
        /// <param name="cardNumber"></param>
        public void Update(int cardNumber)
        {
            var postData = new Collection<string>
                               {string.Format("transition_execution[card]={0}", cardNumber)};

            try
            {
                var uri = new Uri(Url);
                var u = uri.Segments[uri.Segments.Count() - 1];
                Project.Mingle.Post(Project.ProjectId, u, postData);
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }
        }
    }
}