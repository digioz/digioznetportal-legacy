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
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;
    
    public partial class Page
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Body { get; set; }
        public string Keywords { get; set; }
        public string Description { get; set; }
        public bool Visible { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
    
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
