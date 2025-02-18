using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using digioz.Portal.BLL;
using digioz.Portal.Web.Models.V1;

namespace digioz.Portal.Web.Controllers.V1
{
    public class AccountController : ApiController
    {
        /// <summary>
        /// Logins the specified user using the username
        /// and password passed into the service method
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <returns></returns>
        [HttpGet]
        public LoginResult Login(string username, string password)
        {
            AccountLogic accountLogic = new AccountLogic();
            LoginResult result = new LoginResult
            {
                Token = accountLogic.LoginApi(username, password),
                UserName = username
            };

            if (string.IsNullOrEmpty(result.Token))
            {
                result.Message = "Invalid username or password or account not found.";
            }
            else
            {
                result.Message = "Login was successful. Please use the Token returned.";
            }

            return result;
        }

        /// <summary>
        /// Registers the specified user with a new portal account 
        /// using the username, password and email passed into the 
        /// service method. 
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="email">The email.</param>
        /// <returns></returns>
        [HttpGet]
        public LoginResult Register(string username, string password, string email)
        {
            AccountLogic accountLogic = new AccountLogic();
            LoginResult result = new LoginResult
            {
                Token = accountLogic.RegisterApi(username, password, email),
                UserName = username
            };

            if (string.IsNullOrEmpty(result.Token))
            {
                result.Message = "Unable to register account. Please contact support.";
            }
            else
            {
                result.Message = "Registration was successful. Please use the Token returned.";
            }

            return result;
        }

        [HttpGet]
        public IsTokenValidResult IsTokenValid(string username, string token)
        {
            AccountLogic accountLogic = new AccountLogic();
            IsTokenValidResult result = new IsTokenValidResult
            {
                IsTokenValid = accountLogic.IsTokenValidApi(username, token),
                Token = token,
                UserName = username
            };

            if (result.IsTokenValid)
            {
                result.Message = "The UserName and Token combination is correct.";
            }
            else
            {
                result.Message = "Incorrect Username and Token combination.";
            }

            return result;
        }
    }
}
