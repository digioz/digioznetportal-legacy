namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Config
    {
        public int ID { get; set; }

        [Required]
        public string ConfigKey { get; set; }

        [Required]
        public string ConfigValue { get; set; }

        public bool IsEncrypted { get; set; }
    }
}
