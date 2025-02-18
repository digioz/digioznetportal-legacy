using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using PagedList;

namespace digioz.Portal.Web.Controllers
{
    public class VideosController : Controller
    {
        //
        // GET: /Videos/
        public ActionResult Index()
        {
            digiozPortalEntities db = new digiozPortalEntities();

            List<VideosViewModel> videoAlbumList = new List<VideosViewModel>();
            VideosViewModel videoAlbum;

            var videoAlbums = db.VideoAlbums.Where(x => x.Visible == true).ToList();

            foreach (var item in videoAlbums)
            {
                videoAlbum = new VideosViewModel();
                videoAlbum.ID = item.ID;
                videoAlbum.Name = item.Name;
                videoAlbum.Description = item.Description;
                videoAlbum.Timestamp = item.Timestamp;
                videoAlbum.Visible = item.Visible;
                videoAlbum.Thumbnail = db.Videos.OrderByDescending(x => x.ID).Where(x => x.AlbumID == item.ID).Select(x => x.Thumbnail).FirstOrDefault();

                if (videoAlbum.Thumbnail == null || videoAlbum.Thumbnail == string.Empty)
                {
                    videoAlbum.Thumbnail = "VideoAlbumIcon.png";
                }

                videoAlbumList.Add(videoAlbum);
            }

            return View(videoAlbumList);
        }

        public ActionResult List(int id, int? page)
        {
            digiozPortalEntities db = new digiozPortalEntities();

            var videos = db.Videos.Where(x => x.AlbumID == id && x.Visible == true && x.Approved == true).ToList();

            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(videos.ToPagedList(pageNumber, pageSize));
        }
	}
}