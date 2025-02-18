﻿using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class MembershipUserPointsMapping : EntityTypeConfiguration<MembershipUserPoints>
    {
        public MembershipUserPointsMapping()
        {
            HasKey(x => x.Id);

            HasRequired(x => x.User).WithMany(x => x.Points).Map(x => x.MapKey("MembershipUser_Id"));
        }
    }
}
