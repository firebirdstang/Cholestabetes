using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;
using Cholestabetes.Domain;

namespace Cholestabetes.Web.Portal.Visit1
{
    public partial class Page3 : System.Web.UI.Page
    {
        VisitRepository visRepos = new VisitRepository();
        bool isReadonly = false;
        int patientID = -1;
        bool updateScreen = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[Constants.PATIENTID] != null)
                patientID = Int32.Parse(Request.QueryString[Constants.PATIENTID].ToString());

            if (Request.QueryString[Constants.READONLY] != null)
                isReadonly = Int32.Parse(Request.QueryString[Constants.READONLY].ToString()) == 1;

            if (Request.QueryString[Constants.PATIENTNUM] != null)
                this.lblPatientNum.Text = Request.QueryString[Constants.PATIENTNUM].ToString();


            if (Request.QueryString[Constants.UPDATESCREENNUM] != null)
                updateScreen = Request.QueryString[Constants.UPDATESCREENNUM].ToString() == "1";

            InitializeControls();

            if (!Page.IsPostBack)
            {
                LoadData();
            }

        }

        #region Methods

        private void InitializeControls()
        {
            this.pnlMain.Enabled = !isReadonly;
            this.imgNext.CausesValidation = !isReadonly;
            this.imgBack.CausesValidation = !isReadonly;
            this.imgSave.Enabled = !isReadonly;

            lblResult.Text = string.Empty;

            lblLabDate.Visible = false;

            lblALT.Visible = false;
            lblphos.Visible = false;
            lblCreatinine.Visible = false;
            lblGFR.Visible = false;
            lblACR.Visible = false;

        }

        private void SaveData()
        {
            List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

            string recentDate = this.txtMostRecentLabDate.Text;
            string ast = this.txtAST.Text;
            string alkPhos = this.txtALKPhotos.Text;
            string Creatinine = this.txtCreatinine.Text;
            string eGFR = this.txteGFR.Text;
            string acr = this.txtACR.Text;
            //string eGFR = this.txteGFR.Text + "." + this.txteGFR2.Text;
            //string acr = this.txtACR.Text + "." + this.txtACR2.Text;


            PatientQuestion q1 = new PatientQuestion();
            q1.ID = 21;
            q1.Answer.Add(new PatientAnswer() { ID = 61, Value = recentDate });

            PatientQuestion q2 = new PatientQuestion();
            q2.ID = 22;
            q2.Answer.Add(new PatientAnswer() { ID = 62, Value = ast });

            PatientQuestion q3 = new PatientQuestion();
            q3.ID = 23;
            q3.Answer.Add(new PatientAnswer() { ID = 63, Value = alkPhos });

            PatientQuestion q4 = new PatientQuestion();
            q4.ID = 24;
            q4.Answer.Add(new PatientAnswer() { ID = 64, Value = Creatinine });

            PatientQuestion q5 = new PatientQuestion();
            q5.ID = 25;
            q5.Answer.Add(new PatientAnswer() { ID = 65, Value = eGFR });

            PatientQuestion q6 = new PatientQuestion();
            q6.ID = 26;
            q6.Answer.Add(new PatientAnswer() { ID = 66, Value = acr });

            lstAnswers.Add(q1);
            lstAnswers.Add(q2);
            lstAnswers.Add(q3);
            lstAnswers.Add(q4);
            lstAnswers.Add(q5);
            lstAnswers.Add(q6);

            visRepos.SaveVisit1Screen3(patientID, lstAnswers);

        }

        private void LoadData()
        {
            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen3(patientID);

            if (lst != null && lst.Count > 0)
            {

                this.txtMostRecentLabDate.Text = lst[0].Answer[0].Value;
                this.txtAST.Text = lst[1].Answer[0].Value;
                this.txtALKPhotos.Text = lst[2].Answer[0].Value;
                this.txtCreatinine.Text = lst[3].Answer[0].Value;

                string eGFR = lst[4].Answer[0].Value;
                string acr = lst[5].Answer[0].Value;

                this.txteGFR.Text = eGFR;
                this.txtACR.Text = acr;


                if (string.IsNullOrEmpty(this.txtAST.Text))
                {
                    chkALT.Checked = true;
                    reqtxtAST.Enabled = false;
                    this.txtAST.CssClass = "readonly";
                    //this.txtAST.ReadOnly = true;
                    this.txtAST.Attributes["readonly"] = "true";

                }
                else
                {
                    chkALT.Checked = false;
                    reqtxtAST.Enabled = true;
                    this.txtAST.CssClass = "Notreadonly";
                    //this.txtAST.ReadOnly = false;
                    this.txtAST.Attributes["readonly"] = "false";
                }

                if (string.IsNullOrEmpty(this.txtALKPhotos.Text))
                {
                    chkALKPOS.Checked = true;
                    reqtxtALKPhotos.Enabled = false;
                    this.txtALKPhotos.CssClass = "readonly";
                    //this.txtALKPhotos.ReadOnly = true;
                    this.txtALKPhotos.Attributes["readonly"] = "true";
                }
                else
                {
                    chkALKPOS.Checked = false;
                    reqtxtALKPhotos.Enabled = true;
                    this.txtALKPhotos.CssClass = "Notreadonly";
                    //this.txtALKPhotos.ReadOnly = false;
                    this.txtALKPhotos.Attributes["readonly"] = "false";
                }

                if (string.IsNullOrEmpty(this.txtCreatinine.Text))
                {
                    chkCreatinine.Checked = true;
                    reqtxtCreatinine.Enabled = false;
                    this.txtCreatinine.CssClass = "readonly";
                    //this.txtCreatinine.ReadOnly = true;
                    this.txtCreatinine.Attributes["readonly"] = "true";
                }
                else
                {
                    chkCreatinine.Checked = false;
                    reqtxtCreatinine.Enabled = true;
                    this.txtCreatinine.CssClass = "Notreadonly";
                    //this.txtCreatinine.ReadOnly = false;
                    this.txtCreatinine.Attributes["readonly"] = "false";
                }

                if (string.IsNullOrEmpty(this.txteGFR.Text))
                {
                    chkGFR.Checked = true;
                    reqtxteGFR.Enabled = false;
                    this.txteGFR.CssClass = "readonly";
                    //this.txteGFR.ReadOnly = true;
                    this.txteGFR.Attributes["readonly"] = "true";
                }
                else
                {
                    chkGFR.Checked = false;
                    reqtxteGFR.Enabled = true;
                    this.txteGFR.CssClass = "Notreadonly";
                    //this.txteGFR.ReadOnly = false;
                    this.txteGFR.Attributes["readonly"] = "false";
                }

                if (string.IsNullOrEmpty(this.txtACR.Text))
                {
                    chkACR.Checked = true;
                    reqtxtACR.Enabled = false;
                    this.txtACR.CssClass = "readonly";
                    //this.txtACR.ReadOnly = true;
                    this.txtACR.Attributes["readonly"] = "true";
                }
                else
                {
                    chkACR.Checked = false;
                    reqtxtACR.Enabled = true;
                    this.txtACR.CssClass = "Notreadonly";
                    //this.txtACR.ReadOnly = false;
                    this.txtACR.Attributes["readonly"] = "false";
                }

            }

        }

        private void ManagerValidators()
        {

            reqtxtAST.Enabled = !chkALT.Checked;
            reqtxtALKPhotos.Enabled = !chkALKPOS.Checked;
            reqtxtCreatinine.Enabled = !chkCreatinine.Checked;
            reqtxteGFR.Enabled = !chkGFR.Checked;
            reqtxtACR.Enabled = !chkACR.Checked;
        }

        #endregion

        #region Event Handlers

        protected void imgBack_clicked(object sender, EventArgs e)
        {
            string url = string.Format("~/Portal/Visit1/Page2.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
                     Constants.PATIENTID,
                     patientID.ToString(),
                     Constants.READONLY,
                     isReadonly ? "1" : "0",
                      Constants.PATIENTNUM,
                     this.lblPatientNum.Text,
                     Constants.UPDATESCREENNUM,
                     updateScreen ? "1" : "0"
                     );

            Response.Redirect(url);
        }

        protected void imgSave_clicked(object sender, EventArgs e)
        {
            ManagerValidators();

            if (Page.IsValid)
            {
                SaveData();
                lblResult.Text = "Saved successfully!";
            }
        }

        protected void imgNext_clicked(object sender, EventArgs e)
        {
            ManagerValidators();

            if (isReadonly)
            {
                string url = string.Format("~/Portal/Visit1/Page4.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
                   Constants.PATIENTID,
                   patientID.ToString(),
                   Constants.READONLY,
                   isReadonly ? "1" : "0",
                   Constants.PATIENTNUM,
                   this.lblPatientNum.Text,
                   Constants.UPDATESCREENNUM,
                   updateScreen ? "1" : "0"
                   );

                Response.Redirect(url);
            }

            else
            {
                if (Page.IsValid)
                {
                    SaveData();

                    if (updateScreen)
                        visRepos.UpdateVisitScreen(1, 4, patientID);

                    string url = string.Format("~/Portal/Visit1/Page4.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
                        Constants.PATIENTID,
                        patientID.ToString(),
                        Constants.READONLY,
                        isReadonly ? "1" : "0",
                        Constants.PATIENTNUM,
                        this.lblPatientNum.Text,
                        Constants.UPDATESCREENNUM,
                        updateScreen ? "1" : "0"
                        );

                    Response.Redirect(url);
                }
            }
        }

        protected void customVal_OnServerValidate(object source, ServerValidateEventArgs args)
        {

            bool validated = true;
            DateTime dummy;

            int ast = chkALT.Checked && string.IsNullOrEmpty(txtAST.Text) ? -1 : Int32.Parse(this.txtAST.Text);
            int alkPhos = chkALKPOS.Checked && string.IsNullOrEmpty(txtALKPhotos.Text) ? -1 : Int32.Parse(this.txtALKPhotos.Text);
            int Creatinine = chkCreatinine.Checked && string.IsNullOrEmpty(txtCreatinine.Text) ? -1 : Int32.Parse(this.txtCreatinine.Text);
            decimal eGFR = chkGFR.Checked && string.IsNullOrEmpty(txteGFR.Text) ? -1 : decimal.Parse(this.txteGFR.Text);
            decimal acr = chkACR.Checked && string.IsNullOrEmpty(txtACR.Text) ? -1 : decimal.Parse(this.txtACR.Text);
            //decimal eGFR = decimal.Parse(this.txteGFR.Text + "." + this.txteGFR2.Text);
            //decimal acr = decimal.Parse(this.txtACR.Text + "." + this.txtACR2.Text);


            if (this.isReadonly)
            {
                args.IsValid = true;
                return;
            }

            if (!string.IsNullOrEmpty(this.txtMostRecentLabDate.Text))
            {
                DateTime MostRecentLabDate = Domain.Helper.GetCanadianDate(this.txtMostRecentLabDate.Text);
                if (MostRecentLabDate > DateTime.Now)
                {
                    validated = false;
                    lblLabDate.Visible = true;
                }
            }

            if (ast != -1)
                if (ast < 1 || ast > 500)
                {
                    validated = false;
                    lblALT.Visible = true;
                }

            if (alkPhos != -1)
                if (alkPhos < 1 || alkPhos > 1000)
                {
                    validated = false;
                    lblphos.Visible = true;
                }

            if (Creatinine != -1)
                if (Creatinine < 1 || Creatinine > 500)
                {
                    validated = false;
                    lblCreatinine.Visible = true;
                }


            if (eGFR != -1)
                if (eGFR < 10 || eGFR > 150)
                {
                    validated = false;
                    lblGFR.Visible = true;
                }

            if (acr != -1)
                if (acr < 1 || acr > 100)
                {
                    validated = false;
                    lblACR.Visible = true;
                }


            args.IsValid = validated;

        }

        #endregion
    }
}