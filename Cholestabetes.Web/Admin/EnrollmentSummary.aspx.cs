using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Admin
{
    public partial class EnrollmentSummary : System.Web.UI.Page
    {

        private int userID = -1;

        PhysicianRepository phyRepos = new Repositories.PhysicianRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[Helper.Constants.USERID] != null && !string.IsNullOrEmpty(Request.QueryString[Helper.Constants.USERID].ToString()))
            {
                userID = Int32.Parse(Request.QueryString[Helper.Constants.USERID].ToString());

                if (!Page.IsPostBack)
                {
                    LoadData();
                }

            }
            
            if  ( UserHelper.GetLoggedInUser(HttpContext.Current.Session).Roles.Contains(Helper.Constants.VALIENT_ROLE)  )
            {
                this.btnSave.Visible = false;

                this.txtPmtStatus1.ReadOnly = true;
                this.txtPmtStatus2.ReadOnly = true;
                this.txtPmtStatus3.ReadOnly = true;

            }

        }

        private void LoadData()
        {
            Cholestabetes.Domain.EnrollmentSummary enrSummary = phyRepos.GetEnrollmentSummary(userID);

            this.lblMou.Text    = enrSummary.MOU.HasValue ? (enrSummary.MOU.Value == 1 ? "Received" : "Not Received") : "Not Received";

            this.lblAsses.Text  = enrSummary.AssesmentSurvey.HasValue ? (enrSummary.AssesmentSurvey.Value == 1 ? "Received" : "Not Received") : "Not Received";

            this.lblPayee.Text  = enrSummary.PayeeInfo.HasValue ? (enrSummary.PayeeInfo.Value == 1 ? "Received" : "Not Received") : "Not Received";

            this.lblNumPatientsV1.Text = enrSummary.NumPatientsV1.HasValue ? enrSummary.NumPatientsV1.Value.ToString() : "0";

            this.lblNumPatientsV2.Text = enrSummary.NumPatientsV2.HasValue ? enrSummary.NumPatientsV2.Value.ToString() : "0";

            this.lblNumPatientsV3.Text = enrSummary.NumPatientsV3.HasValue ? enrSummary.NumPatientsV3.Value.ToString() : "0";

            this.txtPmtStatus1.Text = enrSummary.PaymentStatusV1;

            this.txtPmtStatus2.Text = enrSummary.PaymentStatusV2;

            this.txtPmtStatus3.Text = enrSummary.PaymentStatusV3;
        }
 
        protected void btnSave_Click(object sender, System.EventArgs e)
        {

            phyRepos.SetPaymentStatus(userID, this.txtPmtStatus1.Text, this.txtPmtStatus2.Text, this.txtPmtStatus3.Text);
        }
    }
}