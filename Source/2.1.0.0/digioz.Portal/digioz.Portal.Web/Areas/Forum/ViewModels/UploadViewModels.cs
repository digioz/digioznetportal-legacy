using System;
using System.Web;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class AttachFileToPostViewModel
    {
        public HttpPostedFileBase[] Files { get; set; }
        public Guid UploadPostId { get; set; }
    }
}