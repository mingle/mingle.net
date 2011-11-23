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

using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    ///<summary>
    /// A class to handle a collection of MingleFavorite
    ///</summary>
    public class MingleFavoriteCollection : Dictionary<string, MingleFavorite>, IMingleXmlObjectCollection
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
        /// Constructs a new MingleFavoriteCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleFavoriteCollection(MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// Refreshes the list of Favorites
        /// </summary>
        public object Parse()
        {
            try
            {
                XElement.Parse(Project.Mingle.Get(ProjectId, "/favorites.xml")).
                    Elements("favorite").ToList().ForEach(f => Add(f.Element("name").
                        Value, new MingleFavorite(f.ToString(), Project)));
            }
            catch (XmlException ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
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
            XElement.Parse(xml).Elements("favorite").ToList().ForEach(f => Add(f.Element("name").Value, new MingleFavorite(f.ToString(), Project)));
            return this;
        }
    }
}