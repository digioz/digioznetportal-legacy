namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("AspNetUserLogins")]
    public partial class UserLogin
    {
        [Key, Column(Order = 0)]
        public string UserId { get; set; }
        [Key, Column(Order = 1)]
        public string LoginProvider { get; set; }
        [Key, Column(Order = 2)]
        public string ProviderKey { get; set; }

        [ForeignKey("UserId")]
        [InverseProperty("UserLogins")]
        public virtual MembershipUser User { get; set; }
    }
}
