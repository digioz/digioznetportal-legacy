using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ICategoryNotificationRepository
    {
        IList<CategoryNotification> GetAll();
        IList<CategoryNotification> GetByCategory(Category category);
        IList<CategoryNotification> GetByUser(MembershipUser user);
        IList<CategoryNotification> GetByUserAndCategory(MembershipUser user, Category category);
        CategoryNotification Add(CategoryNotification category);
        void Delete(CategoryNotification category);
        CategoryNotification Get(Guid id);
        void Update(CategoryNotification item);
    }
}
