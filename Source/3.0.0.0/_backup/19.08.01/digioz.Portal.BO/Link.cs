namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Link
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string URL { get; set; }

        public string Description { get; set; }

        public int LinkCategoryID { get; set; }

        public bool? Visible { get; set; }

        public DateTime? Timestamp { get; set; }

        public virtual LinkCategory LinkCategory { get; set; }
    }
}
