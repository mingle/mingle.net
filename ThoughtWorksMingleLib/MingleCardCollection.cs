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
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Serialization;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    ///<summary>
    /// Set of Mingle cards
    ///</summary>
    [Serializable]
    public class MingleCardCollection : ObservableCollection<MingleCard>, IMingleXmlObjectCollection
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
        /// Constructs a new MingleCardCollection
        /// </summary>
        /// <param name="project"></param>
        public MingleCardCollection (MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// Fetch a single card
        /// </summary>
        /// <param name="cardNumber">Card Number (not the Card Id)</param>
        public object Parse(int cardNumber)
        {
            try
            {
                TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Loading the ResponseStream");
                var response = Project.Mingle.Get(ProjectId, string.Format(CultureInfo.InvariantCulture, "/cards/{0}.xml", cardNumber));

                Add(new MingleCard(response, Project));

                return this;

            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }
        }

        #region Get a CardSet

        /// <summary>
        /// Populates a Card Set using the user, project and host in settings
        /// </summary>
        public object Parse()
        {
            return Parse(new Collection<string>());
        }

        /// <summary>
        /// Populate the CardSet from the url
        /// </summary>
        /// <param name="filters">Filters to apply to this request</param>
        public object Parse(Collection<string> filters)
        {
            try
            {
                var more = true;
                TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Loading the ResponseStream");
                Clear();
                var page = 0;
                filters.Add("");
                while (more)
                {
                    page++;
                    filters[filters.Count - 1] = "page=" + page.ToString();
                    var begin = DateTime.Now.Ticks;
                    var response = Project.Mingle.Get(ProjectId, "/cards.xml", filters);
                    var end = DateTime.Now.Ticks;
                    var span = new TimeSpan(end - begin);
                    TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Parsing page " + page.ToString() + "took " + span.TotalMilliseconds + " milliseconds including Web server round trip for " + response.Length + " characters of data.");
                    more = FillTheCardCollection(response);
                }
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }

            return this;

        }

        private bool FillTheCardCollection(string response)
        {
            var count = 0;
            foreach (var e in XElement.Parse(response).Elements("card"))
            {
                Add(new MingleCard(e.ToString(), Project));
                count++;
            }

            return count < 25 ? false : true;
        }

        #endregion

    }
}