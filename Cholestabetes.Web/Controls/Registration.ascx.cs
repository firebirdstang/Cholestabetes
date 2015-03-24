using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Controls
{
    public partial class Registration : System.Web.UI.UserControl
    {
        UserRepository userRepos;
        InviteeRepository inviteeRepos;  

        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void btnRegister_clicked(object sender, System.EventArgs e)
        {
            userRepos = new UserRepository();
            inviteeRepos = new InviteeRepository();

            string regCode = txtRegCode.Text;
            string redirect_url = string.Format("~/Account/PhysicianRegistration.aspx?{0}={1}", Constants.REGISTARTION_CODE, regCode);


            if (!userRepos.IsValidRegistrationCode(regCode))
            {
                lblRegResult.Text = "Registration Code is invalid";
                return;
            }


            if ( inviteeRepos.PhysicianLimitReached(regCode ))
            {
                //lblRegResult.Text = "Registration Limit Reached";
        
                ScriptManager.RegisterStartupScript
                    (
                        this, 
                        typeof(Page), 
                        "POPUP_INVALID_REG",
                        "window.open('userLimitReached.htm', 'userLimitReached', 'width=450, height=450');",
                        true
                    );
                 

                return;
            }


            if (!inviteeRepos.IsRegistered(regCode))
                Response.Redirect(redirect_url);
            else
                lblRegResult.Text = "User already registered";
 
        }
    }
}