namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Menu
    {
        public int ID { get; set; }

        [StringLength(128)]
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

        public DateTime? Timestamp { get; set; }

        public int SortOrder { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}
