﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public enum LoginAttemptStatus
    {
        LoginSuccessful,
        UserNotFound,
        PasswordIncorrect,
        PasswordAttemptsExceeded,
        UserLockedOut,
        UserNotApproved,
    }

    public interface IMembershipService
    {
        MembershipUser SanitizeUser(MembershipUser membershipUser);
        bool ValidateUser(string userName, string password, int maxInvalidPasswordAttempts);
        LoginAttemptStatus LastLoginStatus { get; }
        string[] GetRolesForUser(string username);
        MembershipUser GetUser(string username);
        MembershipUser GetUserByEmail(string email);
        MembershipUser GetUserBySlug(string slug);
        IList<MembershipUser> GetUsersById(List<string> guids);
        IList<MembershipUser> GetUsersByDaysPostsPoints(int amoutOfDaysSinceRegistered, int amoutOfPosts);
        MembershipUser GetUserById(string id);
        bool ChangePassword(MembershipUser user, string oldPassword, string newPassword);
        bool ResetPassword(MembershipUser user, string newPassword);
        void UnlockUser(string username, bool resetPasswordAttempts);
        //MembershipCreateStatus CreateUser(MembershipUser newUser);
        string GenerateSlug(string userName);
        string ErrorCodeToString(MembershipCreateStatus createStatus);
        //MembershipUser CreateEmptyUser();
        IList<MembershipUser> GetAll();
        PagedList<MembershipUser> GetAll(int pageIndex, int pageSize);
        PagedList<MembershipUser> SearchMembers(string search, int pageIndex, int pageSize);
        IList<MembershipUser> SearchMembers(string username, int amount);
        IList<MembershipUser> GetActiveMembers();
        void Save(MembershipUser user);
        void ProfileUpdated(MembershipUser user);
        bool Delete(MembershipUser user);
        IList<MembershipUser> GetLatestUsers(int amountToTake);
        IList<MembershipUser> GetLowestPointUsers(int amountToTake);
        int MemberCount();
        string ToCsv();
        CsvReport FromCsv(List<string> allLines);
    }
}
