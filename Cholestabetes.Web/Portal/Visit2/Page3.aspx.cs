using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Portal.Visit2
{
    public partial class Page3 : System.Web.UI.Page
    {
        bool isReadonly = false;
        int patientID = -1;
        VisitRepository visRepos = new VisitRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[Constants.PATIENTID] != null)
                patientID = Int32.Parse(Request.QueryString[Constants.PATIENTID].ToString());

            if (Request.QueryString[Constants.READONLY] != null)
                isReadonly = Int32.Parse(Request.QueryString[Constants.READONLY].ToString()) == 1;

        }


        #region Event Handlerd

        protected void imgBack_clicked(object sender, EventArgs e)
        {
            Response.Redirect("~/Portal/Patients.aspx");
        }

        protected void imgSave_clicked(object sender, EventArgs e)
        {

        }

        protected void imgNext_clicked(object sender, EventArgs e)
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

                    visRepos.UpdateVisitScreen(2, 1, patientID);

                    visRepos.ChangeActiveVisit(patientID, 2, 3);

                    DateTime?  visit1Date = visRepos.GetVisit1Date(patientID );
                    DateTime visit2SubmissionDate = visRepos.GetVisitSubmissionDate(patientID, 2);

                    visRepos.UpdateVisitDates( 
                                               3,
                                               patientID,
                                               VisitDateCalculator.GetVisit3StartDate(visit2SubmissionDate),
                                               VisitDateCalculator.GetVisit3EndDate(visit1Date.Value)
                                             );

                    string url = "~/Portal/Patients.aspx";

                    Response.Redirect(url);

                }
            }
        }

        #endregion 
    }
}