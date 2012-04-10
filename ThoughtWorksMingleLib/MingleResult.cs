//
// Copyright 2012 ThoughtWorks, Inc.
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

using System.Dynamic;
using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Result from an XElement payload
    /// </summary>
    public class MingleResult : DynamicObject
    {
        private readonly XElement _xElement;

        /// <summary>
        /// Constructs a new MingleResult
        /// </summary>
        /// <param name="xElement"></param>
        public MingleResult(XElement xElement)
        {
            _xElement = xElement;
        }

        #region Implements DynamicObject.TryGetMember
        /// <summary>
        /// Attempt to get a member
        /// </summary>
        /// <param name="binder"></param>
        /// <param name="result"></param>
        /// <returns></returns>
        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            var node = _xElement.Element(binder.Name);

            result = node != null ? node.Value : null;

            return result != null;
        }
        #endregion
    }
}