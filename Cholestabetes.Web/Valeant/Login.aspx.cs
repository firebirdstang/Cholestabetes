using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;
using System.Security.Principal;
using System.Web.Security;

namespace Cholestabetes.Web.Valeant
{
    public partial class Login : System.Web.UI.Page
    {
        private UserRepository userRepo;

        Cholestabetes.Web.Helper.Constants.LoginType loginType;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.RawUrl.ToLower().Contains(Constants.VALEANT.ToLower()))
                loginType = Constants.LoginType.Sponser;
            else
                if (Request.RawUrl.ToLower().Contains(Constants.ADMIN.ToLower()))
                    loginType = Constants.LoginType.Admin;

            switch (loginType)
            {

                case Constants.LoginType.Physician:

                    this.lblMssg.Text = "Registered Participant Login:";

                    break;

                case Constants.LoginType.Sponser:

                    this.lblMssg.Text = "Valeant Login";

                    break;


                case Constants.LoginType.Admin:

                    this.lblMssg.Text = "CHRC Login";

                    break;

            }
        }

        protected void LoginButton_clicked(object sender, System.EventArgs e)
        {
            string redirectUrl = string.Empty;
            string username = UserName.Text;
            string password = Password.Text;

            userRepo = new Repositories.UserRepository();

            if (userRepo.AutheticateUser(username, password))
            {
                string[] userRoles = userRepo.GetRolesAsArray(username);

                HttpCookie AuthorizationCookie = UserHelper.GetAuthorizationCookie(username, userRepo.GetRoles(username));

                HttpContext.Current.User = new GenericPrincipal(User.Identity, userRoles);

                Response.Cookies.Add(AuthorizationCookie);


                Domain.User loggedUser = this.userRepo.GetUserDetails(username);

                loggedUser.Roles.AddRange(userRoles);

                UserHelper.SetLoggedInUser(loggedUser, HttpContext.Current.Session);

                if (HttpContext.Current.User.IsInRole(Helper.Constants.ADMIN_ROLE))
                {
                    redirectUrl = "~/Admin/ManageRegistration.aspx";
                }
                else
                    if (HttpContext.Current.User.IsInRole(Helper.Constants.VALIENT_ROLE))
                    {
                        redirectUrl = "~/Admin/SelectProvince.aspx";
                    }
                    else
                    {

                        redirectUrl = Constants.GetPortalURLForPhysician(FormsAuthentication.GetRedirectUrl(username, true));
                    }


                Response.Redirect(redirectUrl, false);
            }
            else
            {
                lblLoginResult.Text = "Invalid username password";
            }
        }
    }
}