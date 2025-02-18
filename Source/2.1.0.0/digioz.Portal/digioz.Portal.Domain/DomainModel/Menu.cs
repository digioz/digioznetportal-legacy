namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    
    public partial class Menu
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Location { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string URL { get; set; }
        public string Target { get; set; }
        public bool Visible { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
        public int SortOrder { get; set; }

        [ForeignKey("UserID")]
        [InverseProperty("Menus")]
        public virtual MembershipUser AspNetUser { get; set; }
    }
}
