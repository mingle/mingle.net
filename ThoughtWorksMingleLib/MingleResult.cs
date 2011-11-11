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