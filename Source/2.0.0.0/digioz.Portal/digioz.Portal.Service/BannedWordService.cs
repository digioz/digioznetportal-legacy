﻿using System;
using System.Linq;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class BannedWordService : IBannedWordService
    {
        private readonly IBannedWordRepository _bannedWordRepository;

        public BannedWordService(IBannedWordRepository bannedWordRepository)
        {
            _bannedWordRepository = bannedWordRepository;
        }

        public BannedWord Add(BannedWord bannedWord)
        {
            return _bannedWordRepository.Add(bannedWord);
        }

        public void Delete(BannedWord bannedWord)
        {
            _bannedWordRepository.Delete(bannedWord);
        }

        public IList<BannedWord> GetAll()
        {
            return _bannedWordRepository.GetAll();
        }

        public BannedWord Get(Guid id)
        {
            return _bannedWordRepository.Get(id);
        }

        public PagedList<BannedWord> GetAllPaged(int pageIndex, int pageSize)
        {
            return _bannedWordRepository.GetAllPaged(pageIndex, pageSize);
        }

        public PagedList<BannedWord> GetAllPaged(string search, int pageIndex, int pageSize)
        {
            return _bannedWordRepository.GetAllPaged(search, pageIndex, pageSize);
        }

        public string SanitiseBannedWords(string content)
        {
            var bannedWords = GetAll();
            if (bannedWords.Any())
            {
                return SanitiseBannedWords(content, bannedWords.Select(x => x.Word).ToList());
            }
            return content;
        }

        public string SanitiseBannedWords(string content, IList<string> words)
        {
            if (words != null && words.Any())
            {
                var censor = new CensorUtils(words);
                return censor.CensorText(content);
            }
            return content;
        }
    }
}
