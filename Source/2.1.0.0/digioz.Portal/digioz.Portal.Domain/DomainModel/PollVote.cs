using System;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class PollVote
    {
        public PollVote()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }

        public virtual PollAnswer PollAnswer { get; set; }
        public virtual MembershipUser User { get; set; }
    }
}
