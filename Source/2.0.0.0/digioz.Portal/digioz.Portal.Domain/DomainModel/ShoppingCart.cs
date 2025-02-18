using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    [Table("ShoppingCart")]
    public partial class ShoppingCart
    {
        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        public string UserID { get; set; }

        [Required]
        [StringLength(128)]
        public string ProductID { get; set; }

        public int Quantity { get; set; }

        public DateTime DateCreated { get; set; }

        [StringLength(50)]
        public string Size { get; set; }

        [StringLength(50)]
        public string Color { get; set; }

        [StringLength(50)]
        public string MaterialType { get; set; }

        public string Notes { get; set; }

        public virtual MembershipUser AspNetUser { get; set; }

        public virtual Product Product { get; set; }
    }
}
