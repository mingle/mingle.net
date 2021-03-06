﻿//
// Copyright 2012-2013 ThoughtWorks, Inc.
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

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Filter is a class that exposes properties and methods to provide filter and query
    /// clauses suitable for POST data and queries. 
    /// </summary>
    [System.Serializable]
    public class MingleFilter
    {
        /// <summary>
        /// Constructs a new Filter. Sets Name, Condition and Value to the empty string.
        /// </summary>
        public MingleFilter()
        {
            Name = string.Empty;
            Condition = string.Empty;
            Value = string.Empty;
        }

        /// <summary>
        /// Constructs a new Filter. Sets Name, Condition and Value.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="condition"></param>
        /// <param name="value"></param>
        public MingleFilter(string name, string condition, string value)
        {
            Name = name;
            Condition = condition;
            Value = value;
        }

        /// <summary>
        /// Name of the Card property or attribute
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The boolean condition to use
        /// </summary>
        public string Condition { get; set; }

        /// <summary>
        /// The value of the property or attribute
        /// </summary>
        public string Value { get; set; }

        /// <summary>
        /// Returns "filters" clauses used in GET request queries
        /// </summary>
        public string FilterFormatString
        {
            get { return string.Format("filters[]=[{0}][{1}][{2}]", Name, Condition, Value); }
        }

        /// <summary>
        /// Returns a string with the formatted favorite name/value pair
        /// </summary>
        public string FavoriteString
        {
            get { return string.Format("{0}={1}", Name, Value); }
        }

        /// <summary>
        /// Returns data value paramater clauses used in PUT/POST requests for cards
        /// </summary>
        public string CardDataString
        {
            get { return string.Format("card[{0}]={1}", Name, Value); }
        }

        /// <summary>
        /// Returns Property Name paramater clauses used in PUT/POST requests for cards
        /// </summary>
        public string CardPropertyNameString
        {
            get { return string.Format("card[properties][][name]={0}", Name); }
        }

        /// <summary>
        /// Returns Property Value paramater clauses used in PUT/POST requests for cards
        /// </summary>
        public string CardPropertyValueString
        {
            get { return string.Format("card[properties][][value]={0}", Value); }
        }

        /// <summary>
        /// Returns transition_execution clauses for POST data 
        /// </summary>
        public string TransitionFormatString
        {
            get { return string.Format("transition_execution[{0}]=[{1}]", Name, Value); }
        }

        /// <summary>
        /// Returns an MQL expression
        /// </summary>
        public string MqlString
        {
            get { return string.Format("{0} {1} '{2}'", Name, Condition, Value); }
        }
    }
}