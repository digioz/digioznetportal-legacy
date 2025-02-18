using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class PollAnswerService : IPollAnswerService
    {
        private readonly IPollAnswerRepository _pollAnswerRepository;

        public PollAnswerService(IPollAnswerRepository pollAnswerRepository)
        {
            _pollAnswerRepository = pollAnswerRepository;
        }

        public List<PollAnswer> GetAllPollAnswers()
        {
            return _pollAnswerRepository.GetAllPollAnswers();
        }

        public PollAnswer Add(PollAnswer pollAnswer)
        {
            pollAnswer.Answer = StringUtils.SafePlainText(pollAnswer.Answer);
            return _pollAnswerRepository.Add(pollAnswer);
        }

        public PollAnswer Get(Guid id)
        {
            return _pollAnswerRepository.Get(id);
        }

        public void Delete(PollAnswer pollAnswer)
        {
            _pollAnswerRepository.Delete(pollAnswer);
        }

    }
}
