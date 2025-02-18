using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IPrivateMessageRepository
    {
        IPagedList<PrivateMessage> GetPagedSentMessagesByUser(int pageIndex, int pageSize, MembershipUser user);
        IPagedList<PrivateMessage> GetPagedReceivedMessagesByUser(int pageIndex, int pageSize, MembershipUser user);
        PrivateMessage GetLastSentPrivateMessage(string Id);
        IList<PrivateMessage> GetAllSentByUser(string Id);
        IList<PrivateMessage> GetAllReceivedByUser(string Id);
        IList<PrivateMessage> GetAllByUserToAnotherUser(string senderId, string receiverId);
        int NewPrivateMessageCount(string userId);
        PrivateMessage Add(PrivateMessage item);
        PrivateMessage Get(Guid id);
        void Delete(PrivateMessage item);
        void Update(PrivateMessage item);
    }
}
