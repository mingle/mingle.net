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
    [System.Serializable]
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