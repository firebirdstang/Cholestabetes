using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using DevExpress.Web.ASPxEditors;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using Cholestabetes.Domain;
using Cholestabetes.Web.Helper;
using DevExpress.Web.Internal.InternalCheckBox;

namespace Cholestabetes.Web.Admin
{
    public partial class ManageRegistration : AdminBasePage
    {

        InviteeRepository invRepos = new InviteeRepository();

        List<RegistrationStatus> regList = null;
        Domain.User user = null;
        int provinceID = -1;
        // bool dataLoaded = false;
        //bool postBackByCheckBox = false;
        //bool postBackByDD = false;

        #region Methods

        private void LoadRegistrationStatus()
        {
            regList = invRepos.GetRegistartionStatus();


        }

        private void AdjustColumns()
        {

            //Domain.User user = base.GetLoggedInUser() as Domain.User;

            //if (user.Roles.Contains(Helper.Constants.ADMIN_ROLE))
            //    this.gvCardiologists.Columns["colInvitedByCHRC"].Visible = true;

        }

        private void LoadData()
        {
            this.gvCardiologists.DataSource = invRepos.GetAllInvitees();
            this.gvCardiologists.DataBind();
        }

        private void LoadData(int provID)
        {
            this.gvCardiologists.DataSource = invRepos.GetAllInviteesByProvince(provID);
            this.gvCardiologists.DataBind();
        }

        protected void showscript(string link)
        {
            ScriptManager.RegisterStartupScript(UPCardiologists, typeof(Page), "newRF", link, true);


        }

        //private bool UpdatePhysicanRegistration(string physicianID, bool checkvalue)
        //{
        //    string Sql = string.Empty;
        //    if (checkvalue)
        //    {

        //        Sql = "update tblCardiologists set Registered=1 where UniqueID='" + physicianID + "'";
        //    }
        //    else
        //    {
        //        Sql = "update tblCardiologists set Registered=0 where UniqueID='" + physicianID + "'";
        //    }
        //    //return DBHandler.ExecuteQuery(Sql);
        //    return true;

        //}

        private void UpdateInvitationSentDate(int physicianID, bool isFrench, bool chrc)
        {
            invRepos.UpdateInviteDate(physicianID, true, isFrench, chrc);
        }

        private void LoadControlsForSponser()
        {

            this.imgAddPhysician.Visible = !user.Roles.Contains(Helper.Constants.VALIENT_ROLE);
            this.tdAdd.Visible = !user.Roles.Contains(Helper.Constants.VALIENT_ROLE);
            tbl.Width = "500px";
        }

        #endregion

        #region Events

        protected void Page_Init(object sender, EventArgs e)
        {



        }

        protected override void OnInitComplete(EventArgs e)
        {
            base.OnInitComplete(e);

            ////if (Request.Params["__EVENTTARGET"] != null && !string.IsNullOrEmpty(Request.Params["__EVENTTARGET"].ToString()))
            ////{
            ////    if (Request.Params["__EVENTTARGET"].ToString().ToLower().Contains("chkCHRC".ToLower()))
            ////    {
            ////        postBackByCheckBox = true;
            ////        postBackByDD = false;
            ////    }

            ////    else

            ////        if (Request.Params["__EVENTTARGET"].ToString().ToLower().Contains("cmbRegStatus".ToLower()))
            ////        {
            ////            postBackByCheckBox = false;
            ////            postBackByDD = true;
            ////        }
            ////        else
            ////        {
            ////            postBackByCheckBox = false;
            ////            postBackByDD = false;

            ////        }

            //}

            // have to put in Page_Init, Page_Load doesn't work, it interferes with InvitedCheckbox_CheckedChanged and possibly other postback functions 
            if (Request.QueryString[Helper.Constants.PROVINCEID] != null)

                provinceID = Int32.Parse(Request.QueryString[Helper.Constants.PROVINCEID].ToString());


            user = UserHelper.GetLoggedInUser(HttpContext.Current.Session);

            LoadRegistrationStatus();



            //if (Request.Params["__EVENTTARGET"] == null  )
            {
                if (provinceID == -1)
                    LoadData();
                else
                    LoadData(provinceID);
            }

            LoadControlsForSponser();

            if (!user.Roles.Contains(Helper.Constants.VALIENT_ROLE))
                this.hlReports.NavigateUrl = "~/Admin/GetPayeeInfo.aspx";

        }

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void gvCardiologists_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {
            if (e.CommandCellType == DevExpress.Web.ASPxGridView.GridViewTableCommandCellType.Data)
            {

                if (user.Roles.Contains(Helper.Constants.VALIENT_ROLE))
                {
                    ASPxCheckBox chkc = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "chkCHRC") as ASPxCheckBox;
                    ImageButton imgEng = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "imgEnglish") as ImageButton;
                    ImageButton imgFrench = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "imgFrench") as ImageButton;
                    // (e.Cell.Controls[0] as InternalCheckboxControl).Visible = chkc.Checked;

                    //  imgEng.Enabled = chkc.Checked;
                    //   imgFrench.Enabled = chkc.Checked;
                    //imgEng.ImageUrl = chkc.Checked ? "~/images/icon_download.png" : "~/images/icon_download_gray.gif";
                    //imgFrench.ImageUrl = chkc.Checked ? "~/images/icon_download.png" : "~/images/icon_download_gray.gif";

                }
            }

        }

        protected void gvCardiologists_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            //dataLoaded = false;
            Label lblStatus = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "lblStatus") as Label;

            if (lblStatus != null && !string.IsNullOrEmpty(lblStatus.Text))
            {
                ASPxComboBox cmboBox = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "cmbRegStatus") as ASPxComboBox;

                foreach (ListEditItem item in cmboBox.Items)
                {
                    if (item.Value.ToString() == lblStatus.Text)
                    {
                        item.Selected = true;

                        break;
                    }
                }

                //DropDownList ddRegisStatus = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "ddRegisStatus") as DropDownList;

                //ddRegisStatus.SelectedValue = lblStatus.Text;

                //try
                //{
                //    foreach (ListItem item in ddRegisStatus.Items)
                //    {
                //        if (item.Value.ToString() == lblStatus.Text)
                //        {
                //            item.Selected = true;

                //            break;
                //        }
                //    }
                //}
                //catch (Exception exce)
                //{

                //    throw;
                //}

            }

            //dataLoaded = true;
        }

        protected void gvCardiologists_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            //dataLoaded = false;

            if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {

                ASPxComboBox cmboBox1 = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "cmbRegStatus") as ASPxComboBox;
                //cmboBox1.AutoPostBack = false;
                cmboBox1.DataSource = regList;
                cmboBox1.TextField = "Name";
                cmboBox1.ValueField = "ID";
                //cmboBox1.AutoPostBack = true;
                // cmboBox1.DataBind();


                //DropDownList ddRegisStatus = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "ddRegisStatus") as DropDownList;
                //ddRegisStatus.DataSource = regList;
                //ddRegisStatus.DataTextField = "Name";
                //ddRegisStatus.DataValueField = "ID";



                ASPxCheckBox chkc = gvCardiologists.FindRowCellTemplateControl(e.VisibleIndex, null, "chkCHRC") as ASPxCheckBox;

                if (user.Roles.Contains(Helper.Constants.VALIENT_ROLE))
                {
                    cmboBox1.ReadOnly = true;
                    chkc.ReadOnly = true;

                    //chkc.Attributes["onclick"] = "event.preventDefault();";
                }
            }

            // dataLoaded = true;

        }

        protected void ddRegisStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string s = string.Empty;

        }

        protected void cmbRegStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (!dataLoaded)
            //    return;
            //  if (postBackByDD)
            {

                try
                {


                    if (Request.Params["__EVENTTARGET"].ToString().ToLower() != (sender as ASPxComboBox).UniqueID.ToLower())
                        return;


                    Label lblStatus = (sender as ASPxComboBox).Parent.FindControl("lblStatus") as Label;

                    int physicianID = Int32.Parse(lblStatus.Attributes["PhysicianID"].ToString());

                    int statusID = Int32.Parse((sender as ASPxComboBox).SelectedItem.Value.ToString());

                    invRepos.UpdateRegistartionStatus(physicianID, statusID);

                    lblStatus.Text = statusID.ToString();

                }
                catch (Exception exc)
                {

                    lblResult.Text = exc.Message;

                    throw;
                }

            }

        }

        protected void chkCHRC_OnCheckedChanged(object sender, EventArgs e)
        {

            //   if (postBackByCheckBox)
            {
                try
                {

                    if (Request.Params["__EVENTTARGET"].ToString().ToLower() != (sender as ASPxCheckBox).UniqueID.ToLower())
                        return;


                    // int physicianID = Int32.Parse((sender as ASPxCheckBox).Attributes["PhysicianID"].ToString());

                    int physicianID = Int32.Parse(((sender as ASPxCheckBox).Parent.FindControl("dummyInv2") as Button).CommandName);

                    invRepos.UpdateInvitedValue(physicianID, (sender as ASPxCheckBox).Checked);

                    this.LoadData();
                }
                catch (Exception exc)
                {

                    lblResult.Text = exc.Message;

                    throw;
                }
            }

        }

        protected void imgGenMultipleFrench_clicked(object sender, EventArgs e)
        {
            //multiple invite (clicking on the Generate Multiple Invitations button)

            ArrayList prog = new ArrayList();

            //GridViewCommandColumn ShowSelectCheckbox="true" display a checkbox for selection
            // gvCardiologists.GetSelectedFieldValues("UniqueID") get all selected values
            //once you define a commandcolumn you must define KeyFieldName, so that a selection can be uniquely identified by KeyFieldName
            //Getting all selected values in Grid, they are identified by the physicianID as set in KeyFieldName
            List<object> keyValues = gvCardiologists.GetSelectedFieldValues("ID");

            if (keyValues.Count == 0)
            {
                //if 
                // MPENoSelection.Show();
                return;
            }

            string idlst = "";
            foreach (object key in keyValues)
            {
                idlst += key + ",";
            }
            idlst = idlst.Substring(0, idlst.Length - 1);

            foreach (object key in keyValues)
            {

                UpdateInvitationSentDate(Int32.Parse(key.ToString()), true, user.Roles.Contains(Helper.Constants.ADMIN_ROLE));

            }

            //string link = "window.open('GenerateInvitation.aspx?physlst=" + idlst;
            //link += "');";

            string link = string.Format("window.open('GenerateInvitation.aspx?physlst={0}&{1}={2}');", idlst.ToString(), Helper.Constants.ISFRENCH, 1);


            showscript(link);


            gvCardiologists.Selection.UnselectAll();

            this.LoadData();

        }

        protected void imgGenMultipleEnglish_Click(object sender, EventArgs e)
        {
            //multiple invite (clicking on the Generate Multiple Invitations button)

            ArrayList prog = new ArrayList();

            //GridViewCommandColumn ShowSelectCheckbox="true" display a checkbox for selection
            // gvCardiologists.GetSelectedFieldValues("UniqueID") get all selected values
            //once you define a commandcolumn you must define KeyFieldName, so that a selection can be uniquely identified by KeyFieldName
            //Getting all selected values in Grid, they are identified by the physicianID as set in KeyFieldName
            List<object> keyValues = gvCardiologists.GetSelectedFieldValues("ID");

            if (keyValues.Count == 0)
            {
                //if 
                // MPENoSelection.Show();
                return;
            }

            string idlst = "";
            foreach (object key in keyValues)
            {
                idlst += key + ",";
            }
            idlst = idlst.Substring(0, idlst.Length - 1);

            foreach (object key in keyValues)
            {
                UpdateInvitationSentDate(Int32.Parse(key.ToString()), false, user.Roles.Contains(Helper.Constants.ADMIN_ROLE));


            }

            //string link = "window.open('GenerateInvitation.aspx?physlst=" + idlst;
            //link += "');";

            string link = string.Format("window.open('GenerateInvitation.aspx?physlst={0}&{1}={2}');", idlst.ToString(), Helper.Constants.ISFRENCH, 0);


            showscript(link);


            gvCardiologists.Selection.UnselectAll();

            this.LoadData();

        }

        protected void imgEnglish_Click(object sender, EventArgs e)
        {
            //single invite
            Button dummy = ((ImageButton)sender).Parent.FindControl("dummyInv") as Button;

            Label lblSentDate = ((ImageButton)sender).Parent.FindControl("lblInvSentDate") as Label;

            int physID = Int32.Parse(dummy.CommandName);

            string link = string.Format("window.open('GenerateInvitation.aspx?physlst={0}&{1}={2}');", physID.ToString(), Helper.Constants.ISFRENCH, 0);

            showscript(link);

            UpdateInvitationSentDate(physID, false, user.Roles.Contains(Helper.Constants.ADMIN_ROLE));

            //  ((Button)sender).CommandName = "";
            gvCardiologists.Selection.UnselectAll();

            this.LoadData();

            // MakeInvitationPDF(idlst);
        }

        protected void imgFrench_Click(object sender, EventArgs e)
        {
            //single invite
            Button dummy = ((ImageButton)sender).Parent.FindControl("dummyInv") as Button;

            Label lblSentDate = ((ImageButton)sender).Parent.FindControl("lblInvSentDate") as Label;

            int physID = Int32.Parse(dummy.CommandName);


            string link = string.Format("window.open('GenerateInvitation.aspx?physlst={0}&{1}={2}');", physID.ToString(), Helper.Constants.ISFRENCH, 1);

            showscript(link);

            UpdateInvitationSentDate(physID, true, user.Roles.Contains(Helper.Constants.ADMIN_ROLE));


            gvCardiologists.Selection.UnselectAll();

            this.LoadData();


        }

        #endregion
    }
}