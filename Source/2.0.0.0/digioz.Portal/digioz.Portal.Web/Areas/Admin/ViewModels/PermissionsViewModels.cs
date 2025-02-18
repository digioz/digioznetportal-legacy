﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class ChoosePermissionsViewModel
    {
        public List<MembershipRole> MembershipRoles { get; set; }
        public List<Permission> Permissions { get; set; } 
    }

    public class EditPermissionsViewModel
    {
        public MembershipRole MembershipRole { get; set; }
        public List<Permission> Permissions { get; set; }
        public List<Category> Categories { get; set; } 
    }

    public class AddTypeViewModel
    {
        [HiddenInput]
        public Guid Id { get; set; }

        [Required]
        [DisplayName("Permission Type Name")]
        [StringLength(200)]
        public string Name { get; set; }
    }

    public class EditTypeViewModel
    {
        [HiddenInput]
        public Guid Id { get; set; }

        [Required]
        [DisplayName("Permission Type Name")]
        [StringLength(200)]
        public string Name { get; set; }
    }

    public class AjaxEditPermissionViewModel
    {
        [Required]
        public bool HasPermission { get; set; }

        [Required]
        public Guid Permission { get; set; }
        
        [Required]
        public string MembershipRole { get; set; }

        [Required]
        public Guid Category { get; set; }
    }
}