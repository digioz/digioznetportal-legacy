namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class OrderDetail
    {
        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        public string OrderID { get; set; }

        [Required]
        [StringLength(128)]
        public string ProductID { get; set; }

        public int Quantity { get; set; }

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
