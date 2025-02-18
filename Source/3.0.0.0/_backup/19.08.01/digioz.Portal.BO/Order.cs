namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        public string UserID { get; set; }

        [StringLength(20)]
        public string InvoiceNumber { get; set; }

        public DateTime OrderDate { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [Required]
        [StringLength(70)]
        public string ShippingAddress { get; set; }

        [StringLength(70)]
        public string ShippingAddress2 { get; set; }

        [Required]
        [StringLength(40)]
        public string ShippingCity { get; set; }

        [StringLength(40)]
        public string ShippingState { get; set; }

        [Required]
        [StringLength(30)]
        public string ShippingZip { get; set; }

        [Required]
        [StringLength(50)]
        public string ShippingCountry { get; set; }

        [Required]
        [StringLength(70)]
        public string BillingAddress { get; set; }

        [StringLength(70)]
        public string BillingAddress2 { get; set; }

        [Required]
        [StringLength(40)]
        public string BillingCity { get; set; }

        [Required]
        [StringLength(40)]
        public string BillingState { get; set; }

        [Required]
        [StringLength(30)]
        public string BillingZip { get; set; }

        [Required]
        [StringLength(50)]
        public string BillingCountry { get; set; }

        [StringLength(30)]
        public string Phone { get; set; }

        [Required]
        [StringLength(255)]
        public string Email { get; set; }

        public decimal Total { get; set; }

        [StringLength(100)]
        public string CCNumber { get; set; }

        [StringLength(10)]
        public string CCExp { get; set; }

        [StringLength(10)]
        public string CCCardCode { get; set; }

        public decimal? CCAmount { get; set; }

        public string TrxDescription { get; set; }

        public bool TrxApproved { get; set; }

        [StringLength(100)]
        public string TrxAuthorizationCode { get; set; }

        public string TrxMessage { get; set; }

        [StringLength(10)]
        public string TrxResponseCode { get; set; }

        [StringLength(50)]
        public string TrxID { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
