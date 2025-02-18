using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.DomainModel.Attributes;
using digioz.Portal.Domain.Interfaces.Badges;

namespace Badges.VoteUp
{
    [Id("c9913ee2-b8e0-4543-8930-c723497ee65c")]
    [Name("UserVoteUp")]
    [DisplayName("You've Given Your First Vote Up")]
    [Description("This badge is awarded to users after they make their first vote up.")]
    [Image("UserVoteUpBadge.png")]
    public class UserVoteUpBadge : IVoteUpBadge
    {
        public bool Rule(MembershipUser user, IForumService service)
        {
            return user.Votes != null && user.Votes.Count >= 1;
        }
    }
}
