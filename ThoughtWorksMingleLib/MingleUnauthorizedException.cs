using System;
using System.Runtime.Serialization;

namespace ThoughtWorksMingleLib
{
    class MingleUnauthorizedException : Exception
    {
        /// <summary>
        /// Constructs a new MingleUnauthorizedException
        /// </summary>
        public MingleUnauthorizedException()
        {
        }

        /// <summary>
        /// Constructs a new MingleUnauthorizedException
        /// </summary>
        /// <param name="message">Exception message</param>
        public MingleUnauthorizedException(string message)
            : base(message)
        {
        }

        /// <summary>
        /// Constructs a new MingleUnauthorizedException
        /// </summary>
        /// <param name="message">Exception message</param>
        /// <param name="inner">Inner exception that caused this exception</param>
        public MingleUnauthorizedException(string message, Exception inner)
            :base(message, inner)
        {
        }

        /// <summary>
        /// Constructs a new MingleUnauthorizedException
        /// </summary>
        /// <param name="serializationInfo"></param>
        /// <param name="streamingContext"></param>
        public MingleUnauthorizedException(SerializationInfo serializationInfo, StreamingContext streamingContext)
            : base(serializationInfo, streamingContext)
        {
        }
    }
}
