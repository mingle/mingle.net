using System.Xml.Linq;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Interface for Mingle XML objects (e.g., Card, Card Type)
    /// </summary>
    public interface IMingleXmlObject
    {
        /// <summary>
        /// Saves this object to Mingle
        /// </summary>
        void Update();
    }
}