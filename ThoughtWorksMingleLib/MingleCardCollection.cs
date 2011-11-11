//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Net;
using System.Xml.Linq;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    ///<summary>
    /// Set of Mingle cards
    ///</summary>
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
                TraceLog.WriteLine(new StackFrame().GetMethod().Name, "Loading the ResponseStream");
                Clear();
                var response = Project.Mingle.Get(ProjectId, "/cards.xml", filters);
                FillTheCardCollection(response);
            }
            catch (Exception ex)
            {
                TraceLog.Exception(new StackFrame().GetMethod().Name, ex);
                throw;
            }

            return this;

        }

        private void FillTheCardCollection(string response)
        {
            foreach (var e in XElement.Parse(response).Elements("card"))
            {
                Add(new MingleCard(e.ToString(), Project));
            }
        }

        #endregion
    }
}