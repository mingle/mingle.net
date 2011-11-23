﻿//
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
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Set of Card Transitions
    /// </summary>
    public class MingleTransitionCollection : Dictionary<String, MingleTransition>, IMingleXmlObjectCollection
    {
        /// <summary>
        /// MingleProject associated with this object
        /// </summary>
        public MingleProject Project { get; private set; }

        /// <summary>
        /// Mingle project identifier
        /// </summary>
        public string ProjectId
        {
            get { return Project.ProjectId; }
        }

        /// <summary>
        /// Card number associated with this TransitionSet
        /// </summary>
        public static int CardNumber { get; private set; }

        /// <summary>
        /// Constructs a new MingleTransitionCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleTransitionCollection(MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <exception cref="ArgumentNullException"></exception>
        public object Parse()
        {
            if (string.IsNullOrWhiteSpace(ProjectId)) throw new ArgumentNullException(Resources.ProjectIsRequired);

            return Parse("/transitions.xml");
        }

        /// <summary>
        /// Gets all transitions for a project
        /// </summary>
        /// <param name="cardNumber">Card number. If less than or equal to zero then all transitions for the project are fetched.</param>
        public object Parse(int cardNumber)
        {
            if (string.IsNullOrWhiteSpace(ProjectId)) throw new ArgumentNullException(Resources.ProjectIsRequired);
            CardNumber = cardNumber;

            return (Parse(string.Format(CultureInfo.InvariantCulture, "/cards/{0}/transitions.xml", cardNumber)));
        }

        /// <summary>
        /// Gets the transitions for the url
        /// </summary>
        /// <param name="url">A Mingle url segment of the form /api/v2/projects/...</param>
        private object Parse (string url)
        {
            try
            {
                var response = XElement.Parse(Project.Mingle.Get(ProjectId, url));
                response.Elements("transition").
                    ToList().ForEach(t => Add(t.Element("name").Value, new MingleTransition(t.ToString(), Project)));
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }

            return this;
        }

    }
}