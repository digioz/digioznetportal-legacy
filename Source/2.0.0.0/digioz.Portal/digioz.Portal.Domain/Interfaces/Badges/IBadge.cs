/**    How To Create A Badge Class:
    ================================

    1. Reference the following DLL in your assembly:

        digioz.Portal.Domain.dll (found in e.g. "digioz.Portal.Core\bin\Debug")

    2. Create a class. Add these references:

        using digioz.Portal.Domain.DomainModel;
        using digioz.Portal.Domain.DomainModel.Attributes;
        using digioz.Portal.Domain.Interfaces.Badges;

    3. Inherit from the appropriate badge type interface, e.g. digioz.Portal.Domain.Interfaces.Badges.IVoteUpBadge

    4. Implement the interface i.e.

        bool Rule(MembershipUser user)
        {
            // rule code
            return rule result;
        }

    5.Add the attributes to the class (if these are missing then the rule will be ignored):

        "Id": this is the Guid used to identify the badge

        "Name": the name of the badge, assumed to be unique, therefore if the Id is known but the name has been changed then
        an edit to the badge is assumed (i.e. the name has changed)
	
        "Description": Some text describing your badge

        For example:

        [Id("91e6a90c-c1f1-4fcd-93f0-a40b90f34e2e")]
        [Name("TestBadge 4")]
        [Description("the class 4 badge")]

**/

using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Domain.Interfaces.Badges
{
    public interface IBadge
    {
        bool Rule(MembershipUser user, IForumService service);
    }
}
