namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web.Mvc;
    
    public partial class Announcement
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public string Title { get; set; }
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Body { get; set; }
        public bool Visible { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }

        [ForeignKey("UserID")]
        [InverseProperty("Announcements")]
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
