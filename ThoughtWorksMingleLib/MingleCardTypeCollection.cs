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
using System.Linq;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib 
{
    /// <summary>
    /// Collection of Card Types listing the various types of cards available in the project.
    /// </summary>
    [System.Serializable]
    public class MingleCardTypeCollection : Collection<MingleCardType>, IMingleXmlObjectCollection
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
        /// Constructs a new MingleCardTypeCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleCardTypeCollection (MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// Populates a MingleCardType set with a bunch of MingleCardType objects using the Mingle "get card types" API
        /// </summary>
        public object Parse()
        {
            var me = new StackFrame().GetMethod().Name;
            try
            {
                XElement.Parse(Project.Mingle.Get(ProjectId, "/card_types.xml")).
                    Elements("card_type").ToList().ForEach(ct => Add(new MingleCardType(ct.ToString())));
                return this;
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("does not match the end tag of 'head'"))
                    throw new MingleNotRunningException(Resources.MingleNotRunning, ex);
                TraceLog.Exception(me, ex);
                throw;
            }
        }
    }
}