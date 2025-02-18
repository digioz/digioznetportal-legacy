namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Zone
    {
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string ZoneType { get; set; }
    }
}
