using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ITopicNotificationRepository
    {
        IList<TopicNotification> GetAll();
        IList<TopicNotification> GetByTopic(Topic topic);
        IList<TopicNotification> GetByUser(MembershipUser user);
        IList<TopicNotification> GetByUserAndTopic(MembershipUser user, Topic category);

        TopicNotification Add(TopicNotification item);
        TopicNotification Get(Guid id);
        void Delete(TopicNotification item);
        void Update(TopicNotification item);
    }
}
