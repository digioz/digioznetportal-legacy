namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Page
    {
        public int ID { get; set; }

        [StringLength(128)]
        public string UserID { get; set; }

        public string Title { get; set; }

        public string URL { get; set; }

        public string Body { get; set; }

        public string Keywords { get; set; }

        public string Description { get; set; }

        public bool Visible { get; set; }

        public DateTime? Timestamp { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}
