﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ICategoryRepository
    {
        IList<Category> GetAll();
        IList<Category> GetAllSubCategories(Guid parentId);
        IList<Category> GetMainCategories(bool getWithExtendedData);
        Category Add(Category newsItem);
        CategoryWithSubCategories GetBySlugWithSubCategories(string slug);
        Category GetBySlug(string slug);
        IList<Category> GetBySlugLike(string slug);
        void Delete(Category category);
        Category Get(Guid id);
        void Update(Category item);
    }
}
