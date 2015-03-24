using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Portal.Visit3
{
    public partial class Page1 : System.Web.UI.Page
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
                string url = string.Format("~/Portal/Visit3/Page2.aspx?{0}={1}&{2}={3}",
                   Constants.PATIENTID,
                   patientID.ToString(),
                   Constants.READONLY,
                   isReadonly ? "1" : "0"

                   );

                Response.Redirect(url);
            }
            else
            {
                if (Page.IsValid)
                {
                    //SaveData();

                    visRepos.UpdateVisitScreen(3, 2, patientID);

                    string url = string.Format("~/Portal/Visit3/Page2.aspx?{0}={1}&{2}={3}",
                        Constants.PATIENTID,
                        patientID.ToString(),
                        Constants.READONLY,
                        isReadonly ? "1" : "0"

                        );

                    Response.Redirect(url);
                }
            }
        }

        #endregion 
    }
}