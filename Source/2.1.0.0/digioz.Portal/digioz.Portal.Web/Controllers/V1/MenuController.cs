using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Models.V1;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Controllers.V1
{
    public class MenuController : ApiController
    {
        /// <summary>
        /// Gets a list of menu items based on the menu
        /// position passed into the service method. For
        /// example if you pass in "TopMenu" for the position
        /// parameter, you will get a list of Top menu items. 
        /// </summary>
        /// <param name="position">The position.</param>
        /// <returns></returns>
        [HttpGet]
        public List<MenuResult> GetMenuItems(string position)
        {
            var menus = MenuLogic.GetMenuItems(position);

            List<MenuResult> menuResults = new List<MenuResult>();

            foreach (var item in menus)
            {
                MenuResult menuResult = new MenuResult();
                menuResult.InjectFrom(item);
                menuResults.Add(menuResult);
            }

            return menuResults;
        }

        /// <summary>
        /// Gets a list of ALL menu items in the system, regardless
        /// of their position. Use this option if you would rather 
        /// fetch all the menu items in one call and do the sorting 
        /// and filtering of the menu items on the Client side. 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public List<MenuResult> GetAllMenuItems()
        {
            var menus = MenuLogic.GetAllMenuItems();

            List<MenuResult> menuResults = new List<MenuResult>();

            foreach (var item in menus)
            {
                MenuResult menuResult = new MenuResult();
                menuResult.InjectFrom(item);
                menuResults.Add(menuResult);
            }

            return menuResults;
        }
    }
}
