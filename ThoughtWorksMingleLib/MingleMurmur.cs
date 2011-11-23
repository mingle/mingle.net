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

using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// A Mingle murmur 
    /// </summary>
    public class MingleMurmur
    {
        private readonly XElement _xElement;

        /// <summary>
        /// Constructs a new Murmur from an XElement payload
        /// </summary>
        /// <param name="xElement"></param>
        public MingleMurmur(XElement xElement)
        {
            _xElement = xElement;
        }

        /// <summary>
        /// Body of the Murmur
        /// </summary>
        public string Body
        {
            get { return _xElement.Element("body").Value; }
        }

        /// <summary>
        /// Author of the Murmur
        /// </summary>
        public string AuthorName
        {
            get { return _xElement.Element("author").Element("name").Value; }
        }
    }
}