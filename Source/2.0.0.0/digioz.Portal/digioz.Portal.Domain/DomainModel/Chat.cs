using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class Chat
    {
        public int ID { get; set; }
        [StringLength(128)]
        public string UserID { get; set; }
        public string Message { get; set; }
        [Required]

        public DateTime Timestamp { get; set; }

        [ForeignKey("UserID")]
        public virtual MembershipUser User { get; set; }
    }
}
