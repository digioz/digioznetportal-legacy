using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class RSS
    {
        public int ID { get; set; }
        [Required]
        [StringLength(128)]
        public string Name { get; set; }
        [Required]
        public string Url { get; set; }
        [Required]
        [DisplayName("Max Count")]
        public int MaxCount { get; set; }
        [Required]
        public DateTime Timestamp { get; set; }
    }
}
