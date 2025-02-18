using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class PollLogic : BaseLogic
    {
        public static List<Poll> GetAll()
        {
            var polls = Db.Poll.ToList();

            return polls;
        }

        public static Poll Get(string id)
        {
            var poll = Db.Poll.Include(x => x.PollAnswers).SingleOrDefault(x => x.Id.ToString() == id);

            return poll;
        }

        public static void Add(Poll poll)
        {
            Db.Poll.Add(poll);
            Db.SaveChanges();
        }

        public static void Edit(Poll poll)
        {
            Db.Entry(poll).State = EntityState.Modified;
            Db.SaveChanges();
        }

        public static void Delete(string id)
        {
            var poll = Db.Poll.SingleOrDefault(x => x.Id.ToString() == id);

            // Delete Poll Answers
            PollAnswerLogic.DeleteRange(id);

            Db.Poll.Remove(poll);
            Db.SaveChanges();
        }

        public static bool HasUserVotedOnPoll(string pollId, string userId)
        {
            bool result = false;

            var pollUserVotes = Db.PollUsersVotes.Where(x => x.PollId == pollId && x.UserId == userId).ToList();

            if (pollUserVotes.Any())
            {
                result = true;
            }

            return result;
        }

    }
}
