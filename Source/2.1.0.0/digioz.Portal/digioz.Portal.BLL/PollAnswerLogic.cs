using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class PollAnswerLogic : BaseLogic
    {
        public static List<PollAnswer> GetAll(string pollId)
        {
            var pollAnswers = Db.PollAnswer.Where(x => x.Poll.Id.ToString() == pollId).Include(y => y.PollVotes).ToList();

            return pollAnswers;
        }

        public static PollAnswer Get(string id)
        {
            var pollAnswer = Db.PollAnswer.Include(y => y.Poll).SingleOrDefault(x => x.Id.ToString() == id);

            return pollAnswer;
        }

        public static void Add(PollAnswer pollAnswer)
        {
            Db.PollAnswer.Add(pollAnswer);
            Db.SaveChanges();
        }

        public static void AddRange(List<PollAnswer> pollAnswers)
        {
            Db.PollAnswer.AddRange(pollAnswers);
            Db.SaveChanges();
        }

        public static void Edit(PollAnswer pollAnswer)
        {
            Db.Entry(pollAnswer).State = EntityState.Modified;
            Db.SaveChanges();
        }

        public static void Delete(string id)
        {
            var pollAnswer = Db.PollAnswer.SingleOrDefault(x => x.Id.ToString() == id);

            Db.PollAnswer.Remove(pollAnswer);
            Db.SaveChanges();
        }

        public static void DeleteRange(string pollId)
        {
            var pollAnswers = Db.PollAnswer.Where(x => x.Id.ToString() == pollId).ToList();

            // Delete Poll Votes
            foreach (var pollAnswer in pollAnswers)
            {
                PollVoteLogic.DeleteRange(pollAnswer.Id.ToString());
            }

            Db.PollAnswer.RemoveRange(pollAnswers);
            Db.SaveChanges();
        }
    }
}
