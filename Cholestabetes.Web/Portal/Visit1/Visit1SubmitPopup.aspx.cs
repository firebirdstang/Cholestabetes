using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Portal.Visit1
{
    public partial class Visit1SubmitPopup : System.Web.UI.Page
    {

        PatientRepository patientRepos = new PatientRepository();
        VisitRepository visRepos = new VisitRepository();
        int patientID = -1;
        bool isReadonly = false;

        private void RedirectJS()
        {
            string script = "window.parent.location.href = '../Patients.aspx'";

            Page.ClientScript.RegisterStartupScript(typeof(Page), "KEY", script, true);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            // javascript:parent.$.fancybox.close();

            if (Request.QueryString[Constants.PATIENTID] != null)
                patientID = Int32.Parse(Request.QueryString[Constants.PATIENTID].ToString());

            if (Request.QueryString[Constants.READONLY] != null)
                isReadonly = Int32.Parse(Request.QueryString[Constants.READONLY].ToString()) == 1;

            if (!Page.IsPostBack)
                LoadData();
        }


        private void LoadData()
        {
            DateTime? visit1Date = visRepos.GetVisit1Date(patientID);

            string dateStr = string.Format("{0}  AND  {1}",
                VisitDateCalculator.GetVisit2StartDate(visit1Date).ToString("dd-MMM-yyyy"), 
                VisitDateCalculator.GetVisit2EndDate(visit1Date).ToString("dd-MMM-yyyy"));

            this.lblDates.Text = dateStr;

            this.lblName.Text = patientRepos.GetPatientName(patientID);

        }

        protected void imgOK_clicked(object sender, System.EventArgs e)
        {
            if (isReadonly)
            {

                RedirectJS();

                //string url = "~/Portal/Patients.aspx";
                //Response.Redirect(url);
            }
            else
            {

                if (Page.IsValid)
                {
                    //SaveData();

                    visRepos.UpdateVisitScreen(1, 1, patientID);

                    visRepos.ChangeActiveVisit(patientID, 1, 2);

                    DateTime? visit1Date = visRepos.GetVisit1Date(patientID);

                    visRepos.UpdateVisitDates(
                                               2,
                                               patientID,
                                               VisitDateCalculator.GetVisit2StartDate(visit1Date),
                                               VisitDateCalculator.GetVisit2EndDate(visit1Date)
                                             );


                    RedirectJS();
                    //string url = "~/Portal/Patients.aspx";
                    //Response.Redirect(url);

                }
            }
        }
    }
}