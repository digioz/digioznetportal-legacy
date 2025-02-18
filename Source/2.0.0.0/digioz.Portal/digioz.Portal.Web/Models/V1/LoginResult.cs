using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Models.V1
{
    public class LoginResult
    {
        public string UserName { get; set; }
        public string Token { get; set; }
        public string Message { get; set; }
    }
}