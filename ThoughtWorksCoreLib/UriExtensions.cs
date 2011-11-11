using System;

namespace ThoughtWorksCoreLib
{
    static class UriExtensions
    {
        public static Uri Append(this Uri self, string toAppend)
        {
            return new Uri(self, toAppend);
        }
    }
}