using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Admin
{
    public class AdminBasePage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (HttpContext.Current.User.Identity.IsAuthenticated)

                Navigate();
        }
 
        private void Navigate()
        {
            Domain.User currUser = UserHelper.GetLoggedInUser(HttpContext.Current.Session);
            if (currUser != null)
            {
                if (
                        !currUser.Roles.Contains(Helper.Constants.ADMIN_ROLE) &&
                        !currUser.Roles.Contains(Helper.Constants.VALIENT_ROLE)
                    )
                {

                    Response.Redirect("~/default.aspx");
                }
            }

        }
    }
}