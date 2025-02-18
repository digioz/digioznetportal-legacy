namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class PollVote
    {
        public Guid Id { get; set; }

        public Guid PollAnswer_Id { get; set; }

        [Required]
        [StringLength(128)]
        public string MembershipUser_Id { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        public virtual PollAnswer PollAnswer { get; set; }
    }
}
