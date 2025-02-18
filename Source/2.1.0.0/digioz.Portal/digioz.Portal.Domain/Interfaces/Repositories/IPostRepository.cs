using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IPostRepository
    {
        IEnumerable<Post> GetAll();
        Post GetTopicStarterPost(Guid topicId);
        IEnumerable<Post> GetAllWithTopics();
        IList<Post> GetLowestVotedPost(int amountToTake);
        IList<Post> GetHighestVotedPost(int amountToTake);
        IList<Post> GetByMember(string memberId, int amountToTake);
        IList<Post> GetSolutionsByMember(string memberId);
        IList<Post> GetPostsByTopic(Guid topicId);
        PagedList<Post> GetPagedPostsByTopic(int pageIndex, int pageSize, int amountToTake, Guid topicId, PostOrderBy order);
        IList<Post> GetPostsByMember(string memberId);
        IList<Post> GetAllSolutionPosts();
        PagedList<Post> SearchPosts(int pageIndex, int pageSize, int amountToTake, string searchTerm); 

        int PostCount();

        Post Add(Post item);
        Post Get(Guid id);
        void Delete(Post item);
        void Update(Post item);
    }
}
