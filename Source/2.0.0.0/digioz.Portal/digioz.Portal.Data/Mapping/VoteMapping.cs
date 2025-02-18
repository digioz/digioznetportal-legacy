﻿using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class VoteMapping : EntityTypeConfiguration<Vote>
    {
        public VoteMapping()
        {
            HasKey(x => x.Id);

            HasRequired(x => x.Post).WithMany(x => x.Votes).Map(x => x.MapKey("Post_Id"));
            HasRequired(x => x.User).WithMany(x => x.Votes).Map(x => x.MapKey("MembershipUser_Id"));
            HasOptional(x => x.VotedByMembershipUser);

        }
    }
}
