//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//

using System;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Xml;
using ThoughtWorksCoreLib;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Class to model a Mingle property value
    /// </summary>
    public class MinglePropertyValue
    {
        /// <summary>
        /// Property ID
        /// </summary>
        public int Id { get; private set; }

        /// <summary>
        /// Property value
        /// </summary>
        public object Value { get; internal set; }

        /// <summary>
        /// Property color vlaue (consult Mingle documentation)
        /// </summary>
        public string Color { get; private set; }

        /// <summary>
        /// Property position (consult Mingle documentation)
        /// </summary>
        public int Position { get; private set; }

        /// <summary>
        /// Parse the property value
        /// </summary>
        /// <param name="n">XmlElement object for the property value obtained from the Mingle API</param>
        public void Parse(XmlElement n)
        {
            var me = new StackFrame().GetMethod().Name;
            TraceLog.WriteLine(me, "Entering...");

            foreach (XmlElement e in n.ChildNodes.Cast<XmlElement>())
            {
                switch (e.Name)
                {
                    case "id":
                        Id = Convert.ToInt32(e.InnerText, CultureInfo.InvariantCulture);
                        break;

                    case "value":
                        Value = string.Format(CultureInfo.InvariantCulture, e.InnerText);
                        break;

                    case "color":
                        Color = string.Format(CultureInfo.InvariantCulture, e.InnerText);
                        break;

                    case "position":
                        Position = Convert.ToInt32(e.InnerText, CultureInfo.InvariantCulture);
                        break;
                }
            }

            TraceLog.WriteLine(me, "Entering...");
        }
    }
}