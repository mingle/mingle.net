using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// An ObservableCollection of MingleProjectMember
    /// </summary>
    public class MingleProjectMemberCollection : Dictionary<string, MingleProjectMember>, IMingleXmlObjectCollection
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
        /// Constructs a MingleProjectMemberCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleProjectMemberCollection (MingleProject project)
        {
            Project = project;
        }

        /// <summary>
        /// Load a MingleObjectMember collection from Mingle
        /// </summary>
        public object Parse()
        {

            try
            {
                XElement.Parse(Project.Mingle.Get(ProjectId, "/users.xml")).
                    Elements("projects_member").ToList().ForEach(e => Add(e.Element("user").
                        Element("login").Value, new MingleProjectMember(e.ToString())));
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                return new MingleProjectMemberCollection(Project);
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
            XElement.Parse(xml).Elements("project_member").ToList().ForEach(f => Add(f.Element("name").Value, new MingleProjectMember(f.ToString())));
            return this;
        }
    }
}