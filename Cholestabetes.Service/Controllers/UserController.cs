using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;
using Cholestabetes.Domain;

namespace Cholestabetes.Service.Controllers
{
    [RoutePrefix("User")]
    public class UserController : ApiController
    {

        UserRepository userRepos = new Repositories.UserRepository();

        [Route("ChangePassword")]
        public void ChangePassword(string userName, string oldPassword, string newPassword)
        {
            userRepos.ChangePassword(userName, oldPassword, newPassword);
        }

        [Route("UserDetails")]
        public User GetUserDetails(string userName)
        {
            return userRepos.GetUserDetails(userName);

        }

        [Route("IsValidRegistrationCode")]
        public bool IsValidRegistrationCode(string regCode)
        {
            return userRepos.IsValidRegistrationCode(regCode);

        }

        [Route("AutheticateUser")]
        public bool AutheticateUser(string userName, string password)
        {

            return userRepos.AutheticateUser(userName, password);
        }

        [Route("Roles")]
        public string GetRoles(string userName)
        {
            return userRepos.GetRoles(userName);
        }

        [Route("RolesAsArray")]
        public string[] GetRolesAsArray(string userName)
        {
            return userRepos.GetRolesAsArray(userName);

        }

    }
}
