﻿using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace digioz.Portal.Domain.DomainModel.Activity
{

    public class ProfileUpdatedActivity : ActivityBase
    {
        public const string KeyUserId = @"UserID";

        public MembershipUser User { get; set; }
        
        /// <summary>
        /// Constructor - useful when constructing a badge activity after reading database
        /// </summary>
        public ProfileUpdatedActivity(Activity activity, MembershipUser user)
        {
            ActivityMapped = activity;
            User = user;
        }

        public static Activity GenerateMappedRecord(MembershipUser user, DateTime modified)
        {
            return new Activity
            {
                Data = KeyUserId + Equality + user.Id,
                Timestamp = modified,
                Type = ActivityType.ProfileUpdated.ToString()
            };

        }
    }
}
