//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System;
using System.Collections;
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
    /// MingleProject class has properties for collections that are part of projects
    /// </summary>
    /// <remarks>
    /// Projects have a number of projects that all comprise context. The MingleProject class includes
    /// properties for singletons and collections of things like Iterations and CardTypes. These collections
    /// are bound with data using a lazy binding approach. This ensures that creating a MingleProject object
    /// is a lightweight event. Collections are populated with data on first use.
    /// </remarks>
    public class MingleProject : IMingleProject
    {
        private static MingleProjectMemberCollection _team;
        private static MingleFavoriteCollection _favorites;
        private static MinglePropertyDefinitionCollection _properties;
        private static MingleTransitionCollection _transitions;
        private static MingleCardTypeCollection _cardTypes;
        private static readonly Hashtable CardSetPropertyValues = new Hashtable();
        private static readonly Hashtable CardTypeNames = new Hashtable();
        private readonly IMingleServer _mingle;

        #region Properties
        /// <summary>
        /// MingleServer for the Mingle instance associated with this proejct
        /// </summary>
        public IMingleServer Mingle
        {
            get { return _mingle; }
        }
        /// <summary>
        /// Mingle users for this project
        /// </summary>
        public MingleProjectMemberCollection Team
        {
            get
            {
                if (null == _team) GetTeam();
                return _team;
            }
        }

        /// <summary>
        /// Mingle favorites/views for this project
        /// </summary>
        public MingleFavoriteCollection Favorites
        {
            get
            {
                if (null == _favorites) GetFavorites();
                return _favorites;
            }
        }

        /// <summary>
        /// Mingle property definitions for this project
        /// </summary>
        public MinglePropertyDefinitionCollection Properties
        {
            get
            {
                if (null == _properties) GetProperties();
                return _properties;
            }
        }

        /// <summary>
        /// Transitions for this project
        /// </summary>
        public MingleTransitionCollection Transitions
        {
            get
            {
                if (null == _transitions) GetTransitions();
                return _transitions;
            }
        }

        /// <summary>
        /// Mingle project identifier
        /// </summary>
        public string ProjectId { get; set; }

        /// <summary>
        /// URL for the project
        /// </summary>
        public string Url
        {
            get
            {
                return string.Format("/api/v2/projects/{0}", ProjectId);
            }
        }

        /// <summary>
        /// Card Types for this project
        /// </summary>
        public MingleCardTypeCollection CardTypes
        {
            get
            {
                if (null == _cardTypes) GetCardTypes();
                return _cardTypes;
            }
        }
        
        #endregion

        /// <summary>
        /// Constructs a new MingleProject
        /// </summary>
        /// <param name="projectId">An existing Mingle project_id</param>
        /// <param name="mingle">Mingle server</param>
        public MingleProject(string projectId, IMingleServer mingle)
        {
            ProjectId = projectId;
            _mingle = mingle;
        }

        ///<summary>
        /// Clears card set property values from the cache
        ///</summary>
        public void ClearCardSetPropertyValues()
        {
            CardSetPropertyValues.Clear();
        }

        /// <summary>
        /// Get the CartTypes property results set
        /// </summary>
        public MingleCardTypeCollection GetCardTypes()
        {
            var me = new StackFrame().GetMethod().Name;
            var start = DateTime.Now;

            try
            {
                _cardTypes = new MingleCardTypeCollection(this).Parse() as MingleCardTypeCollection;
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            var stop = DateTime.Now;
            var elapsed = stop - start;
            TraceLog.WriteLine(new StackFrame().GetMethod().Name,
                               string.Format("Elapsed time binding MingleProject.GetCardTypes: {0}",
                                             elapsed.TotalSeconds));
            return _cardTypes;
        }

        /// <summary>
        /// Get the Transitions property from the Mingle server
        /// </summary>
        public MingleTransitionCollection GetTransitions()
        {
            var me = new StackFrame().GetMethod().Name;
            var start = DateTime.Now;

            try
            {
                _transitions = new MingleTransitionCollection(this).Parse() as MingleTransitionCollection;

            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            var stop = DateTime.Now;
            var elapsed = stop - start;
            TraceLog.WriteLine(new StackFrame().GetMethod().Name,
                               string.Format("Elapsed time binding MingleProject.GetTransitions: {0}",
                                             elapsed.TotalSeconds));

            return _transitions;
        }

        /// <summary>
        /// Get list of team members for the project
        /// </summary>
        public MingleProjectMemberCollection GetTeam()
        {
            var me = new StackFrame().GetMethod().Name;
            var start = DateTime.Now;

            try
            {
                var response = _mingle.Get(ProjectId, "/users.xml");
                _team = new MingleProjectMemberCollection(this);
                _team.Parse();
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            var stop = DateTime.Now;
            var elapsed = stop - start;
            TraceLog.WriteLine(new StackFrame().GetMethod().Name,
                               string.Format("Elapsed time binding MingleProject.GetTeam: {0}", elapsed.TotalSeconds));
            return _team;
        }

        /// <summary>
        /// Get property definitions for the project
        /// </summary>
        public MinglePropertyDefinitionCollection GetProperties()
        {
            var me = new StackFrame().GetMethod().Name;
            var start = DateTime.Now;

            try
            {
                // Get all the property definitions
                _properties = new MinglePropertyDefinitionCollection(this);
                _properties.Parse();
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            var stop = DateTime.Now;
            var elapsed = stop - start;
            TraceLog.WriteLine(new StackFrame().GetMethod().Name,
                               string.Format("Elapsed time binding MingleProject.GetProperties: {0}",
                                             elapsed.TotalSeconds));
            return _properties;

        }

        /// <summary>
        /// Get favorites
        /// </summary>
        public MingleFavoriteCollection GetFavorites()
        {
            var me = new StackFrame().GetMethod().Name;
            var start = DateTime.Now;

            try
            {
                var response = _mingle.Get(ProjectId, "/favorites.xml");
                _favorites = new MingleFavoriteCollection(this);
                _favorites.Parse(response.ToString());
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            var stop = DateTime.Now;
            var elapsed = stop - start;
            TraceLog.WriteLine(new StackFrame().GetMethod().Name,
                               string.Format("Elapsed time binding MingleProject.GetFavorites: {0}",
                                             elapsed.TotalSeconds));
            return _favorites;
        }

        /// <summary>
        /// Get the list of property definitions for properties that are not restricted to transition-only
        /// </summary>
        /// <param name="transitionOnly"></param>
        /// <returns></returns>
        public Hashtable GetCardValuedProperties(bool transitionOnly)
        {
            var retval = new Hashtable();

            if (null == _properties)
            {
                GetProperties();
            }

            foreach (var p in from MinglePropertyDefinition p in Properties.Values
                                                   where
                                                       p.DataType.ToLower() == "card" &&
                                                       !p.IsTransitionOnly == transitionOnly
                                                   select p)
            {
                retval.Add(p.Name, p);
            }

            return retval;
        }

        /// <summary>
        /// Returns the card_type value
        /// </summary>
        /// <param name="cardNumber"></param>
        /// <returns></returns>
        public string GetCardType(string cardNumber)
        {
            var cards = new MingleCardCollection(this);
            cards.Parse(Convert.ToInt32(cardNumber));
            return cards.Count == 0 ? string.Empty : cards[0].Type;
        }

        /// <summary>
        /// Returns a CardSet derived from the set of cards of the same type as the card associated with cardNumber.
        /// </summary>
        public MingleCardCollection GetIndirectCardsByNumber(string cardNumber)
        {
            return GetIndirectCardsByNumber(cardNumber, false);
        }

        /// <summary>
        /// Returns a CardSet derived from the set of cards of the same type as the card associated with cardNumber.
        /// </summary>
        /// <param name="cardNumber">Card number from which to obtain the card type</param>
        /// <param name="forceRead">Always refresh the card set</param>
        /// <returns></returns>
        public MingleCardCollection GetIndirectCardsByNumber(string cardNumber, bool forceRead)
        {
            var me = new StackFrame().GetMethod().Name;

            if (string.IsNullOrEmpty(cardNumber)) return new MingleCardCollection(this);

            try
            {
                string cardType;

                // If we have seen this cardNumber before then we can save a bit of time by 
                // recalling its associated card_type from a cache.
                if (CardTypeNames.Contains(cardNumber))
                    cardType = (string) CardTypeNames[cardNumber];
                else
                {
                    cardType = GetCardType(cardNumber);
                    CardTypeNames.Add(cardNumber, cardType);
                }

                // If we have a cache and there is no demand to refill it, then hand it back.
                if (!forceRead && CardSetPropertyValues.Contains(cardType))
                    return (MingleCardCollection) CardSetPropertyValues[cardType];

                var cards = new MingleCardCollection(this);

                // If we're being asked to fill the cache, or we do not have a cache, then fill it.
                if (forceRead || !CardSetPropertyValues.ContainsKey(cardType))
                {
                    var filter = new MingleFilter {Name = "Type", Condition = "Is", Value = cardType};
                    cards.Parse(new Collection<string> {filter.FilterFormatString, "page=all"});
                }

                if (CardSetPropertyValues.ContainsKey(cardType))
                {
                    CardSetPropertyValues[cardType] = cards;
                }
                else
                {
                    CardSetPropertyValues.Add(cardType, cards);
                }

                return (MingleCardCollection) CardSetPropertyValues[cardType];
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }
        }

        /// <summary>
        /// Returns card of the type indicated by cardType
        /// </summary>
        /// <param name="cardType"></param>
        /// <param name="forceRead"></param>
        /// <returns></returns>
        public MingleCardCollection GetIndirectCardsByTypeName(string cardType, bool forceRead)
        {
            var me = new StackFrame().GetMethod().Name;

            if (string.IsNullOrEmpty(cardType)) return new MingleCardCollection(this);

            try
            {
                var cards = new MingleCardCollection(this);

                // If we're being asked to fill the cache, or we do not have a cache, then fill it.
                if (forceRead || !CardSetPropertyValues.ContainsKey(cardType))
                {
                    var filter = new MingleFilter {Name = "Type", Condition = "Is", Value = cardType};
                    cards.Parse(new Collection<string> {filter.FilterFormatString, "page=all"});
                }

                if (!CardSetPropertyValues.ContainsKey(cardType))
                    CardSetPropertyValues.Add(cardType, cards);

                return (MingleCardCollection) CardSetPropertyValues[cardType];
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }
        }

        /// <summary>
        /// Returns all the cards
        /// </summary>
        /// <returns></returns>
        public MingleCardCollection GetCards()
        {
            return GetCards(new Collection<string>() {"page=all"});
        }

        /// <summary>
        /// Given filter criteria, return a collection of cards
        /// </summary>
        /// <param name="filters">MingleFilter describing selection criteria</param>
        /// <returns>MingleCardCollection object</returns>
        public MingleCardCollection GetCards(Collection<string> filters)
        {
            var cards = new MingleCardCollection(this);
            cards.Parse(filters);
            return cards;
        }

        /// <summary>
        /// Execute an MQL request and return results in a MingleCardCollection
        /// </summary>
        /// <param name="mql">MQL query string</param>
        /// <returns>MingleCardCollection</returns>
        /// <exception cref="System.Exception">May throw an exception bubbling up from below</exception>
        public XDocument ExecMql(string mql)
        {
            var url = string.Format(CultureInfo.InvariantCulture, "/cards/execute_mql.xml?mql={0}",mql);
            return new XDocument(_mingle.Get(ProjectId, url));
        }

        ///// <summary>
        ///// Execute an MQL request and return results in a MingleCardCollection
        ///// </summary>
        ///// <param name="projectName">Name of the project. If null or empty then the Setting for MingleProject is used</param>
        ///// <param name="mql">MQL query string</param>
        ///// <returns>MingleCardCollection</returns>
        ///// <exception cref="System.Exception">May throw an exception bubbling up from below</exception>
        //public XDocument ExecMql(string projectName, string mql)
        //{
        //    var url = string.Format("/cards/execute_mql.xml?mql={0}", mql);

        //    return XDocument.Load(_mingle.Get(ProjectId, url).GetResponseStream());
        //}

        /// <summary>
        /// Returns a MingleCardCollection for a view 
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public MingleCardCollection GetView(string name)
        {
            var filters = new Collection<string>
                              {
                                  new MingleFilter
                                      {
                                          Name = "view",
                                          Value = name
                                      }.FavoriteString,
                                  "page=all"
                              };


            return GetCards(filters);
        }

        /// <summary>
        /// Given a macro, return the renderable HTML
        /// </summary>
        /// <param name="macro">Macro text</param>
        /// <returns>HTML</returns>
        public string RunMacro(string macro)
        {
            throw new NotImplementedException();
        }
    }
}