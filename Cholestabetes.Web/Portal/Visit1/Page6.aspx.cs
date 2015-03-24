using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Portal.Visit1
{
    public partial class Page6 : System.Web.UI.Page
    {

        VisitRepository visRepos = new VisitRepository();
        public bool isReadonly = false;
        public int patientID = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[Constants.PATIENTID] != null)
                patientID = Int32.Parse(Request.QueryString[Constants.PATIENTID].ToString());

            if (Request.QueryString[Constants.READONLY] != null)
                isReadonly = Int32.Parse(Request.QueryString[Constants.READONLY].ToString()) == 1;

            if (Request.QueryString[Constants.PATIENTNUM] != null)
                this.lblPatientNum.Text = Request.QueryString[Constants.PATIENTNUM].ToString();
        }


        protected void imgSubmit_clicked(object sender, EventArgs e)
        {
            if (isReadonly)
            {
                string url = "~/Portal/Patients.aspx";

                Response.Redirect(url);
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

                    string url = "~/Portal/Patients.aspx";

                    Response.Redirect(url);

                }
            }
        }

        protected void imgReview_clicked(object sender, EventArgs e)
        {

            string url = string.Format("~/Portal/Visit1/Page{2}.aspx?{0}={1}&{3}={4}&{5}={6}&{7}={8}",

                                   Constants.PATIENTID,
                                   this.patientID.ToString(),
                                   1,
                                   Constants.READONLY,
                                   "0",
                                   Constants.PATIENTNUM,
                                   lblPatientNum.Text,
                                   Constants.UPDATESCREENNUM,
                                   "0"
                                   );


            Response.Redirect(url);
        }
    }
}