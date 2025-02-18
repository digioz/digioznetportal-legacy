using System.ComponentModel;

namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Module
    {
        public int ID { get; set; }
        [DisplayName("Username")]
        public string UserID { get; set; }
        public string Location { get; set; }
        public string Title { get; set; }
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Body { get; set; }
        public bool Visible { get; set; }
        public DateTime? Timestamp { get; set; }
        [DisplayName("Display In Box")]
        public bool DisplayInBox { get; set; }

        [ForeignKey("UserID")]
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
