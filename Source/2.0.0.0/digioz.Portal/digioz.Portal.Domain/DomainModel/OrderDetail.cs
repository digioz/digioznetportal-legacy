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
    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        [DisplayName("Order")]
        public string OrderID { get; set; }

        [Required]
        [StringLength(128)]
        [DisplayName("Product")]
        public string ProductID { get; set; }

        public int Quantity { get; set; }

        [DisplayName("Unit Price")]
        public decimal UnitPrice { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string Size { get; set; }

        [StringLength(50)]
        public string Color { get; set; }

        [StringLength(50)]
        public string MaterialType { get; set; }

        public string Notes { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
