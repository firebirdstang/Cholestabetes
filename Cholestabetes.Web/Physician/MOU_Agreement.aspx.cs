using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Physician
{
    public partial class MOU_Agreement : BasePage
    {
        PhysicianRepository physicianRepos = new PhysicianRepository();

        #region Methods

        private void LoadData()
        {
            Domain.User user = UserHelper.GetLoggedInUser(HttpContext.Current.Session) as Domain.User;
            chkMOUTerms.Checked = user.MOU.Value;
            pnlMain.Enabled = ! user.MOU.Value;
        }

        #endregion
 
        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadData();
        }

        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {
            try
            {

                if (!chkMOUTerms.Checked)
                {

                    lblMssg.Text = "Please make sure above checkbox is checked";
                    
                    return;

                }

                physicianRepos.UpdateMOU(HttpContext.Current.User.Identity.Name, chkMOUTerms.Checked ? 1 : 0);

                UserHelper.ReloadUser(HttpContext.Current.Session);


                Controls.PhysicianSpeceficRequirements actionItemCntrl =
                 Page.Master.FindControl("actionItem") as Controls.PhysicianSpeceficRequirements;

                actionItemCntrl.Reload();

                Master.LoadPortalVisibility();

                pnlMain.Enabled = false;
 
                lblMssg.Text = "Updated Successfully";
            }
            catch (Exception exc)
            {
                lblMssg.Text = exc.InnerException.Message;

            }
        }

        #endregion
    }
}