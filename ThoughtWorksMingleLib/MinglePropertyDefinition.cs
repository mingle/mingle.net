﻿//
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

using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A wrapper for a Mingle card property
    /// </summary>
    [System.Serializable]
    public class MinglePropertyDefinition
    {
        private readonly XElement _propertyDefinition;
        private readonly Hashtable _hashed = new Hashtable();

        ///<summary>
        /// Constructs a new MinglePropertyDefinition from the XML of a property_definition
        /// returned by Mingle's API
        ///</summary>
        public MinglePropertyDefinition(string propertyDefinitionXml)
        {
            _propertyDefinition = XElement.Parse(propertyDefinitionXml);
            _propertyDefinition.Elements().ToList().ForEach(e => _hashed.Add(e.Name.LocalName, e));
        }

        #region Properties derived from Mingle's property_definition object

        /// <summary>
        /// Property Id
        /// </summary>
        public int Id
        {
            get { return int.Parse(_propertyDefinition.Element("id").Value); }
        }

        /// <summary>
        /// Property name
        /// </summary>
        public string Name
        {
            get { return _propertyDefinition.Element("name").Value; }
        }

        /// <summary>
        ///  Gets or sets description
        /// </summary>
        public string Description
        {
            get { return _propertyDefinition.Element("description").Value; }
        }

        /// <summary>
        /// gets or sets data_type
        /// </summary>
        public string DataType
        {
            get { return _propertyDefinition.Element("data_type").Value; }
        }

        /// <summary>
        /// Gets or sets numeric
        /// </summary>
        public bool IsNumeric
        {
            get { return bool.Parse(_propertyDefinition.Element("is_numeric").Value); }
        }

        /// <summary>
        /// Gets or sets hidden
        /// </summary>
        public bool Hidden
        {
            get { return bool.Parse(_propertyDefinition.Element("hidden").Value); }
        }

        /// <summary>
        /// Gets or sets restricted
        /// </summary>
        public bool Restricted
        {
            get { return bool.Parse(_propertyDefinition.Element("restricted").Value); }
        }

        /// <summary>
        /// Gets or sets transition_only
        /// </summary>
        public bool IsTransitionOnly
        {
            get { return bool.Parse(_propertyDefinition.Element("transition_only").Value); }
        }

        /// <summary>
        /// Gets or sets the project name
        /// </summary>
        public string ProjectName
        {
            get { return _propertyDefinition.Element("project").Element("name").Value; }
        }

        /// <summary>
        /// Gets or sets the project identifier
        /// </summary>
        public string ProjectId
        {
            get { return _propertyDefinition.Element("project").Element("identifier").Value; }
        }

        /// <summary>
        /// Gets or sets the column_name
        /// </summary>
        public string ColumnName
        {
            get { return _propertyDefinition.Element("column_name").Value; }
        }

        /// <summary>
        /// Gets or sets the position
        /// </summary>
        public int Position
        {
            get { return int.Parse(_propertyDefinition.Element("position").Value); }
        }

        /// <summary>
        /// Gets or sets the property_values_description
        /// </summary>
        public string PropertyValuesDescription
        {
            get { return _propertyDefinition.Element("property_values_description").Value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public List<string> PropertyValueDetails
        {
            get
            {
                var values = new List<string>();

                if (_hashed.Contains("property_value_details"))
                { 
                    _propertyDefinition.Element("property_value_details").Elements("property_value").ToList().ForEach(
                            e => values.Add(e.Element("value").Value));
                }

                return values;
                    
            }
        }

        /// <summary>
        /// The list of card_type to which this Property applies
        /// </summary>
        public SortedList<string, string> CardTypes
        {
            get
            {
                var list = new SortedList<string, string>();
                foreach (var cardType in _propertyDefinition.Element("card_types").Elements("card_type"))
                {
                    list.Add(cardType.Element("name").Value, cardType.ToString());
                }
                return list;
            }
        }

        #endregion

        #region Dynamically evaluated properties
        /// <summary>
        /// If Property.Type is card then this is the Url of the value card.
        /// </summary>
        public string CardUrl { get; set; }

       /// <summary>
        /// Zero-based index of the current value of the Property among the PropertyValueDetails collection
        /// </summary>
        public int CurrentItem { get; set; }

        /// <summary>
        /// Indicates whether this property is single or set-valued
        /// </summary>
        public bool IsSetValued
        {
            get
            {
                switch (PropertyValuesDescription.ToLower())
                {
                    case "any card":
                    case "any card used in tree":
                    case "automatically generated from the team list":
                    case "managed text list":
                    case "managed number list":
                        return true;
                }
                return false;
            }
        }

        /// <summary>
        /// Indicates whether this property is formula-valued
        /// </summary>
        public bool IsFormula
        {
            get { return PropertyValuesDescription.ToLower() == "formula"; }
        }

        /// <summary>
        /// Indicates whether the property value is a set of cards
        /// </summary>
        public bool IsCardValued
        {
            get { return PropertyValuesDescription.ToLower().StartsWith("any card"); }
        }

        /// <summary>
        /// Indicates whether the property value is a set of team members
        /// </summary>
        public bool IsTeamValued
        {
            get { return PropertyValuesDescription.ToLower().Contains("team list"); }
        }

        #endregion

    }
}