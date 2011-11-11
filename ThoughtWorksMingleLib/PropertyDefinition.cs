using System;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Xml;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib.Exceptions
{
    class PropertyDefinition
    {
        #region Attributes

        private MingleCardSet _cardValues;

        /// <summary>
        /// Property Id
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Name as used in the "name" tage
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Name as used in an MQL "result" tag
        /// </summary>
        public string LocalName 
        { 
            get 
            {
                return Name.ToLower().Replace(" ", "_");
            } 
        }

        /// <summary>
        /// Proeprty Value
        /// </summary>
        public string Value { get; set; }

        /// <summary>
        ///  Property Description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Data type of the property
        /// </summary>
        public string DataType { get; set; }

        /// <summary>
        /// Indicates whether the property value is numeric
        /// </summary>
        public bool IsNumeric { get; set; }

        /// <summary>
        /// Indicates whether the property is hidden from the UI
        /// </summary>
        public bool Hidden { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool Restricted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsTransitionOnly { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string ProjectId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string ProjectName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int Position { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string PropertyValuesDescription { get; set; }

        /// <summary>
        /// The list of card_type to which this Property applies
        /// </summary>
        public List<string> CardTypes { get; set; }

        /// <summary>
        /// A collection of values of the property in cases where the collection is a static list
        /// not derived from a dynamic server query.
        /// </summary>
        public Collection<MinglePropertyValue> PropertyValueDetails { get; set; }

        /// <summary>
        /// If Property.Type is card then this is the Url of the value card.
        /// </summary>
        public string CardTypeUrl { get; set; }

        /// <summary>
        /// Bunch of card values for a card-calued property definition
        /// </summary>
        public MingleCardSet CardValues
        {
            get { return _cardValues ?? (_cardValues = GetCards()); }
        }

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
                    case "managed text list":
                        return true;

                    case "managed number list":
                        return true;

                    case "any number":
                        break;

                    case "automatically generated from the team list":
                        return true;

                    case "any date":
                        break;

                    case "formula":
                        break;

                    case "any card used in tree":
                        return true;

                    case "aggregate":
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
            get { return PropertyValuesDescription.ToLower() == "any card used in tree"; }
        }

        /// <summary>
        /// Indicates whether the property value is a set of team members
        /// </summary>
        public bool IsTeamValued
        {
            get { return PropertyValuesDescription.ToLower().Contains("team list"); }
        }

        #endregion

                ///<summary>
        /// Constructs a new MinglePropertyDefinition
        ///</summary>
        public PropertyDefinition()
        {
            CardTypes = new List<string>();
            PropertyValueDetails = new Collection<MinglePropertyValue>();
        }

        /// <summary>
        /// Returns a card set
        /// </summary>
        /// <returns></returns>
        public MingleCardSet GetCards()
        {
            var cards = new MingleCardSet();

            var filter = new MingleFilter { Name = "Type", Condition = "Is", };

            return cards;
        }

        /// <summary>
        /// Parses a property definition
        /// </summary>
        /// <param name="n">XmlElement for the property definition obtained from the Mingle API</param>
        public void Parse(XElement propertyXml)
        {
            string me = new StackFrame().GetMethod().Name;
            TraceLog.WriteLine(me, "Entering...");
            foreach (XElement e in propertyXml.Elements())
            {
                //                TraceLog.WriteLine(me,string.Format("<{0}>{1}", e.Name, e.InnerText));

                switch (e.Name.LocalName)
                {
                    case "id":
                        Id = Convert.ToInt32(e.Value);
                        break;

                    case "name":
                        Name = e.Value;
                        break;

                    case "description":
                        Description = e.Value;
                        break;

                    case "data_type":
                        DataType = e.Value;
                        break;

                    case "is_numeric":
                        IsNumeric = Convert.ToBoolean(e.Value);
                        break;

                    case "hidden":
                        Hidden = Convert.ToBoolean(e.Value);
                        break;

                    case "restricted":
                        Restricted = Convert.ToBoolean(e.Value);
                        break;

                    case "transition_only":
                        IsTransitionOnly = Convert.ToBoolean(e.Value);
                        break;

                    case "project":
                        foreach (XmlNode child in e.ChildNodes)
                        {
                            if (child.Name == "identifier") ProjectId = e.InnerText;
                            if (child.Name == "name") ProjectName = e.InnerText;
                        }
                        break;

                    case "column_name":
                        ColumnName = e.Value;
                        break;

                    case "position":
                        if (!string.IsNullOrEmpty(e.Value))
                            Position = Convert.ToInt32(e.Value);
                        break;

                    case "property_values_description":
                        PropertyValuesDescription = e.Value;
                        break;

                    case "card_types":
                        foreach (XmlNode cardTypeNode in e.ChildNodes)
                            if (cardTypeNode.Name == "card_type")
                                foreach (XmlNode nameNode in cardTypeNode)
                                    if (nameNode.Name == "name")
                                        CardTypes.Add(nameNode.InnerText);
                        break;

                    case "property_value_details":
                        foreach (XElement propertyValue in e.Elements())
                        {
                            try
                            {
                                var pv = new MinglePropertyValue();
                                //                                TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Parsing property_value");
                                pv.Parse(propertyValue);
                                PropertyValueDetails.Add(pv);
                                //                                TraceLog.WriteLine(new StackFrame().GetMethod().Name, string.Format("Parsed  property_value {0}", pv.Id));
                            }
                            catch (XmlException ex)
                            {
                                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                                throw;
                            }
                            catch (ArgumentException ex)
                            {
                                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                                throw;
                            }
                        }
                        break;


                    default:
                        break;
                }
            }
            TraceLog.WriteLine(me, "Leaving...");
        }
    }
}
