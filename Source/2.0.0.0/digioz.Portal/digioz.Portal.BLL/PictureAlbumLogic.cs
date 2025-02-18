using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
	public class PictureAlbumLogic : BaseLogic
	{
		public static PictureAlbum Get(int id)
		{
			var model = Db.PictureAlbums.SingleOrDefault(x => x.ID == id);

			return model;
		}

		public static List<PictureAlbum> GetAll()
		{
			var models = Db.PictureAlbums.ToList();

			return models;
		}

		public static void Add(PictureAlbum model)
		{
			Db.PictureAlbums.Add(model);
			Db.SaveChanges();
		}

		public static void Edit(PictureAlbum model)
		{
			Db.Entry(model).State = EntityState.Modified;
			Db.SaveChanges();
		}

		public static void Delete(int id)
		{
			PictureAlbum picture = Db.PictureAlbums.Find(id);
			Db.PictureAlbums.Remove(picture);
			Db.SaveChanges();
		}
	}
}
