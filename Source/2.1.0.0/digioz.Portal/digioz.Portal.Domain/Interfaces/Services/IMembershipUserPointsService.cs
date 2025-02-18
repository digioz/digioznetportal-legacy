﻿using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IMembershipUserPointsService
    {
        void Delete(MembershipUserPoints points);
        IList<MembershipUserPoints> GetByUser(MembershipUser user);
        MembershipUserPoints Add(MembershipUserPoints points);
        Dictionary<MembershipUser, int> GetCurrentWeeksPoints(int? amountToTake);
        Dictionary<MembershipUser, int> GetThisYearsPoints(int? amountToTake);
        Dictionary<MembershipUser, int> GetAllTimePoints(int? amountToTake);
        Dictionary<MembershipUser, int> GetAllTimePointsNegative(int? amountToTake);
    }
}
