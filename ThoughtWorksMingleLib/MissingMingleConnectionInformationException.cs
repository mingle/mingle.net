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

using System;
using System.Runtime.Serialization;

namespace ThoughtWorksMingleLib
{
    [Serializable]
    class MissingMingleConnectionInformationException : Exception
    {
        /// <summary>
        /// Constructs a new MissingMingleConnectionInformationException
        /// </summary>
        public MissingMingleConnectionInformationException()
        {
        }

        /// <summary>
        /// Constructs a new MissingMingleConnectionInformationException
        /// </summary>
        /// <param name="message">Exception message</param>
        public MissingMingleConnectionInformationException(string message) : base(message)
        {
        }

        /// <summary>
        /// Constructs a new MissingMingleConnectionInformationException
        /// </summary>
        /// <param name="message">Exception message</param>
        /// <param name="inner">Inner exception that caused this exception</param>
        public MissingMingleConnectionInformationException(string message, Exception inner)
            : base(message, inner)
        {
        }

        /// <summary>
        /// Constructs a new MissingMingleConnectionInformationException
        /// </summary>
        /// <param name="serializationInfo"></param>
        /// <param name="streamingContext"></param>
        public MissingMingleConnectionInformationException(SerializationInfo serializationInfo, StreamingContext streamingContext)
            : base(serializationInfo, streamingContext)
        {
        }

    }
}
