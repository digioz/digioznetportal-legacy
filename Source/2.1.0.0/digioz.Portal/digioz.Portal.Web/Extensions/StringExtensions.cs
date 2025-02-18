using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Extensions
{
    public static class StringExtensions
    {
        public static string Truncate(this string self, int maxLength, string suffix = "")
        {
            return (self.Length > maxLength) ? self.Substring(0, maxLength) + suffix : self;
        }

        public static bool Contains(this string self, string value, StringComparison comparison)
        {
            return self.IndexOf(value, comparison) > -1;
        }
    }
}