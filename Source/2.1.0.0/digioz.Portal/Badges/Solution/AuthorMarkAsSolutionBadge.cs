using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.DomainModel.Attributes;
using digioz.Portal.Domain.Interfaces.Badges;

namespace Badges.Solution
{
    [Id("d68c289a-e3f7-4f55-ae4f-fc7ac2147781")]
    [Name("AuthorMarkAsSolution")]
    [DisplayName("Your Question Solved")]
    [Description("This badge is awarded to topic authors the first time they have a post marked as the answer.")]
    [Image("UserMarkAsSolutionBadge.png")]
    public class AuthorMarkAsSolutionBadge : IMarkAsSolutionBadge
    {
        /// <summary>
        /// Post is marked as the answer to a topic - give the topic author a badge
        /// </summary>
        /// <returns></returns>
        public bool Rule(MembershipUser user, IForumService service)
        {
            return service.Topic.GetSolvedTopicsByMember(user.Id).Count >= 1;
        }

    }
}
