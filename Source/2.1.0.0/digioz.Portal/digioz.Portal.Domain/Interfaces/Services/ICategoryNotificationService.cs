using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface ICategoryNotificationService
    {
        IList<CategoryNotification> GetAll();
        void Delete(CategoryNotification notification);
        IList<CategoryNotification> GetByCategory(Category category);
        IList<CategoryNotification> GetByUser(MembershipUser user);
        IList<CategoryNotification> GetByUserAndCategory(MembershipUser user, Category category);
        void Add(CategoryNotification category);
    }
}
