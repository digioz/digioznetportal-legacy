using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using digioz.Portal.Web.Models.ViewModels;

namespace digioz.Portal.Web.Controllers
{
    public class CommentsController : Controller
    {
        // GET: Comments
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List(int referenceId, string referenceType)
        {
            var comments = CommentLogic.GetCommentPostsByReference(referenceId, referenceType).OrderBy(x => x.ModifiedDate);
            ViewBag.ReferenceId = referenceId;
            ViewBag.ReferenceType = referenceType;

            //return View(comments);
            return PartialView("List", comments);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Add(FormCollection form)
        {
            if (form["referenceId"] != null && form["referenceType"] != null && form["comment"] != null)
            {
                var guid = Guid.NewGuid();

                Comment comment = new Comment()
                {
                    Id = guid.ToString(),
                    ReferenceId = form["referenceId"].ToString(),
                    ReferenceType = form["referenceType"].ToString(),
                    Body = form["comment"].ToString(),
                    CreatedDate = DateTime.Now,
                    ModifiedDate = DateTime.Now,
                    Likes = 0,
                    UserId = User.Identity.GetUserId(),
                    Username = User.Identity.Name
                };

                // Add Comment
                CommentLogic.AddCommentPost(comment);
            }

            return Redirect(Request.UrlReferrer.ToString());
        }

        [Authorize]
        public ActionResult Like(string id)
        {
            // Add the Like to the Comment
            CommentLogic.AddCommentPostLike(id);

            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}