using System.Web.Mvc;
using System.IO;
using ElFinder;
using digioz.Portal.Web.Areas.Admin.Models.FileManager;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class FilesController : Controller
    {
        private Connector _connector;

        public Connector Connector
        {
            get
            {
                if (_connector == null)
                {
                    FileSystemDriver driver = new FileSystemDriver();
                    DirectoryInfo thumbsStorage = new DirectoryInfo(Server.MapPath("~/Files"));
/*
                    driver.AddRoot(new Root(new DirectoryInfo(@"C:\Program Files"))
                    {
                        IsLocked = true,
                        IsReadOnly = true,
                        IsShowOnly = true,
                        ThumbnailsStorage = thumbsStorage,
                        ThumbnailsUrl = "Thumbnails/"
                    });
 */
                    driver.AddRoot(new Root(new DirectoryInfo(Configuration.RootPath))
                    {
                        Alias = Configuration.RootAlias,
                        StartPath = new DirectoryInfo(Server.MapPath("~/Files/My documents")),
                        ThumbnailsStorage = thumbsStorage,
                        MaxUploadSizeInMb = Configuration.UplMaxSize,
                        ThumbnailsUrl = "Thumbnails/",
                        ArchiveMimeTypes = Configuration.ArchiveMimeTypes, 
                        ExtractMimeTypes = Configuration.ExtractMimeTypes
                    });
                    _connector = new Connector(driver); 
                }
                return _connector;
            }
        }
        public ActionResult Index()
        {
            return Connector.Process(this.HttpContext.Request);
        }

        public ActionResult SelectFile(string target)
        {
            return Json(Connector.GetFileByHash(target).FullName);
        }

        public ActionResult Thumbs(string tmb)
        {
            return Connector.GetThumbnail(Request, Response, tmb);
        }
    }
}
