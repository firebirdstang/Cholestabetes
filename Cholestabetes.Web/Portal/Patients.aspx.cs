using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;
using DevExpress.Web.ASPxGridView;

namespace Cholestabetes.Web.Portal
{
    public partial class Patients : BasePage
    {
        PatientRepository patRepos = new Repositories.PatientRepository();
        bool updateScreen = true;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.gvPatients.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)

                LoadData();

            if (Request.QueryString[Constants.UPDATESCREENNUM] != null)
                updateScreen = Request.QueryString[Constants.UPDATESCREENNUM].ToString() == "1";
        }

        #region Methods

        private void LoadData()
        {

            this.gvPatients.DataSource = patRepos.GetPatientsByPhysicians(UserHelper.GetLoggedInUser(Session).UserID);
            this.gvPatients.DataBind();
        }

        private void ToggleButtonVisibility(ImageButton imgBtn, Label lbl)
        {
            int status = Int32.Parse(imgBtn.Attributes["Status"].ToString());

            switch (status)
            {

                case -1:

                    imgBtn.Visible = false;

                    break;

                case 0:

                    imgBtn.Visible = true;
                    lbl.Text = "Incomplete";
                    imgBtn.ImageUrl = "~/images/greenfoldericon.png";
                    break;


                case 1:

                    imgBtn.Visible = true;
                    lbl.Text = "Completed";
                    imgBtn.ImageUrl = "~/images/grayfoldericon.png";

                    break;


                case 2:

                    imgBtn.Visible = true;
                    imgBtn.OnClientClick = "return false;";
                    lbl.Text = "";
                    imgBtn.ImageUrl = "~/images/closebutton.gif";



                    break;

                default:
                    break;
            }

        }

        #endregion

        #region Event Handlers


        protected void gvPatients_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {

        }

        protected void gvPatients_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            ToggleButtonVisibility(
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "imgViewVisit1") as ImageButton,
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "lblStatus1") as Label
                    );

            ToggleButtonVisibility(
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "imgViewVisit2") as ImageButton,
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "lblStatus2") as Label
                    );


            ToggleButtonVisibility(
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "imgViewVisit3") as ImageButton,
                    gvPatients.FindRowCellTemplateControl(e.VisibleIndex, null, "lblStatus3") as Label
                    );
        }

        protected void gvPatients_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            //dataLoaded = false;

            if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {

            }

            // dataLoaded = true;

        }

        protected void imgViewVisit1_Click(object sender, System.EventArgs e)
        {
            bool isReadonly = (sender as ImageButton).Attributes["Status"].ToString() == "1";
            string PatientNum = (sender as ImageButton).Attributes["PatientNum"].ToString();

            string url = string.Format("~/Portal/Visit1/Page{2}.aspx?{0}={1}&{3}={4}&{5}={6}&{7}={8}",

                                   Constants.PATIENTID,
                                   (sender as ImageButton).Attributes["PatientID"].ToString(),
                                   isReadonly ? "1" : (sender as ImageButton).Attributes["ScreenID"].ToString(),
                                   Constants.READONLY,
                                   isReadonly ? "1" : "0",
                                   Constants.PATIENTNUM,
                                   PatientNum,
                                   Constants.UPDATESCREENNUM,
                                   isReadonly ? "0" : (updateScreen ? "1" : "0")
                                   );


            Response.Redirect(url);

        }

        protected void imgViewVisit2_Click(object sender, System.EventArgs e)
        {


            bool isReadonly = (sender as ImageButton).Attributes["Status"].ToString() == "1";
            string PatientNum = (sender as ImageButton).Attributes["PatientNum"].ToString();
            string url = string.Format("~/Portal/Visit2/Page{2}.aspx?{0}={1}&{3}={4}&{5}={6}&{7}={8}",

                                   Constants.PATIENTID,
                                   (sender as ImageButton).Attributes["PatientID"].ToString(),
                                   isReadonly ? "1" : (sender as ImageButton).Attributes["ScreenID"].ToString(),
                                   Constants.READONLY,
                                   isReadonly ? "1" : "0",
                                   Constants.PATIENTNUM,
                                   PatientNum,
                                   Constants.UPDATESCREENNUM,
                                    isReadonly ? "0" : (updateScreen ? "1" : "0")
                                   );


            Response.Redirect(url);

        }

        protected void imgViewVisit3_Click(object sender, System.EventArgs e)
        {
            bool isReadonly = (sender as ImageButton).Attributes["Status"].ToString() == "1";
            string PatientNum = (sender as ImageButton).Attributes["PatientNum"].ToString();
            string url = string.Format("~/Portal/Visit3/Page{2}.aspx?{0}={1}&{3}={4}&{5}={6}&{7}={8}",

                                   Constants.PATIENTID,
                                   (sender as ImageButton).Attributes["PatientID"].ToString(),
                                   isReadonly ? "1" : (sender as ImageButton).Attributes["ScreenID"].ToString(),
                                   Constants.READONLY,
                                   isReadonly ? "1" : "0",
                                   Constants.PATIENTNUM,
                                   PatientNum,
                                   Constants.UPDATESCREENNUM,
                                    isReadonly ? "0" : (updateScreen ? "1" : "0")
                                   );


            Response.Redirect(url);
        }

        protected void imgAdd_clicked(object sender, System.EventArgs e)
        {
            bool errored = false;
            try
            {
                patRepos.AddPatient(UserHelper.GetLoggedInUser(Session).UserID);
            }
            catch (Exception exce)
            {
                errored = true;

                if (exce.InnerException != null)
                    lblMssg.Text = exce.InnerException.Message;
                else
                    lblMssg.Text = exce.Message;
            }

            if (!errored)
                LoadData();
        }

        #endregion

    }
}