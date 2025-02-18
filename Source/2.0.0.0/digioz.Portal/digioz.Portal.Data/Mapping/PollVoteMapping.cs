﻿using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class PollVoteMapping : EntityTypeConfiguration<PollVote>
    {
        public PollVoteMapping()
        {
            HasKey(x => x.Id);
            HasRequired(x => x.User).WithMany(t => t.PollVotes).Map(m => m.MapKey("MembershipUser_Id"));
            HasRequired(x => x.PollAnswer).WithMany(t => t.PollVotes).Map(m => m.MapKey("PollAnswer_Id"));
        }
    }
}
