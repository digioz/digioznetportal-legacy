﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class TopicService : ITopicService
    {
        private readonly ITopicRepository _topicRepository;
        private readonly ITopicNotificationService _topicNotificationService;
        private readonly IPostRepository _postRepository;
        private readonly IMembershipUserPointsService _membershipUserPointsService;
        private readonly ISettingsService _settingsService;

        public TopicService(IMembershipUserPointsService membershipUserPointsService,
            ISettingsService settingsService, ITopicRepository topicRepository, IPostRepository postRepository, ITopicNotificationService topicNotificationService)
        {
            _membershipUserPointsService = membershipUserPointsService;
            _settingsService = settingsService;
            _topicRepository = topicRepository;
            _postRepository = postRepository;
            _topicNotificationService = topicNotificationService;
        }

        public Topic SanitizeTopic(Topic topic)
        {
            topic.Name = StringUtils.SafePlainText(topic.Name);
            return topic;
        }

        /// <summary>
        /// Get all topics
        /// </summary>
        /// <returns></returns>
        public IList<Topic> GetAll()
        {
            return _topicRepository.GetAll();
        }

        public IList<Topic> GetHighestViewedTopics(int amountToTake)
        {
            return _topicRepository.GetHighestViewedTopics(amountToTake);
        }

        /// <summary>
        /// Create a new topic and also the topic starter post
        /// </summary>
        /// <param name="topic"></param>
        /// <returns></returns>
        public Topic Add(Topic topic)
        {
            topic = SanitizeTopic(topic);

            topic.CreateDate = DateTime.UtcNow;

            // url slug generator
            topic.Slug = ServiceHelpers.GenerateSlug(topic.Name, x => _topicRepository.GetTopicBySlugLike(ServiceHelpers.CreateUrl(topic.Name)));
            
            return _topicRepository.Add(topic);
        }

        /// <summary>
        /// Get todays topics
        /// </summary>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public IList<Topic> GetTodaysTopics(int amountToTake)
        {
            return _topicRepository.GetTodaysTopics(amountToTake);
        }

        /// <summary>
        /// Add a last post to a topic. Must be part of a separate database update
        /// in EF because of circular dependencies. So save the topic before calling this.
        /// </summary>
        /// <param name="topic"></param>
        /// <param name="postContent"></param>
        /// <returns></returns>
        public Topic AddLastPost(Topic topic, string postContent)
        {

            topic = SanitizeTopic(topic);

            // Create the post
            var post = new Post
            {
                DateCreated = DateTime.UtcNow,
                IsTopicStarter = true,
                DateEdited = DateTime.UtcNow,
                PostContent = StringUtils.GetSafeHtml(postContent),
                User = topic.User,
                Topic = topic
            };

            // Add the post
            _postRepository.Add(post);

            topic.LastPost = post;

            return topic;
        }

        /// <summary>
        /// Returns a paged list of topics, ordered by most recent
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public PagedList<Topic> GetRecentTopics(int pageIndex, int pageSize, int amountToTake)
        {
            return _topicRepository.GetRecentTopics(pageIndex, pageSize, amountToTake);
        }

        /// <summary>
        /// Returns a specified amount of most recent topics in a list used for RSS feeds
        /// </summary>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public IList<Topic> GetRecentRssTopics(int amountToTake)
        {
            return _topicRepository.GetRecentRssTopics(amountToTake);
        }

        /// <summary>
        /// Returns all topics by a specified user
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public IList<Topic> GetTopicsByUser(string memberId)
        {
            return _topicRepository.GetTopicsByUser(memberId);
        }

        /// <summary>
        /// Returns a paged list of topics from a specified category
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public PagedList<Topic> GetPagedTopicsByCategory(int pageIndex, int pageSize, int amountToTake, Guid categoryId)
        {
            return _topicRepository.GetPagedTopicsByCategory(pageIndex, pageSize, amountToTake, categoryId);
        }

        /// <summary>
        /// Returns a specified amount of most recent topics in a category used for RSS feeds
        /// </summary>
        /// <param name="amountToTake"></param>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public IList<Topic> GetRssTopicsByCategory(int amountToTake, Guid categoryId)
        {
            return _topicRepository.GetRssTopicsByCategory(amountToTake, categoryId);
        }

        /// <summary>
        /// Returns a paged amount of topics in a list filtered via tag
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <param name="tag"></param>
        /// <returns></returns>
        public PagedList<Topic> GetPagedTopicsByTag(int pageIndex, int pageSize, int amountToTake, string tag)
        {
            return _topicRepository.GetPagedTopicsByTag(pageIndex, pageSize, amountToTake, StringUtils.GetSafeHtml(tag));
        }

        /// <summary>
        /// Returns a paged amount of searched topics by a string search value
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <param name="searchTerm"></param>
        /// <returns></returns>
        public PagedList<Topic> SearchTopics(int pageIndex, int pageSize, int amountToTake, string searchTerm)
        {
            var search = StringUtils.SafePlainText(searchTerm);
            return _topicRepository.SearchTopics(pageIndex, pageSize, amountToTake, search);
        }

        public PagedList<Topic> GetTopicsByCsv(int pageIndex, int pageSize, int amountToTake, List<Guid> topicIds)
        {
            return _topicRepository.GetTopicsByCsv(pageIndex, pageSize, amountToTake, topicIds);
        }

        public IList<Topic> GetTopicsByCsv(int amountToTake, List<Guid> topicIds)
        {
            return _topicRepository.GetTopicsByCsv(amountToTake, topicIds);
        }

        /// <summary>
        /// Return a topic by url slug
        /// </summary>
        /// <param name="slug"></param>
        /// <returns></returns>
        public Topic GetTopicBySlug(string slug)
        {
            return _topicRepository.GetTopicBySlug(StringUtils.GetSafeHtml(slug));
        }

        /// <summary>
        /// Return a topic by Id
        /// </summary>
        /// <param name="topicId"></param>
        /// <returns></returns>
        public Topic Get(Guid topicId)
        {
            return _topicRepository.Get(topicId);
        }

        /// <summary>
        /// Save a topic
        /// </summary>
        /// <param name="topic"></param>
        public void SaveOrUpdate(Topic topic)
        {
            topic = SanitizeTopic(topic);

            _topicRepository.Update(topic);
        }

        /// <summary>
        /// Delete a topic
        /// </summary>
        /// <param name="topic"></param>
        public void Delete(Topic topic)
        {
            topic.LastPost = null;
            topic.Tags.Clear();

            // Delete all posts
            if (topic.Posts != null)
            {
                var postsToDelete = new List<Post>();
                postsToDelete.AddRange(topic.Posts);
                foreach (var post in postsToDelete)
                {
                    _postRepository.Delete(post);
                } 
            }

            if (topic.TopicNotifications != null)
            {
                var notificationsToDelete = new List<TopicNotification>();
                notificationsToDelete.AddRange(topic.TopicNotifications);
                foreach (var topicNotification in notificationsToDelete)
                {
                    _topicNotificationService.Delete(topicNotification);
                } 
            }

            _topicRepository.Delete(topic);
        }

        public int TopicCount()
        {
            return _topicRepository.TopicCount();
        }

        /// <summary>
        /// Return topics by a specified user that are marked as solved
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public IList<Topic> GetSolvedTopicsByMember(string memberId)
        {
            return _topicRepository.GetSolvedTopicsByMember(memberId);

            //return _api.Topic.GetSolvedTopicsByMember(memberId);
        }

        /// <summary>
        /// Mark a topic as solved
        /// </summary>
        /// <param name="topic"></param>
        /// <param name="post"></param>
        /// <param name="marker"></param>
        /// <param name="solutionWriter"></param>
        /// <returns>True if topic has been marked as solved</returns>
        public bool SolveTopic(Topic topic, Post post, MembershipUser marker, MembershipUser solutionWriter)
        {
            var solved = false;

            // Make sure this user owns the topic, if not do nothing
            if (topic.User.Id == marker.Id)
            {
                // Update the post
                post.IsSolution = true;
                //_postRepository.Update(post);

                // Update the topic
                topic.Solved = true;
                //SaveOrUpdate(topic);

                // Assign points
                // Do not give points to the user if they are marking their own post as the solution
                if (marker.Id != solutionWriter.Id)
                {
                    _membershipUserPointsService.Add(new MembershipUserPoints
                                                            {
                                                                Points = _settingsService.GetSettings().PointsAddedForSolution,
                                                                User = solutionWriter
                                                            });
                }

                solved = true;
           }

            return solved;
        }
    }
}
