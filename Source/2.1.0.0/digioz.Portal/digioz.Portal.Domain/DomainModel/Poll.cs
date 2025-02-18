using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class Poll : Entity
    {
        public Poll()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public string Slug { get; set; }
        [DisplayName("Is Closed")]
        public bool IsClosed { get; set; }
        [DisplayName("Date Created")]
        public DateTime DateCreated { get; set; }
        public bool Featured { get; set; }
        [DisplayName("Allow Multiple Option Vote")]
        public bool AllowMultipleOptionsVote { get; set; }

        public virtual MembershipUser User { get; set; }
        public virtual IList<PollAnswer> PollAnswers { get; set; } 
    }
}
