using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.BLL;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using Omu.ValueInjecter;
using digioz.Portal.Utilities;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CommentPostsManagerController : Controller
    {
        // GET: Admin/CommentPostsManager
        public ActionResult Index()
        {
            var users = AccountLogic.GetMembershipUsers();
            var comments = CommentLogic.GetCommentPosts();
            var commentsVM = new List<CommentPostViewModel>();

            foreach (var item in comments)
            {
                CommentPostViewModel itemVM = new CommentPostViewModel();
                itemVM.InjectFrom(item);
                if (item.UserId != null)
                {
                    itemVM.Username = users.Where(x => x.Id == item.UserId).SingleOrDefault().UserName;
                }
                else
                {
                    itemVM.Username = "Anonymous";
                }
                
                itemVM.Body = StringUtils.TruncateDotDotDot(item.Body, 50);

                commentsVM.Add(itemVM);
            }

            commentsVM = commentsVM.OrderByDescending(x => x.ModifiedDate).ToList();

            return View(commentsVM);
        }

        // GET: Admin/CommentPostsManager/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            Comment comment = CommentLogic.GetCommentPost(id);

            if (comment == null)
            {
                return RedirectToAction("Index");
            }
            return View(comment);
        }

        // GET: Admin/CommentPostsManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/CommentPostsManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ParentId,UserId,Body,CreatedDate,ModifiedDate,Likes")] Comment model)
        {
            model.Id = Guid.NewGuid().ToString();
            model.CreatedDate = DateTime.Now;
            model.ModifiedDate = DateTime.Now;
            model.Likes = 0;
            if (model.UserId == null)
            {
                model.UserId = AccountLogic.GetMembershipUserByUsername(User.Identity.Name).Id;
            }

            if (ModelState.IsValid)
            {
                CommentLogic.AddCommentPost(model);
                return RedirectToAction("Index");
            }

            return View(model);
        }

        // GET: Admin/CommentPostsManager/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Comment comment = CommentLogic.GetCommentPost(id);

            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Admin/CommentPostsManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,UserId,Body,CreatedDate,ModifiedDate,Likes")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                var commentDb = CommentLogic.GetCommentPost(comment.Id);
                commentDb.ParentId = comment.ParentId;
                commentDb.Body = comment.Body;
                commentDb.ModifiedDate = DateTime.Now;

                CommentLogic.EditCommentPost(commentDb);
                return RedirectToAction("Index");
            }
            return View(comment);
        }

        // GET: Admin/CommentPostsManager/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Comment comment = CommentLogic.GetCommentPost(id);

            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Admin/CommentPostsManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            CommentLogic.DeleteCommentPost(id);
            return RedirectToAction("Index");
        }
    }
}
