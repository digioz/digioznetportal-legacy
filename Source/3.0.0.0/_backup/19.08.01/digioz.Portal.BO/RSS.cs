namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class RSS
    {
        public int ID { get; set; }

        [Required]
        [StringLength(128)]
        public string Name { get; set; }

        [Required]
        public string Url { get; set; }

        public int MaxCount { get; set; }

        public DateTime Timestamp { get; set; }
    }
}
