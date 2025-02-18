using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using digioz.Portal.BLL;
using digioz.Portal.Web.Models.V1;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Controllers.V1
{
    public class PageController : ApiController
    {
        /// <summary>
        /// Gets a specific page based on the URL relative 
        /// path passed in. For example you can use the 
        /// relative url /Home/Index to fetch the contents
        /// of the Home Index page. 
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns></returns>
        [HttpGet]
        public PageResult GetPage(string url)
        {
            var page = PageLogic.Get(url);
            PageResult pageResult = new PageResult();
            pageResult.InjectFrom(page);

            return pageResult;
        }

        /// <summary>
        /// Gets the contents of ALL pages currently
        /// in the system. Use this call sparengly,
        /// since the results of this call can add up
        /// very quickly depending on the number of pages
        /// that are in the system. The body of the page 
        /// will always be an HTML string. 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public List<PageResult> GetAllPages()
        {
            var pages = PageLogic.GetAll();
            List<PageResult> pageResults = new List<PageResult>();


            foreach (var item in pages)
            {
                PageResult pageResult = new PageResult();
                pageResult.InjectFrom(item);
                pageResults.Add(pageResult);
            }

            return pageResults;
        }
    }
}
