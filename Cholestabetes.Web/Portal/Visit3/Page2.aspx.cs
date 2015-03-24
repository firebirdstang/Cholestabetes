using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Portal.Visit3
{
    public partial class Page2 : System.Web.UI.Page
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

                    visRepos.UpdateVisitScreen(3, 1, patientID);

                    visRepos.ChangeActiveVisit(patientID, 3, 4);

                    //visRepos.UpdateVisitDates(
                    //                           3,
                    //                           patientID,
                    //                           VisitDateCalculator.GetVisit3StartDate(DateTime.Now),
                    //                           VisitDateCalculator.GetVisit2EndDate(DateTime.Now)
                    //                         );

                    string url = "~/Portal/Patients.aspx";

                    Response.Redirect(url);

                }
            }
        }

        #endregion 
    }
}