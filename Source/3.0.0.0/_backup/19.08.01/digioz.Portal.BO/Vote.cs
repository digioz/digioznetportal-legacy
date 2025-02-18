namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Vote
    {
        public Guid Id { get; set; }

        public int Amount { get; set; }

        public DateTime? DateVoted { get; set; }

        [StringLength(128)]
        public string VotedByMembershipUser_Id { get; set; }

        public Guid Post_Id { get; set; }

        [Required]
        [StringLength(128)]
        public string MembershipUser_Id { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        public virtual AspNetUser AspNetUser1 { get; set; }
    }
}
