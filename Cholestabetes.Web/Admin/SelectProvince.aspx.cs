using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cholestabetes.Web.Admin
{
    public partial class SelectProvince : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        #region Event Handlers

        protected void imgBC_clicked(object sender, System.EventArgs e)
        {
            //2
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 2));
        }

        protected void imgON_clicked(object sender, System.EventArgs e)
        {
            //7
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 7));
        }

        protected void imgQC_clicked(object sender, System.EventArgs e)
        {
            //9
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 9));
        }

        protected void imgAB_clicked(object sender, System.EventArgs e)
        {
            //1
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 1));
        }

        protected void imgMB_clicked(object sender, System.EventArgs e)
        {
            //3
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 3));
        }

        protected void imgSK_clicked(object sender, System.EventArgs e)
        {
            //10
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 10));
        }

        protected void imgNS_clicked(object sender, System.EventArgs e)
        {
            //6
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 6));
        }

        protected void imgNB_clicked(object sender, System.EventArgs e)
        {
            //4
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 4));
        }

        protected void imgNL_clicked(object sender, System.EventArgs e)
        {
            //5
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, 5));
        }
 
        protected void imgAll_clicked(object sender, System.EventArgs e)
        {
            Response.Redirect(string.Format("~/Admin/ManageRegistration.aspx?{0}={1}", Helper.Constants.PROVINCEID, -1));
        }

        #endregion
    }
}