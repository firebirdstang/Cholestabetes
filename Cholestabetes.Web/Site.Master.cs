using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.left.Visible = Context.User.Identity.IsAuthenticated;

            LoadPhysicianName();

            LoadPortalVisibility();

            //LoadPageByRole();

        }

        private void LoadPageByRole()
        {
            //if (loggedUser.Roles.Count == 0) //must be admin or valient
            //{
            //    Response.Redirect("~/Admin/ManageRegistration.aspx", false);
            //}
        }

        public void LoadPortalVisibility()
        {

            Domain.User loggedUser = UserHelper.GetLoggedInUser(HttpContext.Current.Session);
            if (loggedUser != null)
            {
                if (loggedUser.Roles.Contains(Helper.Constants.PHYSICIAN_ROLE) &&

                    (
                        loggedUser.MOU.Value &&
                        loggedUser.PayeeInformation.Value &&
                        loggedUser.AssesmentSurvey.Value
                    ))


                    this.imgPortal.ImageUrl = "~/images/PORTAL_button.png";

                else

                    this.imgPortal.ImageUrl = "~/images/ecrf-portal-button-dimmed.png";
            }
        }


        private void LoadPhysicianName()
        {
            Domain.User loggedUser = UserHelper.GetLoggedInUser(HttpContext.Current.Session);

            if (loggedUser != null && loggedUser.Roles.Contains(Helper.Constants.PHYSICIAN_ROLE))
            {
                Label lblUserName = HeadLoginView.FindControl("lblPhysicianName") as Label;

                lblUserName.Text = Utility.GetHTMLSalutation(loggedUser.Salutation) + " " + loggedUser.FirstName + " " + loggedUser.LastName;
            }
        }


        protected void imgPortal_clicked(object sender, System.EventArgs e)
        {
            if ((sender as ImageButton).ImageUrl.ToLower() == "~/images/PORTAL_button.png".ToLower())
                Response.Redirect(Constants.GetCorrectPortalURL());

        }

    }
}
