namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class ProductOption
    {
        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        public string ProductID { get; set; }

        [Required]
        [StringLength(50)]
        public string OptionType { get; set; }

        [Required]
        [StringLength(50)]
        public string OptionValue { get; set; }

        public virtual Product Product { get; set; }
    }
}
