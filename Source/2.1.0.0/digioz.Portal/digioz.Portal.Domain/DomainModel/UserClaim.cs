namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("AspNetUserClaims")]
    public partial class UserClaim
    {
        [Key]
        public int Id { get; set; }
        public string ClaimType { get; set; }
        public string ClaimValue { get; set; }

        public string User_Id { get; set; }

        [ForeignKey("User_Id")]
        [InverseProperty("UserClaims")]
        public virtual MembershipUser User { get; set; }
    }
}
