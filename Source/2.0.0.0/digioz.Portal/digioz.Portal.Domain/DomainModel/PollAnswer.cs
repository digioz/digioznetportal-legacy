using System;
using System.Collections.Generic;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class PollAnswer
    {
        public PollAnswer()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public string Answer { get; set; }

        public virtual Poll Poll { get; set; }
        public virtual IList<PollVote> PollVotes { get; set; }
    }
}
