﻿using System;
using System.ComponentModel.DataAnnotations;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class BannedWordListViewModel
    {
        public PagedList<BannedWord> Words { get; set; }

        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
        public string Search { get; set; }
    }

    public class AddBannedWordViewModel
    {
        [Required]
        public string Word { get; set; }
    }

    public class AjaxEditWordViewModel
    {
        [Required]
        public Guid WordId { get; set; }

        [Required]
        public string NewName { get; set; }
    }
}