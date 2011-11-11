//
// Copyright 2011 ThoughtWorks, Inc.
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