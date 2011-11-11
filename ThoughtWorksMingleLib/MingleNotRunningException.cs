//
// Copyright © ThoughtWorks, Inc. 2010, 2011
//
using System;
using System.Runtime.Serialization;

namespace ThoughtWorksMingleLib
{
    /// <summary>
    /// Thrown when the Mingle Server is apparently not running
    /// </summary>
    [Serializable]
    public class MingleNotRunningException : Exception
    {
        /// <summary>
        /// Exception thrown when Mingle is not running
        /// </summary>
        public MingleNotRunningException()
        {
        }

        /// <summary>
        /// Exception thrown when Mingle is not running
        /// </summary>
        /// <param name="message">Exception message</param>
        public MingleNotRunningException(string message) : base(message)
        {
        }

        /// <summary>
        /// Exception thrown when Mingle is not running
        /// </summary>
        /// <param name="message">Exception message</param>
        /// <param name="inner">Inner exception that caused this exception</param>
        public MingleNotRunningException(string message, Exception inner) : base(message, inner)
        {
        }

        /// <summary>
        /// Mingle not running exception serialization API
        /// </summary>
        /// <param name="serializationInfo"></param>
        /// <param name="streamingContext"></param>
        public MingleNotRunningException(SerializationInfo serializationInfo, StreamingContext streamingContext)
            : base(serializationInfo, streamingContext)
        {
        }
    }
}