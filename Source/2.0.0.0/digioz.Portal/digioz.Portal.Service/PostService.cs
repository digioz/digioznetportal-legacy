﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using System.Linq;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class PostService : IPostService
    {
        private readonly IPostRepository _postRepository;
        private readonly ITopicRepository _topicRepository;
        private readonly IRoleService _roleService;
        private readonly IMembershipUserPointsService _membershipUserPointsService;
        private readonly ISettingsService _settingsService;
        private readonly ILocalizationService _localizationService;

        public PostService(IMembershipUserPointsService membershipUserPointsService,
            ISettingsService settingsService, IRoleService roleService, IPostRepository postRepository, ITopicRepository topicRepository,
            ILocalizationService localizationService)
        {
            _postRepository = postRepository;
            _topicRepository = topicRepository;
            _roleService = roleService;
            _membershipUserPointsService = membershipUserPointsService;
            _settingsService = settingsService;
            _localizationService = localizationService;
        }


        private MembershipRole UsersRole(MembershipUser user)
        {
            return user == null ? _roleService.GetRole(AppConstants.GuestRoleName) : user.Roles.FirstOrDefault();
        }

        public Post SanitizePost(Post post)
        {
            post.PostContent = StringUtils.GetSafeHtml(post.PostContent);
            return post;
        }

        public Post GetTopicStarterPost(Guid topicId)
        {
            return _postRepository.GetTopicStarterPost(topicId);
        }

        /// <summary>
        /// Return all posts
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Post> GetAll()
        {
            return _postRepository.GetAll();
        }

        /// <summary>
        /// Returns a list of posts ordered by the lowest vote
        /// </summary>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public IList<Post> GetLowestVotedPost(int amountToTake)
        {
            return _postRepository.GetLowestVotedPost(amountToTake);
        }

        /// <summary>
        /// Returns a list of posts ordered by the highest vote
        /// </summary>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public IList<Post> GetHighestVotedPost(int amountToTake)
        {
            return _postRepository.GetHighestVotedPost(amountToTake);
        }

        /// <summary>
        /// Return all posts by a specified member
        /// </summary>
        /// <param name="memberId"></param>
        /// <param name="amountToTake"></param>
        /// <returns></returns>
        public IList<Post> GetByMember(string memberId, int amountToTake)
        {
            return _postRepository.GetByMember(memberId, amountToTake);
        }

        /// <summary>
        /// Returns a paged list of posts by a search term
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <param name="searchTerm"></param>
        /// <returns></returns>
        public PagedList<Post> SearchPosts(int pageIndex, int pageSize, int amountToTake, string searchTerm)
        {
            var search = StringUtils.SafePlainText(searchTerm);

            return _postRepository.SearchPosts(pageIndex, pageSize, amountToTake, search);
        }

        /// <summary>
        /// Returns a paged list of posts by a topic id
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="amountToTake"></param>
        /// <param name="topicId"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public PagedList<Post> GetPagedPostsByTopic(int pageIndex, int pageSize, int amountToTake, Guid topicId, PostOrderBy order)
        {
            return _postRepository.GetPagedPostsByTopic(pageIndex, pageSize, amountToTake, topicId, order);
        }

        /// <summary>
        /// Return all posts by a specified member that are marked as solution
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public IList<Post> GetSolutionsByMember(string memberId)
        {
            return _postRepository.GetSolutionsByMember(memberId);
            //return _api.Post.GetSolutionsWrittenByMember(memberId);
        }

        /// <summary>
        /// Returns a count of all posts
        /// </summary>
        /// <returns></returns>
        public int PostCount()
        {
            return _postRepository.PostCount();
        }

        /// <summary>
        /// Create a new post
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        public Post Add(Post post)
        {
            post = SanitizePost(post);
            post.IsSolution = false;
            post.DateCreated = DateTime.UtcNow;
            post.DateEdited = DateTime.UtcNow;
            _postRepository.Add(post);
            return post; 
            //return _api.Post.Create(post);
        }

        /// <summary>
        /// Return a post by Id
        /// </summary>
        /// <param name="postId"></param>
        /// <returns></returns>
        public Post Get(Guid postId)
        {
            return _postRepository.Get(postId);
        }

        /// <summary>
        /// Save / Update a post
        /// </summary>
        /// <param name="post"></param>
        public void SaveOrUpdate(Post post)
        {
            _postRepository.Update(post); 
        }

        /// <summary>
        /// Delete a post
        /// </summary>
        /// <param name="post"></param>
        /// <returns> True if parent topic should now be deleted (caller's responsibility)</returns>
        public bool Delete(Post post)
        {
            // Here is where we can check for reasons not to delete the post
            // And change the value below if not
            var okToDelete = true;
            var deleteTopic = false;

            if (okToDelete)
            {           
                // Before we delete the post, we need to check if this is the last post in the topic
                // and if so update the topic
                var topic = post.Topic; 
                var lastPost = topic.Posts.OrderByDescending(x => x.DateCreated).FirstOrDefault();

                if (lastPost != null && lastPost.Id == post.Id)
                {
                    // Get the new last post and update the topic
                    topic.LastPost = topic.Posts.Where(x => x.Id != post.Id).OrderByDescending(x => x.DateCreated).FirstOrDefault();
                }

                if (topic.Solved && post.IsSolution)
                {
                    topic.Solved = false;
                }

                topic.Posts.Remove(post);

                deleteTopic = post.IsTopicStarter;

                // now delete the post
                _postRepository.Delete(post);

                // Topic should be deleted, so make sure it has no last post to avoid circular dependency
                if (deleteTopic)
                {
                    topic.LastPost = null;
                }
            }

            return deleteTopic;
        }


        /// <summary>
        /// Add a new post
        /// </summary>
        /// <param name="postContent"> </param>
        /// <param name="topic"> </param>
        /// <param name="user"></param>
        /// <param name="permissions"> </param>
        /// <returns>True if post added</returns>
        public Post AddNewPost(string postContent, Topic topic, MembershipUser user, out PermissionSet permissions)
        {
            // Get the permissions for the category that this topic is in
            permissions = _roleService.GetPermissions(topic.Category, UsersRole(user));

            // Check this users role has permission to create a post
            if (permissions[AppConstants.PermissionDenyAccess].IsTicked || permissions[AppConstants.PermissionReadOnly].IsTicked)
            {
                // Throw exception so Ajax caller picks it up
                throw new ApplicationException(_localizationService.GetResourceString("Errors.NoPermission"));
            }

            // Has permission so create the post
            var newPost = new Post
                               {
                                   PostContent = postContent,
                                   User = user,
                                   Topic = topic,
                                   IpAddress = StringUtils.GetUsersIpAddress()
                               };

            newPost = SanitizePost(newPost);

            // create the post
            Add(newPost);

            // Update the users points score and post count for posting
            _membershipUserPointsService.Add(new MembershipUserPoints
                                                    {
                                                        Points = _settingsService.GetSettings().PointsAddedPerPost,
                                                        User = user
                                                    });

            // add the last post to the topic
            topic.LastPost = newPost;
                
            // Removed as its updated via the commit
            //_topicRepository.Update(topic);


            return newPost;

        }
    }
}
