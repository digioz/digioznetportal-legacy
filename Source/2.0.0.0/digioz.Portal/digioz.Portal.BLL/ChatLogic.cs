using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// This Class contains all the business 
    /// logic for the chatroom operations
    /// </summary>
    public class ChatLogic : BaseLogic
    {
        /// <summary>
        /// Gets a list of all Chat messages
        /// </summary>
        /// <returns></returns>
        public static List<Chat> Get()
        {
            var chats = Db.Chats.ToList();

            return chats;
        }

        /// <summary>
        /// Gets a list of the last 10 chats messages
        /// </summary>
        /// <returns></returns>
        public static List<Chat> GetLatestChats()
        {
            var chats = Db.Chats.Take(10).OrderByDescending(x => x.ID).ToList();

            return chats;
        }

        /// <summary>
        /// Adds a chat message
        /// </summary>
        /// <param name="chat">The chat.</param>
        public static void Add(Chat chat)
        {
            Db.Chats.Add(chat);
            Db.SaveChanges();
        }
    }
}
