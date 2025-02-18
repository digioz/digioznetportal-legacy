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
	public class PictureLogic : BaseLogic
	{
		public static Picture Get(long id)
		{
			var picture = Db.Pictures.SingleOrDefault(x => x.ID == id);

			return picture;
		}

		public static List<Picture> GetAll()
		{
			var pictures = Db.Pictures.Include(p => p.AspNetUser).ToList();

			return pictures;
		}

		public static void Add(Picture picture)
		{
			Db.Pictures.Add(picture);
			Db.SaveChanges();
		}

		public static void Edit(Picture picture)
		{
			Db.Entry(picture).State = EntityState.Modified;
			Db.SaveChanges();
		}

		public static void Delete(long id)
		{
			Picture picture = Db.Pictures.Find(id);
			Db.Pictures.Remove(picture);
			Db.SaveChanges();
		}
	}
}
