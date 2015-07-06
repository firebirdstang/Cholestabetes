using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Cholestabetes.Web.Helper
{
    public class UserHelper
    {


        public static HttpCookie GetAuthorizationCookie(string userName, string userData)
        {
            HttpCookie httpCookie = FormsAuthentication.GetAuthCookie(userName, true);
            FormsAuthenticationTicket currentTicket = FormsAuthentication.Decrypt(httpCookie.Value);
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(currentTicket.Version, currentTicket.Name, currentTicket.IssueDate, currentTicket.Expiration, currentTicket.IsPersistent, userData);
            httpCookie.Value = FormsAuthentication.Encrypt(ticket);
            return httpCookie;
        }



       
        public static Domain.User GetLoggedInUser(System.Web.SessionState.HttpSessionState session)
        {
            if (session[Constants.USER] == null)

                LoadDataIntoSession(session);

            return session[Constants.USER] as Domain.User;

        }

        public static void SetLoggedInUser(Domain.User user, System.Web.SessionState.HttpSessionState session)
        {

            session[Constants.USER] = user;

        }

        public static void ReloadUser(System.Web.SessionState.HttpSessionState session)
        {
            LoadDataIntoSession(session);
        }

        private static void LoadDataIntoSession(System.Web.SessionState.HttpSessionState session)
        {
            Repositories.UserRepository userRepo = new Repositories.UserRepository();

            Domain.User loggedUser = userRepo.GetUserDetails(HttpContext.Current.User.Identity.Name);
            if (loggedUser != null)
            {
                loggedUser.Roles.AddRange(userRepo.GetRolesAsArray(loggedUser.Username));

                session[Constants.USER] = loggedUser;
            }

        }


       

    }
}