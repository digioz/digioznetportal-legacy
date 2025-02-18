﻿using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class CategoryMapping : EntityTypeConfiguration<Category>
    {
        public CategoryMapping()
        {
            HasKey(x => x.Id);

            HasOptional(x => x.ParentCategory)
                .WithMany()
                .Map(x => x.MapKey("Category_Id"));

            HasMany(x => x.Topics)
                .WithRequired(x => x.Category);

            HasMany(x => x.CategoryNotifications)
                .WithRequired(x => x.Category)
                .Map(x => x.MapKey("Category_Id"))
                .WillCascadeOnDelete();
               
        }
    }
}
