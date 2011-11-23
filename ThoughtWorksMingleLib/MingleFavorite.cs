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
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Class to model a Mingle "favorite" (also known as a "View")
    /// </summary>
    /// <remarks>
    /// A MingleFavorite object has the proeprties of a View in Mingle.
    /// It is also a collection of cards references by the View.
    /// </remarks>
    public class MingleFavorite 
    {
        /// <summary>
        /// Returns an XElement with the XML for this Mingle view
        /// </summary>
        public XElement RawData { get; private set; }

        /// <summary>
        /// The MingleProject associated with this MingleFavorite
        /// </summary>
        public MingleProject Project { get; private set; }

        #region Properties
        /// <summary>
        /// Favorite Id
        /// </summary>
        public int Id
        {
            get { return int.Parse(RawData.Element("id").Value); }
            set { RawData.SetElementValue("id", value); }
        }

        /// <summary>
        /// Favorite Name
        /// </summary>
        public string Name
        {
            get { return RawData.Element("name").Value; }
            set { RawData.SetElementValue("name", value); }
        }

        /// <summary>
        ///  Favorite Project Name
        /// </summary>
        public string ProjectName
        {
            get { return RawData.Element("project").Element("name").Value; }
            set { RawData.Element("project").SetElementValue("name", value); }
        }

        /// <summary>
        ///  Favorite Project Id
        /// </summary>
        public string ProjectId
        {
            get { return RawData.Element("project").Element("identifier").Value; }
            set { RawData.Element("project").SetElementValue("identifier", value); }
        }

        /// <summary>
        ///  Favorite Type
        /// </summary>
        public string FavoritedType
        {
            get { return RawData.Element("favorited_type").Value; }
            set { RawData.SetElementValue("favorited_type", value); }
        }

        /// <summary>
        /// Favorite Tab View
        /// </summary>
        public bool TabView
        {
            get { return bool.Parse(RawData.Element("tab_view").Value); }
            set { RawData.SetElementValue("tab_view", value); }
        } 
        #endregion

        /// <summary>
        /// Constructs a new MingleFavorite from XML
        /// </summary>
        /// <param name="favorite">Favorite XML</param>
        /// <param name="project"></param>
        public MingleFavorite (string favorite, MingleProject project)
        {
            RawData = XElement.Parse(favorite);
            Project = project;
        }

        /// <summary>
        /// Constructs a new Favorite
        /// </summary>
        /// <param name="favorite"></param>
        public MingleFavorite(XElement favorite)
        {
            RawData = favorite;
        }
        
        /// <summary>
        /// Refreshes the list of cards indicated by this Favorite
        /// </summary>
        public MingleCardCollection GetCards()
        {
            var filters = new Collection<string>
                              {
                                  new MingleFilter
                                      {
                                          Name = "view",
                                          Value = Name
                                      }.FavoriteString,
                                  "page=all"
                              };


            var cards = new MingleCardCollection(Project);

            try
            {
                TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Loading the ResponseStream");
                var response = XElement.Parse(Project.Mingle.Get(ProjectId, "/cards.xml", filters));
                foreach (var e in response.Elements("card"))
                {
                    cards.Add(new MingleCard(e.ToString(), Project));
                }
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }

            return cards;
        }
    }
}