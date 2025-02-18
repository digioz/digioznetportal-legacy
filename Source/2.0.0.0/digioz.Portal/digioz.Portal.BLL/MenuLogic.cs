using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class MenuLogic : BaseLogic
    {
        /// <summary>
        /// Get a list of menu items for 
        /// a specific zone position
        /// </summary>
        /// <param name="position">The position.</param>
        /// <returns></returns>
        public static List<Menu> GetMenuItems(string position)
        {
            List<Menu> menus = Db.Menus.Where(x => x.Location == position && x.Visible == true).OrderBy(x => x.SortOrder).ToList();

            return menus;
        }

        /// <summary>
        /// Get a list of all visible menus
        /// for all navigation zones
        /// </summary>
        /// <returns></returns>
        public static List<Menu> GetAllMenuItems()
        {
            List<Menu> menus = Db.Menus.Where(x => x.Visible == true).OrderBy(x => x.SortOrder).ToList();

            return menus;
        }
    }
}
