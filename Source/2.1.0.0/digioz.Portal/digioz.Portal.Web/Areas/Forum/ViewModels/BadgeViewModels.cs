using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class VoteBadgeViewModel
    {
        public Guid PostId { get; set; }
    }

    public class MarkAsSolutionBadgeViewModel
    {
        public Guid PostId { get; set; }
    }

    public class PostBadgeViewModel
    {
        public Guid PostId { get; set; }
    }

    public class TimeBadgeViewModel
    {
        public string Id { get; set; }
    }

    public class AllBadgesViewModel
    {
        public IList<Badge> AllBadges { get; set; }
    }
}