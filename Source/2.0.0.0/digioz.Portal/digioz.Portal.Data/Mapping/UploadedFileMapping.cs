﻿using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class UploadedFileMapping : EntityTypeConfiguration<UploadedFile>
    {
        public UploadedFileMapping()
        {
            HasKey(x => x.Id);
            HasRequired(x => x.Post).WithMany(x => x.Files).Map(x => x.MapKey("Post_Id"));
            HasRequired(x => x.MembershipUser).WithMany().Map(x => x.MapKey("MembershipUser_Id")).WillCascadeOnDelete(false) ;
        }
    }
}
