using System;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A Mingle project team member
    /// </summary>
    public class MingleProjectMember 
    {
        /// <summary>
        /// Returns an XElement backing this object
        /// </summary>
        public XElement RawData { get; private set; }

        /// <summary>
        /// Constructs a MingleProjectMember from XML
        /// </summary>
        /// <param name="projectMember"></param>
        public MingleProjectMember(string projectMember)
        {
            RawData = XElement.Parse(projectMember);
        }

        /// <summary>
        /// Project member Id
        /// </summary>
        public string MemberId
        {
            get { return RawData.Element("id").Value; }
            set{ RawData.SetElementValue("id", value);}
        }

        /// <summary>
        /// Indicates whether the project member is a project administrator
        /// </summary>
        public bool ProjectAdmin
        {
            get { return Boolean.Parse(RawData.Element("admin").Value); } 
            set { RawData.SetElementValue("admin", value);}
        }

        /// <summary>
        /// Indicates whether this project member is a read-only member
        /// </summary>
        public bool Readonly
        {
            get { return bool.Parse(RawData.Element("readonly_member").Value); }
            set { RawData.SetElementValue("readonly_member", value);}
        }

        /// <summary>
        /// User id
        /// </summary>
        public int UserId
        {
            get { return int.Parse(RawData.Element("user").Element("id").Value); }
            set { RawData.Element("user").SetElementValue("id", value);}
        }

        /// <summary>
        /// User name
        /// </summary>
        public string UserName
        {
            get { return RawData.Element("user").Element("name").Value; }
            set { RawData.Element("user").SetElementValue("name", value); }
        }

        /// <summary>
        /// User login
        /// </summary>
        public string UserLogin
        {
            get { return RawData.Element("user").Element("login").Value; }
            set { RawData.Element("user").SetElementValue("login", value); }
        }

        /// <summary>
        /// User email
        /// </summary>
        public string UserEmail
        {
            get { return RawData.Element("user").Element("email").Value; }
            set { RawData.Element("user").SetElementValue("email", value); }
        }

        /// <summary>
        /// Is user a light user?
        /// </summary>
        public bool UserLight
        {
            get { return bool.Parse(RawData.Element("user").Element("light").Value); }
            set { RawData.Element("user").SetElementValue("light", value); }
        }

        /// <summary>
        /// User icon path
        /// </summary>
        public string UserIconPath
        {
            get { return RawData.Element("user").Element("icon_path").Value; }
            set { RawData.Element("user").SetElementValue("icon_path", value); }
        }

        /// <summary>
        /// Url for the project card
        /// </summary>
        public string ProjectUrl
        {
            get { return RawData.Element("project").Attribute("url").Value; }
            set { RawData.Element("project").SetAttributeValue("url", value); }
        }

        /// <summary>
        /// Name of the project
        /// </summary>
        public string ProjectName
        {
            get { return RawData.Element("project").Element("name").Value; }
            set { RawData.Element("project").SetAttributeValue("name", value); }
        }

        /// <summary>
        /// Id of the project
        /// </summary>
        public string ProjectId
        {
            get { return RawData.Element("project").Element("identifier").Value; }
            set { RawData.Element("project").SetAttributeValue("identifier", value); }
        }
    }
}