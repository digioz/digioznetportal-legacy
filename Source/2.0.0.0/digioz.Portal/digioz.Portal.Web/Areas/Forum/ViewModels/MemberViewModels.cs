using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
//using System.Web.Mvc;
//using DataAnnotationsExtensions;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Application;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class ActiveMembersViewModel
    {
        public IList<MembershipUser> ActiveMembers { get; set; } 
    }

    public class MemberAddViewModel
    {
        [Required]
        [MvcResourceDisplayName("Members.Label.Username")]
        [StringLength(150, MinimumLength = 4)]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        [MvcResourceDisplayName("Members.Label.EmailAddress")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 6)]
        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Compare("Password")]
        [MvcResourceDisplayName("Members.Label.ConfirmPassword")]
        public string ConfirmPassword { get; set; }

        [Required]
        public int MinPasswordLength { get; set; }

        [MvcResourceDisplayName("Members.Label.UserIsApproved")]
        public bool IsApproved { get; set; }

        [MvcResourceDisplayName("Members.Label.Comment")]
        public string Comment { get; set; }

        [MvcResourceDisplayName("Members.Label.Roles")]
        public string[] Roles { get; set; }

        public IList<MembershipRole> AllRoles { get; set; }

        public string SpamAnswer { get; set; }

        public string ReturnUrl { get; set; }
    }

    public class MemberFrontEndEditViewModel
    {
        [Required]
        public Guid Id { get; set; }

        [Required]
        [MvcResourceDisplayName("Members.Label.Username")]
        [StringLength(150, MinimumLength = 4)]
        public string UserName { get; set; }

        [MvcResourceDisplayName("Members.Label.EmailAddress")]
        [EmailAddress]
        [Required]
        public string Email { get; set; }

        [MvcResourceDisplayName("Members.Label.Signature")]
        [StringLength(1000)]
        //[UIHint("bbeditor"), AllowHtml]
        //[UIHint("tinymceeditor"), AllowHtml]
        [UIHint("markdowneditor")/*, AllowHtml*/]
        public string Signature { get; set; }

        //[ForumMvcResourceDisplayName("Members.Label.Location")]
        //[StringLength(100)]
        //public string Location { get; set; }

    }

    public class RegisterViewModel
    {
        [Required]
        [MvcResourceDisplayName("Members.Label.Username")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [MvcResourceDisplayName("Members.Label.EmailAddress")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 6)]
        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.Password ")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Compare("Password")]
        [MvcResourceDisplayName("Members.Label.ConfirmPassword")]
        public string ConfirmPassword { get; set; }

        [Required]
        public bool LogInNow { get; set; }

        [Required]
        public int MinPasswordLength { get; set; }
    }

    public class LogOnViewModel
    {
        public string ReturnUrl { get; set; }

        [Required]
        [MvcResourceDisplayName("Members.Label.Username")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.Password")]
        public string Password { get; set; }

        [MvcResourceDisplayName("Members.Label.RememberMe")]
        public bool RememberMe { get; set; }
    }

    public class ViewMemberViewModel
    {
        public MembershipUser User { get; set; }
        public string LoggedOnUserId { get; set; }
    }

    public class ViewMemberDiscussionsViewModel
    {
        public IList<Topic> Topics { get; set; }
        public Dictionary<Category, PermissionSet> AllPermissionSets { get; set; }
        public MembershipUser CurrentUser { get; set; }
    }

    public class ViewAdminSidePanelViewModel
    {
        public MembershipUser CurrentUser { get; set; }
        public int NewPrivateMessageCount { get; set; }
    }

    public class AdminMemberProfileToolsViewModel
    {
        public MembershipUser CurrentUser { get; set; }
    }

    public class AutocompleteViewModel
    {
        public string label { get; set; }
        public string value { get; set; }
        public string id { get; set; }
    }

    public class ReportMemberViewModel
    {
        public string Id { get; set; }
        public string Username { get; set; }
        public string Reason { get; set; }
    }

    public class ListLatestMembersViewModel
    {
        public Dictionary<string, string> Users { get; set; }
    }

    public class PublicMemberListViewModel
    {
        [MvcResourceDisplayName("Members.Label.Users")]
        public IList<PublicSingleMemberListViewModel> Users { get; set; }
        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
        public string Search { get; set; }
    }

    public class PublicSingleMemberListViewModel
    {
        [MvcResourceDisplayName("Members.Label.Username")]
        public string UserName { get; set; }

        public string NiceUrl { get; set; }

        [MvcResourceDisplayName("Members.Label.DateJoined")]
        public DateTime CreateDate { get; set; }

        public int TotalPoints { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [MvcResourceDisplayName("Members.Label.EmailAddressBlank")]
        [EmailAddress]
        [Required]
        public string EmailAddress { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.CurrentPassword")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 6)]
        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.NewPassword")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [MvcResourceDisplayName("Members.Label.ConfirmNewPassword")]
        [Compare("NewPassword")]
        public string ConfirmPassword { get; set; }
    }
}