using System;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.DomainModel.Attributes;
using digioz.Portal.Domain.Interfaces.Badges;

namespace Badges.Time
{
    [Id("52284d2b-7ed6-4154-9ccc-3a7d99b18cca")]
    [Name("MemberForAYear")]
    [DisplayName("Member For A Year")]
    [Description("This badge is awarded to a user after their first year anniversary.")]
    [Image("MemberForAYearBadge.png")]
    public class MemberForAYearBadge : ITimeBadge
    {
        public bool Rule(MembershipUser user, IForumService service)
        {
            var anniversary = new DateTime(user.CreateDate.Year + 1, user.CreateDate.Month, user.CreateDate.Day);
            return DateTime.UtcNow >= anniversary;
        }
    }
}
