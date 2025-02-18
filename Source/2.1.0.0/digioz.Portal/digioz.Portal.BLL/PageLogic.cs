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
    /// <summary>
    /// Class to perform page operations
    /// </summary>
    public class PageLogic : BaseLogic
    {
        /// <summary>
        /// Get contents of a specific page
        /// based on the ID passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static Page Get(int id)
        {
            var page = Db.Pages.SingleOrDefault(x => x.ID == id);

            return page;
        }

        /// <summary>
        /// Gets page by URL string passed in
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns></returns>
        public static Page Get(string url)
        {
            var page = Db.Pages.SingleOrDefault(x => x.URL == url);

            return page;
        }

        /// <summary>
        /// Gets the contents of all the
        /// pages in the database as a list
        /// </summary>
        /// <returns></returns>
        public static List<Page> GetAll()
        {
            var pages = Db.Pages.Include(p => p.AspNetUser).ToList();

            return pages;
        }

        /// <summary>
        /// Adds the specified page
        /// </summary>
        /// <param name="page">The page.</param>
        public static void Add(Page page)
        {
            Db.Pages.Add(page);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified page
        /// </summary>
        /// <param name="page">The page.</param>
        public static void Edit(Page page)
        {
            Db.Entry(page).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the specified page 
        /// based on the id passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(int id)
        {
            Page page = Db.Pages.Find(id);
            Db.Pages.Remove(page);
            Db.SaveChanges();
        }

        /// <summary>
        /// Searches the list of pages for the specified search term
        /// </summary>
        /// <param name="searchTerm">The search term.</param>
        /// <returns></returns>
        public static List<Page> Search(string searchTerm)
        {
            var pages = Db.Pages.Where(x => x.Body.Contains(searchTerm) && x.Visible == true).ToList();

            return pages;
        }
    }
}
