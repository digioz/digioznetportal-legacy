﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.Entity;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Utilities;


namespace digioz.Portal.Data.Repositories
{
    public class PostRepository : IPostRepository
    {
        private readonly digiozPortalEntities _context;
        public PostRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public IEnumerable<Post> GetAll()
        {
            return _context.Post;
        }

        public Post GetTopicStarterPost(Guid topicId)
        {
            return _context.Post.Include(x => x.Topic).FirstOrDefault(x => x.Topic.Id == topicId && x.IsTopicStarter);
        }

        public IEnumerable<Post> GetAllWithTopics()
        {
            return _context.Post.Include(x => x.Topic);
        }

        public IList<Post> GetLowestVotedPost(int amountToTake)
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.VoteCount < 0)
                .OrderBy(x => x.VoteCount)
                .Take(amountToTake)
                .ToList();
        }

        public IList<Post> GetHighestVotedPost(int amountToTake)
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.VoteCount > 0)
                .OrderByDescending(x => x.VoteCount)
                .Take(amountToTake)
                .ToList();
        }

        public IList<Post> GetByMember(string memberId, int amountToTake)
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.User.Id == memberId)
                .OrderByDescending(x => x.DateCreated)
                .Take(amountToTake)
                .ToList();
        }

        /// <summary>
        /// Get all posts that are solutions, by user
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public IList<Post> GetSolutionsByMember(string memberId)
        {
            string usrId = memberId.ToString();
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.User.Id == usrId)
                .Where(x => x.IsSolution)
                .OrderByDescending(x => x.DateCreated)
                .ToList();
        }

        public IList<Post> GetPostsByTopic(Guid topicId)
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.Topic.Id == topicId)
                .OrderByDescending(x => x.DateCreated)
                .ToList();
        }

        public PagedList<Post> GetPagedPostsByTopic(int pageIndex, int pageSize, int amountToTake, Guid topicId, PostOrderBy order)
        {
            // We might only want to display the top 100
            // but there might not be 100 topics
            var total = _context.Post.Count(x => x.Topic.Id == topicId);
            if (amountToTake < total)
            {
                total = amountToTake;
            }

            // Get the topics using an efficient
            var results = _context.Post
                                  .Include(x => x.User)
                                  .Include(x => x.Topic)
                                  .Include(x => x.Votes)
                                  .Include(x => x.Files)
                                  .Where(x => x.Topic.Id == topicId && !x.IsTopicStarter);

            // Sort what order the posts are sorted in
            switch (order)
            {
                case PostOrderBy.Newest:
                    results = results.OrderByDescending(x => x.DateCreated);
                    break;

                case PostOrderBy.Votes:
                    results = results.OrderByDescending(x => x.VoteCount).ThenBy(x => x.DateCreated);
                    break;

                default:
                    results = results.OrderBy(x => x.DateCreated);
                    break;
            }

            // sort the paging out
            results = results.Skip((pageIndex - 1)*pageSize).Take(pageSize);
                                                                
            // Return a paged list
            return new PagedList<Post>(results.ToList(), pageIndex, pageSize, total);
        }

        public IList<Post> GetPostsByMember(string memberId)
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.User.Id == memberId)
                .OrderByDescending(x => x.DateCreated)
                .ToList();
        }

        public IList<Post> GetAllSolutionPosts()
        {
            return _context.Post
                .Include(x => x.Votes)
                .Where(x => x.IsSolution)
                .OrderByDescending(x => x.DateCreated)
                .ToList();
        }

        public PagedList<Post> SearchPosts(int pageIndex, int pageSize, int amountToTake, string searchTerm)
        {
            // We might only want to display the top 100
            // but there might not be 100 topics
            var total = _context.Post.Count(x => x.PostContent.Contains(searchTerm) | x.Topic.Name.Contains(searchTerm));
            if (amountToTake < total)
            {
                total = amountToTake;
            }

            // Get the Posts
            var results = _context.Post
                            .Include(x => x.Votes)
                            .Where(x => x.PostContent.Contains(searchTerm) | x.Topic.Name.Contains(searchTerm))
                            .OrderByDescending(x => x.DateCreated)
                            .Skip((pageIndex - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();


            // Return a paged list
            return new PagedList<Post>(results, pageIndex, pageSize, total);
        }

        public Post Add(Post post)
        {
            return _context.Post.Add(post);
        }

        public Post Get(Guid id)
        {
            return _context.Post.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(Post item)
        {
            _context.Post.Remove(item);
        }

        public void Update(Post item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.Post.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;  
        }

        public int PostCount()
        {
            return GetAll().Count();
        }
    }
}
