//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// MinglePropertySet is a collection of Property Definitions for a Project.
    /// A hashtable is used because the most frequent use of this data is in the
    /// CardView where we need to do direct access of properties lidted in cards.
    /// </summary>
    public class MinglePropertyDefinitionCollection : Dictionary<string, MinglePropertyDefinition>, IMingleXmlObjectCollection
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
        /// Constructs a new MinglePropertyDefinitionCollection
        /// </summary>
        /// <param name="project">Mingle project object</param>
        public MinglePropertyDefinitionCollection(MingleProject project)
        {
            Project = project;
        }
        /// <summary>
        /// Get Property Definitions
        /// </summary>
        public object Parse()
        {

            var me = new StackFrame().GetMethod().Name;
            
            try
            {
                TraceLog.WriteLine(me, "Loading the ResponseStream for a MinglePropertyCollection");
                
                var p = XElement.Parse(Project.Mingle.Get(ProjectId, "/property_definitions.xml"));

                foreach (var e in p.Elements("property_definition"))
                {
                    Add(e.Element("name").Value, new MinglePropertyDefinition(e.ToString()));
                }
            }
            catch (Exception ex)
            {
                TraceLog.Exception(me, ex);
                throw;
            }

            return this;

        }
    }
}