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
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
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
        /// Count of the result tags returned from a MQL query
        /// </summary>
        /// <param name="results"></param>
        /// <returns></returns>
        public int ResultsCount(XElement results)
        {
            return results.Elements("result").Count();
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
        /// Returns card of the type indicated by cardType
        /// </summary>
        /// <param name="cardType"></param>
        /// <returns></returns>
        public MingleCardCollection GetCardsOfType(string cardType)
        {
            var filter = new MingleFilter {Name = "Type", Condition = "=", Value = cardType};
            return GetCards(new Collection<string> { filter.FilterFormatString, "page=all" });
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
        public XElement ExecMql(string mql)
        {
            var url = "/cards/execute_mql.xml";
            var data = new Collection<string>{string.Format("mql={0}",mql)};
            var result = _mingle.Get(ProjectId, url, data);
            return XElement.Parse(result);
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

        /// <summary>
        /// Returns a card given a card number from this project
        /// </summary>
        /// <param name="number"></param>
        /// <returns></returns>
        public MingleCard GetCard(int number)
        {
            var url = string.Format("cards/{0}.xml", number);
            return new MingleCard(Mingle.Get(ProjectId, url), this);
        }

        /// <summary>
        /// Returns murmurs from Mingle
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MingleMurmur> GetMurmurs()
        {
            var url = string.Format("/murmurs.xml");

            return (from m in XElement.Parse(Mingle.Get(ProjectId, url)).Elements("murmur").ToList()
                    where null != m.Element("author")
                    where null != m.Element("author").Element("name")
                    where null != m.Element("created_at")
                    where null != m.Element("body")
                    select new MingleMurmur(m)).ToList();

        }

        /// <summary>
        /// Sends a murmur to Mingle
        /// </summary>
        /// <param name="murmur"></param>
        public void SendMurmur(string murmur)
        {
            Mingle.Post(ProjectId, "/murmurs.xml", new Collection<string> { string.Format(CultureInfo.InvariantCulture, "murmur[body]={0}", murmur) });
        }

        /// <summary>
        /// Creates a new card
        /// </summary>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <exception cref="NotImplementedException"></exception>
        public MingleCard CreateCard(string type, string name)
        {
            var data = new Collection<string>
                           {
                               string.Format("card[card_type_name]={0}", type), 
                               string.Format("card[name]={0}", name)
                           };
            var response = Mingle.Post(ProjectId, "/cards.xml", data);
            var segments = new Uri(response.Headers["Location"]).Segments;
            var sb = new StringBuilder(segments[segments.Count() - 2]);
            sb.Append(segments[segments.Count() - 1]);
            var card = Mingle.Get(ProjectId, sb.ToString());
            return new MingleCard(card, this);
        }
    }
}