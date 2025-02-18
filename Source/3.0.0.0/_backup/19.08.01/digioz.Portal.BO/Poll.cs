namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Poll
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Poll()
        {
            PollAnswers = new HashSet<PollAnswer>();
        }

        public Guid Id { get; set; }

        public string Slug { get; set; }

        public bool IsClosed { get; set; }

        public DateTime DateCreated { get; set; }

        public bool Featured { get; set; }

        public bool AllowMultipleOptionsVote { get; set; }

        [Required]
        [StringLength(128)]
        public string MembershipUser_Id { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PollAnswer> PollAnswers { get; set; }
    }
}
