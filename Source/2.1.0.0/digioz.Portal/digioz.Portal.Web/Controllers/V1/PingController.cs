using System.Collections.Generic;
using System.Web.Http;

namespace digioz.Portal.Web.Controllers.V1
{
    public class PingController : ApiController
    {
        /// <summary>
        /// Gets the API Version
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/v1/Ping/Version")]
        public string Version()
        {
            return "V1";
        }

        /// <summary>
        /// Gets some general information about the Portal
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        [HttpGet]
        [Route("api/v1/Ping/About")]
        public string About()
        {
            string result = "DigiOz .NET Portal is a CMS System written in ASP.NET MVC 5.";

            return result;
        }
    }
}
