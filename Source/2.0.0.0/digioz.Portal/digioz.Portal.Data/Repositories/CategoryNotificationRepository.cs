﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.Entity.Core;
using System.Data.Entity.Core.Common;
using System.Data.Entity;

using digioz.Portal.Data.Context;

using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;

namespace digioz.Portal.Data.Repositories
{
    public class CategoryNotificationRepository : ICategoryNotificationRepository
    {
        private readonly digiozPortalEntities _context;

        public CategoryNotificationRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public IList<CategoryNotification> GetAll()
        {
            return _context.CategoryNotification.ToList();
        }

        public IList<CategoryNotification> GetByCategory(Category category)
        {
            return _context.CategoryNotification
                .Where(x => x.Category.Id == category.Id)
                .ToList();
        }

        public IList<CategoryNotification> GetByUser(MembershipUser user)
        {
            return _context.CategoryNotification
                .Where(x => x.User.Id == user.Id)
                .ToList();
        }

        public IList<CategoryNotification> GetByUserAndCategory(MembershipUser user, Category category)
        {
            return _context.CategoryNotification
                .Where(x => x.Category.Id == category.Id && x.User.Id == user.Id)
                .ToList();
        }

        public CategoryNotification Add(CategoryNotification category)
        {
            return _context.CategoryNotification.Add(category);
        }

        public CategoryNotification Get(Guid id)
        {
            return _context.CategoryNotification.FirstOrDefault(cat => cat.Id == id);
        }

        public void Update(CategoryNotification item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.CategoryNotification.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;  
        }

        public void Delete(CategoryNotification categoryNotification)
        {
            _context.CategoryNotification.Remove(categoryNotification);
        }
    }
}
