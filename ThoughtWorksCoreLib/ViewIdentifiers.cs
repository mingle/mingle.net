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