//
// Copyright © ThoughtWorks Studios 2010, 2011
//
namespace ThoughtWorksCoreLib
{
		/// <summary>
	/// Used to uniquely identify different views.
	/// </summary>
	public class ViewIdentifiers
	{
        /// <summary>
        /// Mingle card identifier
        /// </summary>
		public const int Card = 0;
        /// <summary>
        /// Mingle card set identifier
        /// </summary>
		public const int CardSet = 0;
        /// <summary>
        /// Settings identifier
        /// </summary>
		public const int Settings = 0;
        /// <summary>
        /// PipelineProperties identifier
        /// </summary>
		public const int PipelineProperties = 0;
        /// <summary>
        /// Filtered card set identifier
        /// </summary>
		public const int CardSetFiltered = 0;
        /// <summary>
        /// Explorer identifier
        /// </summary>
		public const int Explorer = 0;

		/// <summary>Private constructor</summary>
		/// <remarks>
		/// This private constructor is here to prevent the compiler from
		/// generating a default constructor for a class composed of only
		/// a bunch of static data.
		/// </remarks>
		private ViewIdentifiers()
		{
		}
	}
}