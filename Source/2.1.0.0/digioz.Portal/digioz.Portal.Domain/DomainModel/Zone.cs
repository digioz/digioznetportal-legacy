using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class Zone
    {
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        [DisplayName("Zone Type")]
        public string ZoneType { get; set; }
    }
}
