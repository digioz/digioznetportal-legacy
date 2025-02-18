using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class PollVoteLogic : BaseLogic
    {
        public static List<PollVote> GetAll(string pollAnswerId)
        {
            var pollVotes = Db.PollVote.Where(x => x.PollAnswer.Id.ToString() == pollAnswerId).ToList();

            return pollVotes;
        }

        public static PollVote Get(string id)
        {
            var pollVote = Db.PollVote.SingleOrDefault();

            return pollVote;
        }

        public static void Add(PollVote pollVote)
        {
            Db.PollVote.Add(pollVote);
            Db.SaveChanges();
        }

        public static void DeleteRange(string pollAnswerId)
        {
            var pollVotes = Db.PollVote.Where(x => x.PollAnswer.Id.ToString() == pollAnswerId).ToList();

            Db.PollVote.RemoveRange(pollVotes);
            Db.SaveChanges();
        }

        public static void AddPollUsersVote(PollUsersVote pollUsersVote)
        {
            Db.PollUsersVotes.Add(pollUsersVote);
            Db.SaveChanges();
        }
    }
}
