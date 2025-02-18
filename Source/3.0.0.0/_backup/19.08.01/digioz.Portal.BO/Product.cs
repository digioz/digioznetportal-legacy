namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            ProductOptions = new HashSet<ProductOption>();
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        public string ProductCategoryID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Make { get; set; }

        [StringLength(50)]
        public string Model { get; set; }

        [StringLength(50)]
        public string SKU { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        public decimal Price { get; set; }

        public decimal? Cost { get; set; }

        public int? QuantityPerUnit { get; set; }

        [StringLength(20)]
        public string Weight { get; set; }

        [StringLength(50)]
        public string Dimensions { get; set; }

        [StringLength(50)]
        public string Sizes { get; set; }

        [StringLength(50)]
        public string Colors { get; set; }

        [StringLength(50)]
        public string MaterialType { get; set; }

        [StringLength(50)]
        public string PartNumber { get; set; }

        [Required]
        [StringLength(255)]
        public string ShortDescription { get; set; }

        [Required]
        public string Description { get; set; }

        public string ManufacturerURL { get; set; }

        public int UnitsInStock { get; set; }

        public bool OutOfStock { get; set; }

        public string Notes { get; set; }

        public bool Visible { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductOption> ProductOptions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
