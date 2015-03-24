using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (UserHelper.GetLoggedInUser(Session).Roles.Contains(Helper.Constants.ADMIN_ROLE))
                {
                    (HeadLoginView.FindControl("imgLogo") as Image).ImageUrl = "~/images/chrc_logo.png";

                    (HeadLoginView.FindControl("HeadLoginStatus") as LoginStatus).LogoutPageUrl = "~/Admin/Login.aspx";
                }
                else
                    if (UserHelper.GetLoggedInUser(Session).Roles.Contains(Helper.Constants.VALIENT_ROLE))
                    {

                        (HeadLoginView.FindControl("HeadLoginStatus") as LoginStatus).LogoutPageUrl = "~/Valeant/Login.aspx";
                    }
            }
        }
    }
}