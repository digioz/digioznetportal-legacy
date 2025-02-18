﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ITopicRepository
    {
        IList<Topic> GetAll();
        IList<Topic> GetHighestViewedTopics(int amountToTake);
        IList<Topic> GetTodaysTopics(int amountToTake);
        IList<Topic> GetSolvedTopicsByMember(string memberId);
        PagedList<Topic> GetRecentTopics(int pageIndex, int pageSize, int amountToTake);
        IList<Topic> GetRecentRssTopics(int amountToTake);
        IList<Topic> GetTopicsByUser(string memberId);
        IList<Topic> GetAllTopicsByCategory(Guid categoryId);
        PagedList<Topic> GetPagedTopicsByCategory(int pageIndex, int pageSize, int amountToTake, Guid categoryId);
        PagedList<Topic> GetPagedTopicsAll(int pageIndex, int pageSize, int amountToTake);
        PagedList<Topic> SearchTopics(int pageIndex, int pageSize, int amountToTake, string searchTerm);
        PagedList<Topic> GetTopicsByCsv(int pageIndex, int pageSize, int amountToTake, List<Guid> topicIds);
        IList<Topic> GetTopicsByCsv(int amountToTake, List<Guid> topicIds);
        IList<Topic> GetRssTopicsByCategory(int amountToTake, Guid categoryId);
        PagedList<Topic> GetPagedTopicsByTag(int pageIndex, int pageSize, int amountToTake, string tag);
        Topic GetTopicBySlug(string slug);
        IList<Topic> GetTopicBySlugLike(string slug);
        int TopicCount();

        Topic Add(Topic item);
        Topic Get(Guid id);
        void Delete(Topic item);
        void Update(Topic item);
    }
}
