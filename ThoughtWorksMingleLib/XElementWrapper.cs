//
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

using System.Linq;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// This is an abstract class inherited by all classes of MingleEvents
    /// </summary>
    public abstract class XElementWrapper
    {
        internal XElement Xml;

        internal XElementWrapper(XElement xml)
        {
            Xml = xml;
        }

        internal XElementWrapper(string xml)
        {
            Xml = XElement.Parse(xml);
        }

        internal string XElementString(string name)
        {
            var list = (from el in Xml.Elements()
                          where el.Name.LocalName == name
                          select new XElement(el)).ToList();
            return list.Count() > 0 ? list.Select(ev => ev.Value).ToList()[0] : "";
        }

        internal string XAttributeString(string name)
        {
            var list = (from el in Xml.Attributes()
                        where el.Name.LocalName == name
                        select new XAttribute(el)).ToList();
            return list.Count() > 0 ? list.Select(ev => ev.Value).ToList()[0] : "";
        }

        internal XElement XElements(string name)
        {
            var list = (from el in Xml.Elements()
                        where el.Name.LocalName == name
                        select new XElement(el)).ToList();
            return list.Count() > 0 ? list.Select(ev => ev).ToList()[0] : null;
        }

    }
}