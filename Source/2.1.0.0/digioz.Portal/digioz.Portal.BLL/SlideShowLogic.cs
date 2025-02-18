using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class SlideShowLogic : BaseLogic
    {
        /// <summary>
        /// Gets the specific slide show slide
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static SlideShow Get(int id)
        {
            var slide = Db.SlideShows.Find(id); // Db.SlideShows.SingleOrDefault(x => x.Id == id);

            return slide;
        }

        /// <summary>
        /// Gets all slide show slides
        /// </summary>
        /// <returns></returns>
        public static List<SlideShow> GetAll()
        {
            var slides = Db.SlideShows.ToList();

            return slides;
        }

        /// <summary>
        /// Adds the specified slide
        /// </summary>
        /// <param name="slide">The slide.</param>
        public static void Add(SlideShow slide)
        {
            Db.SlideShows.Add(slide);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified slide
        /// </summary>
        /// <param name="slide">The slide.</param>
        public static void Edit(SlideShow slide)
        {
            Db.Entry(slide).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the specified Slide record
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(int id)
        {
            var slide = Get(id);

            if (slide != null)
            {
                Db.SlideShows.Remove(slide);
                Db.SaveChanges();
            }
        }
    }
}
