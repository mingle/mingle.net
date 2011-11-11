namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Interface for dealing with Mingle objects
    /// </summary>
    public interface IMingleXmlObjectCollection
    {
        /// <summary>
        /// Mingle project identifier
        /// </summary>
        string ProjectId { get; }
        /// <summary>
        /// Gets a Mingle object and loads a Mingle collection
        /// </summary>
        object Parse();
    }
}