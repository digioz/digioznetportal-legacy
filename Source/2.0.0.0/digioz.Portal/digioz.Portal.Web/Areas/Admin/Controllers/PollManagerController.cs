using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class PollManagerController : Controller
    {
        public ActionResult Index()
        {
            var polls = PollLogic.GetAll();
            return View(polls);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(FormCollection form)
        {
            Poll poll = new Poll();
            List<PollAnswer> pollAnswers = new List<PollAnswer>();

            poll.Slug = form["Slug"].ToString().Trim();
            poll.IsClosed = Convert.ToBoolean(form["IsClosed"].Split(',')[0].ToString().Trim());
            poll.DateCreated = DateTime.Now;
            poll.User = AccountLogic.GetMembershipUser(User.Identity.GetUserId());
            poll.Featured = Convert.ToBoolean(form["Featured"].Split(',')[0].ToString().Trim());
            poll.AllowMultipleOptionsVote = Convert.ToBoolean(form["AllowMultipleOptionsVote"].Split(',')[0].ToString().Trim());

            if (!string.IsNullOrEmpty(poll.Slug) && poll.User != null)
            {
                PollLogic.Add(poll);

                foreach (string key in form.Keys)
                {
                    if (key.Contains("pollanswer"))
                    {
                        string formValue = form[key].ToString().Trim();

                        if (!string.IsNullOrEmpty(formValue))
                        {
                            PollAnswer pollAnswer = new PollAnswer();
                            pollAnswer.Answer = formValue;
                            pollAnswer.Poll = poll;

                            pollAnswers.Add(pollAnswer);
                        }
                    }
                }

                PollAnswerLogic.AddRange(pollAnswers);
            }

            return RedirectToAction("Index");
        }

        public ActionResult Edit(string id)
        {
            Poll poll = PollLogic.Get(id);

            return View(poll);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Poll poll)
        {
            Poll pollExisting = PollLogic.Get(poll.Id.ToString());
            pollExisting.Slug = poll.Slug;
            pollExisting.IsClosed = poll.IsClosed;
            pollExisting.Featured = poll.Featured;
            pollExisting.AllowMultipleOptionsVote = poll.AllowMultipleOptionsVote;

            if (ModelState.IsValid)
            {
                PollLogic.Edit(pollExisting);

                return RedirectToAction("Index");
            }

            return View(poll);
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            PollViewModel pollViewModel = new PollViewModel();
            pollViewModel.Poll = PollLogic.Get(id);
            pollViewModel.PollAnswers = PollAnswerLogic.GetAll(id);
            
            if (pollViewModel.Poll == null)
            {
                return HttpNotFound();
            }

            return View(pollViewModel);
        }

        public ActionResult DeleteAnswer(string id)
        {
            var pollAnswer = PollAnswerLogic.Get(id);
            string pollId = pollAnswer.Poll.Id.ToString();

            if (pollAnswer != null)
            {
                PollVoteLogic.DeleteRange(pollAnswer.Id.ToString());
            }

            PollAnswerLogic.Delete(id);

            return RedirectToAction("Details", new { id = pollId });
        }

        public ActionResult CreateAnswer(string id)
        {

            PollAnswer pollAnswer = new PollAnswer();
            pollAnswer.Poll = PollLogic.Get(id);

            return View(pollAnswer);
        }

        [HttpPost]
        public ActionResult CreateAnswer([Bind(Include = "Poll, Answer")] PollAnswer pollAnswer)
        {
            string pollId = pollAnswer.Poll.Id.ToString();
            pollAnswer.Poll = PollLogic.Get(pollId);

            if (ModelState.IsValid)
            {
                PollAnswerLogic.Add(pollAnswer);
            }

            return RedirectToAction("Details", new { id = pollId });
        }

        public ActionResult EditAnswer(string id)
        {
            PollAnswer pollAnswer = PollAnswerLogic.Get(id);

            return View(pollAnswer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAnswer(PollAnswer pollAnswer)
        {
            PollAnswer pollAnswerExisting = PollAnswerLogic.Get(pollAnswer.Id.ToString());

            if (pollAnswerExisting != null)
            {
                pollAnswerExisting.Answer = pollAnswer.Answer;

                if (ModelState.IsValid)
                {
                    PollAnswerLogic.Edit(pollAnswerExisting);
                }

                return RedirectToAction("Details", new { id = pollAnswerExisting.Poll.Id.ToString() });
            }

            return View(pollAnswer);
        }

        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            PollViewModel pollViewModel = new PollViewModel();
            pollViewModel.Poll = PollLogic.Get(id);
            pollViewModel.PollAnswers = PollAnswerLogic.GetAll(id);

            if (pollViewModel.Poll == null)
            {
                return HttpNotFound();
            }
            return View(pollViewModel);
        }

        // POST: /Admin/PageManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            PollLogic.Delete(id);

            return RedirectToAction("Index");
        }
    }
}