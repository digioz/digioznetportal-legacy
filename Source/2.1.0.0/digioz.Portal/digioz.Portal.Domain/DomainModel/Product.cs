using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace digioz.Portal.Domain.DomainModel
{
    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        [DisplayName("Category")]
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

        [DisplayName("Quantity Per Unit")]
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
        [DisplayName("Material Type")]
        public string MaterialType { get; set; }

        [StringLength(50)]
        [DisplayName("Part Number")]
        public string PartNumber { get; set; }

        [Required]
        [StringLength(255)]
        [DisplayName("Short Description")]
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string ShortDescription { get; set; }

        [Required]
        [DisplayName("Long Description")]
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Description { get; set; }

        [DataType(DataType.Url)]
        [DisplayName("Manufacturer URL")]
        public string ManufacturerURL { get; set; }

        [Range(0, 999999, ErrorMessage = "Units in Stock must be a valid number")]
        [DisplayName("Units In Stock")]
        public int UnitsInStock { get; set; }

        [DisplayName("Out of Stock")]
        public bool OutOfStock { get; set; }

        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Notes { get; set; }

        public bool Visible { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
