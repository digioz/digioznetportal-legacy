using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class VisitorSession
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(25)]
        [DisplayName("IP Address")]
        public string IpAddress { get; set; }
        [DisplayName("Page URL")]
        public string PageUrl { get; set; }
        [DisplayName("Session Id")]
        public string SessionId { get; set; }
        public string UserName { get; set; }
        [Required]
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}
