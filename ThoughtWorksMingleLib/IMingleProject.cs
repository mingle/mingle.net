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

using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Interface for MingleProject supporting project-contextual methods
    /// </summary>
    public interface IMingleProject
    {
        /// <summary>
        /// Return cards from Mingle
        /// </summary>
        /// <param name="filters">Filters to be applied to the query</param>
        /// <returns></returns>
        MingleCardCollection GetCards(Collection<string> filters);

        /// <summary>
        /// Gets the card types for this project
        /// </summary>
        /// <returns></returns>
        MingleCardTypeCollection GetCardTypes();

        /// <summary>
        /// Gets the transitions for this project
        /// </summary>
        /// <returns></returns>
        MingleTransitionCollection GetTransitions();

        /// <summary>
        /// Gets the team members for this project
        /// </summary>
        /// <returns></returns>
        MingleProjectMemberCollection GetTeam();

        /// <summary>
        /// Gets the property definitions for this project
        /// </summary>
        /// <returns></returns>
        MinglePropertyDefinitionCollection GetProperties();

        /// <summary>
        /// Gets the favorites for this project
        /// </summary>
        /// <returns></returns>
        MingleFavoriteCollection GetFavorites();

        /// <summary>
        /// Get the list of property definitions for properties that are not restricted to transition-only
        /// </summary>
        /// <param name="transitionOnly"></param>
        /// <returns></returns>
        Hashtable GetCardValuedProperties(bool transitionOnly);

        /// <summary>
        /// Geven a card number get the card type
        /// </summary>
        /// <param name="cardNumber"></param>
        /// <returns></returns>
        string GetCardType(string cardNumber);

        /// <summary>
        /// Returns card of the type indicated by cardType
        /// </summary>
        /// <param name="cardType">Card_type of cards to be returned</param>
        /// <returns></returns>
        MingleCardCollection GetCardsOfType(string cardType);

        /// <summary>
        /// Execute an MQL request and return results in a MingleCardCollection
        /// </summary>
        /// <param name="mql">MQL query string</param>
        /// <returns>MingleCardCollection</returns>
        /// <exception cref="System.Exception">May throw an exception bubbling up from below</exception>
        XElement ExecMql(string mql);

        /// <summary>
        /// Returns a MingleCardCollection for a view 
        /// </summary>
        /// <param name="name">Name of the view (favorite)</param>
        /// <returns></returns>
        MingleCardCollection GetView(string name);

        /// <summary>
        /// Given a macro, return the renderable HTML
        /// </summary>
        /// <param name="macro">Macro text</param>
        /// <returns>HTML</returns>
        string RunMacro(string macro);

        /// <summary>
        /// Creates a new card
        /// </summary>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        MingleCard CreateCard(string type, string name);

        /// <summary>
        /// The project identifier
        /// </summary>
        string ProjectId { get; }

        /// <summary>
        /// Property definitions for this project
        /// </summary>
        MinglePropertyDefinitionCollection Properties { get; }

        /// <summary>
        /// Transition collection for this project
        /// </summary>
        MingleTransitionCollection Transitions { get; }

        /// <summary>
        /// Mingle server interface for this project
        /// </summary>
        IMingleServer Mingle { get; }

        /// <summary>
        /// For testing. Given XElement with results from ExecMql, counts the results.
        /// </summary>
        /// <param name="results"></param>
        /// <returns></returns>
        int ResultsCount(XElement results);

        /// <summary>
        /// Returns card given a card number
        /// </summary>
        /// <param name="cardNumber"></param>
        /// <returns></returns>
        MingleCard GetCard(int cardNumber);

        /// <summary>
        /// Returns murmurs from Mingle
        /// </summary>
        /// <returns></returns>
        IEnumerable<MingleMurmur> GetMurmurs();

        /// <summary>
        /// Sends a murmur to Mingle
        /// </summary>
        /// <param name="murmur"></param>
        MingleMurmur SendMurmur(string murmur);
    }
}