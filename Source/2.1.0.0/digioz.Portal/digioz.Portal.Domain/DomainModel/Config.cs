namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    
    public partial class Config
    {
        public int ID { get; set; }
        [Required]
        [DisplayName("Key")]
        public string ConfigKey { get; set; }
        [Required]
        [DisplayName("Value")]
        public string ConfigValue { get; set; }
        [DisplayName("Is Encrypted")]
        public bool IsEncrypted { get; set; }
    }
}
