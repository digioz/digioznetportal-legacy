//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace digioz.Portal.Web.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class LogVisitor
    {
        public long ID { get; set; }
        public string IPAddress { get; set; }
        public string BrowserType { get; set; }
        public string Language { get; set; }
        public Nullable<bool> IsBot { get; set; }
        public string Country { get; set; }
        public string ReferringURL { get; set; }
        public string SearchString { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
    }
}
