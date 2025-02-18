using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Application;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class ListPrivateMessageViewModel
    {
        public IList<PrivateMessage> Messages { get; set; }
        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
    }

    public class CreatePrivateMessageViewModel
    {
        [MvcResourceDisplayName("PM.RecipientUsername")]
        [StringLength(150)]
        [Required]
        public string UserToUsername { get; set; }

        [MvcResourceDisplayName("PM.MessageSubject")]
        [Required]
        public string Subject { get; set; }

        //[UIHint("bbeditor"), AllowHtml]
        //[UIHint("tinymceeditor"), AllowHtml]
        [UIHint("markdowneditor"), AllowHtml]
        public string Message { get; set; }

        public string PreviousMessage { get; set; }

    }

    public class ViewPrivateMessageViewModel
    {
        public PrivateMessage Message { get; set; }
    }

    public class DeletePrivateMessageViewModel
    {
        public Guid Id { get; set; }
    }


}