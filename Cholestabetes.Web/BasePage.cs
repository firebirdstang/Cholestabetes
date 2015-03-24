using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web
{
    public class BasePage : Page  
    {

        protected override void OnInitComplete(EventArgs e)
        {
            base.OnInitComplete(e);

            if (HttpContext.Current.User.Identity.IsAuthenticated)

                Navigate();

        }

        private void Navigate()
        {
            Domain.User currUser = UserHelper.GetLoggedInUser(HttpContext.Current.Session);
            if (currUser != null)
            {
                if (currUser.Roles.Contains(Helper.Constants.ADMIN_ROLE) || currUser.Roles.Contains(Helper.Constants.VALIENT_ROLE))
                {
                    Response.Redirect("~/Admin/ManageRegistration.aspx");
                }
            }
            //else
            //{
            //    Response.Redirect("~/Account/Login.aspx");

            //}

        }

        protected override void OnLoad(EventArgs e)
        {

            base.OnLoad(e);

        }

        //public HttpCookie GetAuthorizationCookie(string userName, string userData)
        //{
        //    HttpCookie httpCookie = FormsAuthentication.GetAuthCookie(userName, true);
        //    FormsAuthenticationTicket currentTicket = FormsAuthentication.Decrypt(httpCookie.Value);
        //    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(currentTicket.Version, currentTicket.Name, currentTicket.IssueDate, currentTicket.Expiration, currentTicket.IsPersistent, userData);
        //    httpCookie.Value = FormsAuthentication.Encrypt(ticket);
        //    return httpCookie;
        //}

        //public Domain.User GetLoggedInUser()
        //{
        //    if (Session[Constants.USER] == null)

        //        LoadDataIntoSession();

        //    return Session[Constants.USER] as Domain.User;

        //}

        //public void ReloadUser()
        //{
        //    LoadDataIntoSession();
        //}

        //private void LoadDataIntoSession()
        //{
        //    Repositories.UserRepository userRepo = new Repositories.UserRepository();

        //    Domain.User loggedUser = userRepo.GetUserDetails(HttpContext.Current.User.Identity.Name);

        //    loggedUser.Roles.AddRange(userRepo.GetRolesAsArray(loggedUser.Username));

        //    //loggedUser.Roles = userRepo.GetRolesAsArray(loggedUser.Username);

        //    Session[Constants.USER] = loggedUser;
        //}


    }
}