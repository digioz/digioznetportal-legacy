using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using digioz.Portal.Domain.DomainModel;
using RssItem = digioz.Portal.Utilities.RssItem;


namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class LatestUsersViewModels
    {
        public IList<MembershipUser> Users { get; set; }
    }

    public class LowestPointUsersViewModels
    {
        public Dictionary<MembershipUser, int> Users { get; set; }
    }

    public class LowestPointPostsViewModels
    {
        public IList<Post> Posts { get; set; }
    }

    public class HighestViewedTopics
    {
        public IList<Topic> Topics { get; set; }
    }

    public class LatestNewsViewModel
    {
        public IList<RssItem> RssFeed { get; set; }
    }

    public class TodaysTopics
    {
        public IList<Topic> Topics { get; set; }
    }
}