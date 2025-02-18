﻿using System.Linq;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.DomainModel.Attributes;
using digioz.Portal.Domain.Interfaces.Badges;

namespace Badges.VoteUp
{
    [Id("2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1")]
    [Name("PosterVoteUp")]
    [DisplayName("First Vote Up Received")]
    [Description("This badge is awarded to users after they receive their first vote up from another user.")]
    [Image("PosterVoteUpBadge.png")]
    public class PosterVoteUpBadge : IVoteUpBadge
    {
        public bool Rule(MembershipUser user, IForumService service)
        {
            return user.Posts != null && user.Posts.Any(post => post.Votes.Count > 0);
        }
    }
}
