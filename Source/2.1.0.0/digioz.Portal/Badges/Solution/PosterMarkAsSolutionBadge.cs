using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.DomainModel.Attributes;
using digioz.Portal.Domain.Interfaces.Badges;

namespace Badges.Solution
{
    [Id("8250f9f0-84d2-4dff-b651-c3df9e12bf2a")]
    [Name("PosterMarkAsSolution")]
    [DisplayName("Post Selected As Answer")]
    [Description("This badge is awarded to the poster of a post marked as the topic answer, the first time they author an answer.")]
    [Image("PosterMarkAsSolutionBadge.png")]
    public class PosterMarkAsSolutionBadge : IMarkAsSolutionBadge
    {
        public bool Rule(MembershipUser user, IForumService service)
        {
            //Post is marked as the answer to a topic - give the post author a badge
            var usersSolutions = service.Post.GetSolutionsByMember(user.Id);

            return (usersSolutions.Count >= 1);
        }
    }
}
