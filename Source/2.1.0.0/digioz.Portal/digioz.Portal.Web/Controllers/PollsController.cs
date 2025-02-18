using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Controllers
{
    public class PollsController : Controller
    {
        // GET: Poll
        public ActionResult Index()
        {
            var polls = PollLogic.GetAll();
            return View(polls);
        }

        [Authorize]
        public ActionResult Add(string id)
        {
            Guid idGuid;
            bool isIdAGUID = Guid.TryParse(id, out idGuid);
            string userId = User.Identity.GetUserId();

            if (string.IsNullOrEmpty(id) || isIdAGUID == false)
            {
                return RedirectToAction("Index", "Home");
            }

            Poll poll = PollLogic.Get(id);
            ViewBag.HasUserVoted = PollLogic.HasUserVotedOnPoll(poll.Id.ToString(), userId);

            Response.ContentType = "text/html";

            return View(poll);
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(FormCollection form)
        {
            string id = form["Id"].ToString();
            Poll poll = PollLogic.Get(id);
            string userId = User.Identity.GetUserId();
            var user = AccountLogic.GetMembershipUser(userId);

            Guid idGuid;
            bool isIdAGUID = Guid.TryParse(id, out idGuid);

            if (string.IsNullOrEmpty(id) || isIdAGUID == false)
            {
                return RedirectToAction("Index", "Home");
            }

            if (poll.AllowMultipleOptionsVote)
            {
                var pollAnswers = new List<PollAnswer>();

                foreach (string key in form.Keys)
                {
                    if (key.Contains("answerid_"))
                    {
                        string formValue = form[key].ToString().Trim();
                        string keyId = key.ToString().Split('_')[1].ToString().Trim();

                        if (formValue == "on")
                        {
                            PollVote pollVote = new PollVote
                            {
                                PollAnswer = PollAnswerLogic.Get(keyId),
                                User = user
                            };

                            PollVoteLogic.Add(pollVote);
                        }
                    }
                }
            }
            else
            {
                string keyId = form["answer"].ToString().Trim();

                PollVote pollVote = new PollVote
                {
                    PollAnswer = PollAnswerLogic.Get(keyId),
                    User = user
                };

                PollVoteLogic.Add(pollVote);
            }

            // Record who the user was that just voted
            var pollUsersVote = new PollUsersVote
            {
                UserId = userId,
                PollId = id,
                DateVoted = DateTime.Now
            };
            PollVoteLogic.AddPollUsersVote(pollUsersVote);

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Details(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var poll = PollLogic.Get(id);

            if (poll == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            return View(poll);
        }
    }
}