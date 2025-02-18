using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Controllers
{
    public class ChatController : Controller
    {
        // GET: Chat
        [Authorize]
        public ActionResult Index()
        {
            var chats = ChatLogic.GetLatestChats();

            return View(chats);
        }

        [Authorize]
        [HttpPost]
        public JsonResult Add(string message)
        {
            if (!String.IsNullOrEmpty(message) && message != "[object HTMLInputElement]")
            {
                Chat chat = new Chat
                {
                    Timestamp = DateTime.Now,
                    Message = Server.HtmlEncode(message),
                    UserID = User.Identity.GetUserId()
                };

                ChatLogic.Add(chat);
            }

            return null;
        }

        public JsonResult Online()
        {
            var dateTimeLastOnline = DateTime.Now.AddMinutes(-1);
            var online = VisitorSessionLogic.GetChatVisitorSessions(dateTimeLastOnline);       

            return Json(online, JsonRequestBehavior.AllowGet); ;
        }
    }
}