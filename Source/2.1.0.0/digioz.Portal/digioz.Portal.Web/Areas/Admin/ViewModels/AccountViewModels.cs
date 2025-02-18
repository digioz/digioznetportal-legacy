using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
//using DataAnnotationsExtensions;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{

    #region Users

    public class SingleMemberListViewModel
    {
        [Required]
        public string Id { get; set; }

        [Required]
        [Display(Name = "User Name")]        
        public string UserName { get; set; }

        [Display(Name = "Locked Out")]
        public bool IsLockedOut { get; set; }

        [Display(Name = "Approved")]
        public bool IsApproved { get; set; }

        [Display(Name = "Roles")]
        public string[] Roles { get; set; }
    }

    public class MemberListViewModel
    {
        [Required]
        [Display(Name = "Users")]
        public IList<SingleMemberListViewModel> Users { get; set; }

        [Required]
        [Display(Name = "Roles")]
        public IList<MembershipRole> AllRoles { get; set; }

        public string Id { get; set; }

        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
        public string Search { get; set; }

    }

    public class MemberEditViewModel
    {
        [Required]
        public string Id { get; set; }

        [Required]
        [Display(Name = "User Name")]
        [StringLength(150)]
        public string UserName { get; set; }

        [Display(Name = "Password Question")]
        public string PasswordQuestion { get; set; }

        [Display(Name = "Password Answer")]
        public string PasswordAnswer { get; set; }

        [Display(Name = "Email Address")]
        [EmailAddress]
        public string Email { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        [DisplayName("Birthday Visible")]
        public Nullable<bool> BirthdayVisible { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }

        [Display(Name = "Signature")]
        [StringLength(1000)]
        //[UIHint("bbeditor"), AllowHtml]
        //[UIHint("tinymceeditor"), AllowHtml]
        [UIHint("markdowneditor"), AllowHtml]
        public string Signature { get; set; }

        [Display(Name = "User is Approved")]
        public bool IsApproved { get; set; }

        [Display(Name = "Disable email notifications for this member")]
        public bool DisableEmailNotifications { get; set; }
        
        [Display(Name = "Disable posting. The user will not be able to post or create topics")]
        public bool DisablePosting { get; set; }
        
        [Display(Name = "Disable private messages for this user")]
        public bool DisablePrivateMessages { get; set; }

        [Display(Name = "Disable file uploading on posts and topics for this user")]
        public bool DisableFileUploads { get; set; }

        [Display(Name = "User is Locked Out")]
        public bool IsLockedOut { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime LastLoginDate { get; set; }

        public DateTime LastPasswordChangedDate { get; set; }

        public DateTime LastLockoutDate { get; set; }

        public int FailedPasswordAttemptCount { get; set; }

        public int FailedPasswordAnswerAttempt { get; set; }


        [Display(Name = "Comment")]
        public string Comment { get; set; }

        [Display(Name = "Roles")]
        public string[] Roles { get; set; }

        public IList<MembershipRole> AllRoles { get; set; }

    }

    #endregion

    #region Roles

    public class AjaxRoleUpdateViewModel
    {
        public string Id { get; set; }
        public string[] Roles { get; set; }
    }

    public class RoleListViewModel
    {
        public IList<MembershipRole> MembershipRoles { get; set; }
    }

    public class RoleViewModel
    {
        [Required]
        [HiddenInput]
        public string Id { get; set; }

        [Required]
        [Display(Name = "Role Name")]
        public string RoleName { get; set; }

    }


    #endregion

}
