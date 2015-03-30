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
    public class UserController : ApiController
    {

        UserRepository userRepos = new Repositories.UserRepository();
        
        public void ChangePassword(string userName, string oldPassword, string newPassword)
        {
            userRepos.ChangePassword(  userName,   oldPassword,   newPassword);
        }

        public User GetUserDetails(string userName)
        {
           return  userRepos.GetUserDetails(userName);

        }

        public bool IsValidRegistrationCode(string regCode)
        {
            return userRepos.IsValidRegistrationCode(regCode);
            
        }

        public bool AutheticateUser(string userName, string password)
        {

            return userRepos.AutheticateUser(userName, password);
        }

        public string GetRoles(string userName)
        {
            return userRepos.GetRoles(userName);
        }

        public string[] GetRolesAsArray(string userName)
        {
            return userRepos.GetRolesAsArray(userName);

        }

    }
}
