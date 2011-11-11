using System;
using System.Runtime.Serialization;
using ThoughtWorksCoreLib;

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
