using System.ComponentModel;

namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    
    public partial class Profile
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        [DisplayName("Birthday Visible")]
        public Nullable<bool> BirthdayVisible { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public string Signature { get; set; }
        public string Avatar { get; set; }
        [DisplayName("First Name")]
        public string FirstName { get; set; }
        [DisplayName("Last Name")]
        public string LastName { get; set; }
    
        [ForeignKey("UserID")]
        [InverseProperty("Profiles")]
       public virtual MembershipUser AspNetUser { get; set; }
    }
}
