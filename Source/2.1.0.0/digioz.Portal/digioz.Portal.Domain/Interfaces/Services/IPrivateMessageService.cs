using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IPrivateMessageService
    {
        PrivateMessage SanitizeMessage(PrivateMessage privateMessage);
        PrivateMessage Add(PrivateMessage message);
        PrivateMessage Get(Guid id);
        void Save(PrivateMessage id);
        IPagedList<PrivateMessage> GetPagedSentMessagesByUser(int pageIndex, int pageSize, MembershipUser user);
        IPagedList<PrivateMessage> GetPagedReceivedMessagesByUser(int pageIndex, int pageSize, MembershipUser user);
        PrivateMessage GetLastSentPrivateMessage(string Id);
        IList<PrivateMessage> GetAllSentByUser(string Id);
        int NewPrivateMessageCount(string userId);
        IList<PrivateMessage> GetAllReceivedByUser(string Id);
        IList<PrivateMessage> GetAllByUserToAnotherUser(string senderId, string receiverId);
        void DeleteMessage(PrivateMessage message);
    }
}
