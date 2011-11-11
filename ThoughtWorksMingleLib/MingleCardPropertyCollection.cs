using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Represents a collection of properties of a Mingle card
    /// </summary>
    /// <remarks>
    /// Each Mingle card has a fixed set of members also known as attributes.
    /// A card also has a variable colleciton of properties as determined
    /// by the card type. MingleCardProperty model the colleciton of properties.
    /// </remarks>
    public class MingleCardPropertyCollection : Dictionary<string, MingleCardProperty>
    {
        /// <summary>
        /// ID (not name) of the project
        /// </summary>
        public string ProjectId { get; private set; }

        /// <summary>
        /// MingleProject object
        /// </summary>
        public MingleProject Project { get; private set; }

        /// <summary>
        /// Constructs a new MingleCardPropertyCollection
        /// </summary>
        /// <param name="project">MingleProject object</param>
        public MingleCardPropertyCollection(MingleProject project)
        {
            Project = project;
            ProjectId = project.ProjectId;
        }

        /// <summary>
        /// Parses the xml of all the card properties into a collection of MingleCardProperty
        /// </summary>
        /// <param name="properties"></param>
        /// <returns></returns>
        public MingleCardPropertyCollection Parse(XElement properties)
        {
            properties.Elements("property").ToList().ForEach(e => Add(e.Element("name").Value, new MingleCardProperty(e.ToString(), Project)));

            return this;
        }
    }
}