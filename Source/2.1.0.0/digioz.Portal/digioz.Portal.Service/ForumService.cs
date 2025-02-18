using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Services
{
    public class ForumService : IForumService
    {
        public ForumService(IPostService postService, ITopicService topicService)
        {
            Post = postService;
            Topic = topicService;
        }

        public IPostService Post { get; set; }
        public ITopicService Topic { get; set; }
    }
}
