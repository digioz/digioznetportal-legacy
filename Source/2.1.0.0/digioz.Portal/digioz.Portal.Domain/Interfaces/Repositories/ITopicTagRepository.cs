﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ITopicTagRepository
    {
        IEnumerable<TopicTag> GetAll();
        Dictionary<string, int> GetPopularTags(int? amountToTake);
        TopicTag GetTagName(string tag);
        PagedList<TopicTag> GetPagedGroupedTags(int pageIndex, int pageSize);
        PagedList<TopicTag> SearchPagedGroupedTags(string search, int pageIndex, int pageSize);
        IEnumerable<TopicTag> GetByTopic(Topic topic);

        TopicTag Add(TopicTag item);
        TopicTag Get(Guid id);
        void Delete(TopicTag item);
        void Update(TopicTag item);
    }
}
