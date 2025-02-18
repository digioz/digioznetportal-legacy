using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class ProductOption
    {
        [Required]
        [StringLength(128)]
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
