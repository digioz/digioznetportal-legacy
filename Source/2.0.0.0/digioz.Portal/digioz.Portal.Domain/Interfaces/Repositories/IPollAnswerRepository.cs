using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IPollAnswerRepository
    {
        List<PollAnswer> GetAllPollAnswers();
        List<PollAnswer> GetAllPollAnswersByPoll(Poll poll);
        PollAnswer Add(PollAnswer pollAnswer);
        PollAnswer Get(Guid id);
        void Delete(PollAnswer pollAnswer);
    }
}
