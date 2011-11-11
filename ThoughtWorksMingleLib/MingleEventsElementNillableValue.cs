//
// Copyright 2011 ThoughtWorks, Inc.
//
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Models a tag potentially carrying a data value payload.
    /// </summary>
    public class MingleEventsElementNillableValue : XElementWrapper
    {
        /// <summary>
        /// Constructs a new MingleEventsElementsNillableValue
        /// </summary>
        /// <param name="xml"></param>
        public MingleEventsElementNillableValue(XElement xml) : base(xml) { }

        /// <summary>
        /// Constructs a new MingleEventselementNillableValue
        /// </summary>
        /// <param name="xml">XML in string form</param>
        public MingleEventsElementNillableValue(string xml) : base(xml) { }

        /// <summary>
        /// Returns the value or null
        /// </summary>
        public string Value
        {
            get
            {
                bool hasNil;
                bool.TryParse(XAttributeString("nil"), out hasNil);
                return hasNil ? null : Xml.Value;
            }
        }
    }
}