using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Account
{
    public partial class ChangePhysicianPassword : System.Web.UI.Page
    {


        private UserRepository userRepo = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CancelPushButton_clicked(object sender, System.EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }

        protected void ChangePasswordPushButton_clicked(object sender, System.EventArgs e)
        {
            try
            {
                string oldPassword = this.CurrentPassword.Text;
                string newPassword = this.NewPassword.Text;

                userRepo.ChangePassword(
                                            HttpContext.Current.User.Identity.Name, 
                                            oldPassword, 
                                            newPassword
                                        );

                lblResult.Text = "Password changed successfully";
            
            }
            catch (Exception exc)
            {

                lblResult.Text = "Error occurred while changing password";
            }

        }
    }
}