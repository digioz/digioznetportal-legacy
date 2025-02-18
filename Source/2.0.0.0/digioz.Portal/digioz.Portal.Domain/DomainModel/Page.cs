namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
   
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
        public DateTime? Timestamp { get; set; }

        [ForeignKey("UserID")]
        [InverseProperty("Pages")]
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
