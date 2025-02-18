using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class Plugin
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string DLL { get; set; }
        public bool IsEnabled { get; set; }
    }
}
