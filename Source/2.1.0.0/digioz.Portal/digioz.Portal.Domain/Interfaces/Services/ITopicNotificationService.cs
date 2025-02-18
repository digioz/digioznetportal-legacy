using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface ITopicNotificationService
    {
        IList<TopicNotification> GetAll();
        void Delete(TopicNotification notification);
        IList<TopicNotification> GetByTopic(Topic topic);
        IList<TopicNotification> GetByUser(MembershipUser user);
        IList<TopicNotification> GetByUserAndTopic(MembershipUser user, Topic topic);
        void Add(TopicNotification topicNotification);
    }
}
