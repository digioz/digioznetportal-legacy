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
    
    public partial class Menu
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string URL { get; set; }
        public string Target { get; set; }
        public bool Visible { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
    
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
