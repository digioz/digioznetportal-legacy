namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Module
    {
        public int ID { get; set; }

        [StringLength(128)]
        public string UserID { get; set; }

        public string Location { get; set; }

        public string Title { get; set; }

        public string Body { get; set; }

        public bool Visible { get; set; }

        public DateTime? Timestamp { get; set; }

        public bool DisplayInBox { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}
