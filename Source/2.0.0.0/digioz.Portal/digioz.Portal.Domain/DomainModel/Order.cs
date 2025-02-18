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
    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public string ID { get; set; }

        [Required]
        [StringLength(128)]
        [DisplayName("User")]
        public string UserID { get; set; }

        [StringLength(20)]
        public string InvoiceNumber { get; set; }

        [DisplayName("Order Date")]
        public DateTime OrderDate { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Last Name")]
        public string LastName { get; set; }

        [Required]
        [StringLength(70)]
        [DisplayName("Shipping Address")]
        public string ShippingAddress { get; set; }

        [StringLength(70)]
        [DisplayName("Shipping Address 2")]
        public string ShippingAddress2 { get; set; }

        [Required]
        [StringLength(40)]
        [DisplayName("Shipping City")]
        public string ShippingCity { get; set; }

        [StringLength(40)]
        [DisplayName("Shipping State")]
        public string ShippingState { get; set; }

        [Required]
        [StringLength(30)]
        [DisplayName("Shipping Zip")]
        public string ShippingZip { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Shipping Country")]
        public string ShippingCountry { get; set; }

        [Required]
        [StringLength(70)]
        [DisplayName("Billing Address")]
        public string BillingAddress { get; set; }

        [StringLength(70)]
        [DisplayName("Billing Address 2")]
        public string BillingAddress2 { get; set; }

        [Required]
        [StringLength(40)]
        [DisplayName("Billing City")]
        public string BillingCity { get; set; }

        [Required]
        [StringLength(40)]
        [DisplayName("Billing State")]
        public string BillingState { get; set; }

        [Required]
        [StringLength(30)]
        [DisplayName("Billing Zip")]
        public string BillingZip { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Billing Country")]
        public string BillingCountry { get; set; }

        [StringLength(30)]
        public string Phone { get; set; }

        [Required]
        [StringLength(255)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        public decimal Total { get; set; }

        [StringLength(100)]
        [DisplayName("Credit Card Number")]
        public string CCNumber { get; set; }

        [StringLength(10)]
        [DisplayName("Expiration")]
        public string CCExp { get; set; }

        [StringLength(10)]
        [DisplayName("Security Code")]
        public string CCCardCode { get; set; }

        [DisplayName("Credit Card Charge Amount")]
        public decimal? CCAmount { get; set; }

        [DisplayName("Transaction Description")]
        public string TrxDescription { get; set; }

        [DisplayName("Transaction Approved")]
        public bool TrxApproved { get; set; }

        [StringLength(100)]
        [DisplayName("Transaction Authorization Code")]
        public string TrxAuthorizationCode { get; set; }

        [DisplayName("Transaction Message")]
        public string TrxMessage { get; set; }

        [StringLength(10)]
        [DisplayName("Transaction Code")]
        public string TrxResponseCode { get; set; }

        [StringLength(50)]
        [DisplayName("Transaction ID")]
        public string TrxID { get; set; }

        [ForeignKey("UserID")]
        public virtual MembershipUser AspNetUser { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
