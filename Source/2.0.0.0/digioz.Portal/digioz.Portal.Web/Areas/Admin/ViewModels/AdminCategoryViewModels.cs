﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
//using DataAnnotationsExtensions;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class ListCategoriesViewModel
    {
        public IEnumerable<Category> Categories { get; set; }
    }

    public class CreateCategoryViewModel
    {
        [HiddenInput]
        public Guid Id { get; set; }

        [DisplayName("Category Name")]
        [Required]
        [StringLength(600)]
        public string Name { get; set; }

        [DisplayName("Category Description")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [DisplayName("Lock The Category")]
        public bool IsLocked { get; set; }

        [DisplayName("Sort Order")]
        [Range(0, 200, ErrorMessage = "Please enter valid order Number")]
        public int SortOrder { get; set; }

        [DisplayName("Parent Category")]
        public Guid? ParentCategory { get; set; }

        public List<Category> AllCategories { get; set; } 
    }

    public class EditCategoryViewModel
    {
        [DisplayName("Category Name")]
        [Required]
        [StringLength(200)]
        public string Name { get; set; }

        [DisplayName("Category Description")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [DisplayName("Lock The Category")]
        public bool IsLocked { get; set; }

        [DisplayName("Sort Order")]
        [Range(0, 200, ErrorMessage = "Please enter valid sort Number")]
        public int SortOrder { get; set; }

        [HiddenInput]
        public Guid Id { get; set; }

        [HiddenInput]
        public DateTime DateCreated { get; set; }

        [HiddenInput]
        public string NiceUrl { get; set; }

        [DisplayName("Parent Category")]
        public Guid? ParentCategory { get; set; }

        public List<Category> AllCategories { get; set; } 
    }

    public class DeleteCategoryViewModel
    {
        [HiddenInput]
        public Guid Id { get; set; }

        public Category Category { get; set; }

        public List<Category> SubCategories { get; set; }
    }
}