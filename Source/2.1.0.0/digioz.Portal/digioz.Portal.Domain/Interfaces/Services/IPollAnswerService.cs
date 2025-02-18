using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.DomainModel.Activity;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IPollAnswerService
    {
        List<PollAnswer> GetAllPollAnswers();
        PollAnswer Add(PollAnswer pollAnswer);
        PollAnswer Get(Guid id);
        void Delete(PollAnswer pollAnswer);
    }
}
