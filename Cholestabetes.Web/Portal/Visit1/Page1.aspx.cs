using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Domain;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Portal.Visit1
{
    public partial class Page1 : System.Web.UI.Page
    {
        VisitRepository visRepos = new VisitRepository();
        PatientRepository patientRepos = new PatientRepository();
        int patientID = -1;
        bool isReadonly = false;
        DateTime result;
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


            if (!Page.IsPostBack)
            {
                LoadDropDowns();
                LoadData();

            }

            InitializeControls();
        }

        #region Methods

        private void InitializeControls()
        {

            this.pnlMain.Enabled = !isReadonly;
            this.imgNext.CausesValidation = !isReadonly;
            this.imgBack.CausesValidation = !isReadonly;
            this.imgSave.Enabled = !isReadonly;

            imgSave.Enabled = !isReadonly;

            imgChkLst.Visible = false;
            imgDOB.Visible = false;
            imgInclusion.Visible = false;
            imgExclusion.Visible = false;
            imgDateConsent.Visible = false;

            lblResult.Text = string.Empty;

            lblDateOfConsent.Visible = false;

            lblFirstNameNoDigits.Visible = false;
            lblLastNameNoDigits.Visible = false;
        }

        private void LoadDropDowns()
        {

            ddDay.Items.Add(new ListItem("---", "---"));

            for (int i = 1; i <= 31; i++)
            {
                ddDay.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }


            ddYear.Items.Add(new ListItem("---", "---"));

            for (int i = 1914; i <= 1996; i++)
            {

                ddYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

        }

        private void LoadData()
        {


            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen1(patientID);

            if (lst != null && lst.Count > 0)
            {
                chkQ1A1.Checked = lst[0].Answer[0].Value == "1";
                chkQ1A2.Checked = lst[1].Answer[0].Value == "1";
                chkQ1A3.Checked = lst[2].Answer[0].Value == "1";
                chkQ1A4.Checked = lst[3].Answer[0].Value == "1";
                chkQ1A5.Checked = lst[4].Answer[0].Value == "1";


                this.txtDateConsent.Text = lst[5].Answer[0].Value;
                this.txtLastName.Text = lst[6].Answer[0].Value;
                this.txtFirstName.Text = lst[7].Answer[0].Value;
                //this.txtDOB.Text = lst[8].Answer[0].Value;

                //if (DateTime.TryParse(lst[8].Answer[0].Value.ToString(), out result))
                //{
                //    DateTime dob = Domain.Helper.GetCanadianDate(lst[8].Answer[0].Value.ToString());
                //   // DateTime dob = DateTime.Parse(lst[8].Answer[0].Value.ToString());

                //    this.ddDay.SelectedValue = dob.Day.ToString();
                //    this.ddMonth.SelectedValue = dob.Month.ToString();
                //    this.ddYear.SelectedValue = dob.Year.ToString();
                //}

                DateTime dob = DateTime.Parse(lst[8].Answer[0].Value.ToString());
                this.ddDay.SelectedValue = dob.Day.ToString();
                this.ddMonth.SelectedValue = dob.Month.ToString();
                this.ddYear.SelectedValue = dob.Year.ToString();

                this.txtPhone.Text = lst[9].Answer[0].Value;

                chkIncl.Checked = lst[10].Answer[0].Value == "1";
                chkExclusion.Checked = lst[11].Answer[0].Value == "1";
            }
        }

        private void SaveData()
        {
            
            string dateOFConsent = this.txtDateConsent.Text;
            string lastName = this.txtLastName.Text;
            string firstName = this.txtFirstName.Text;
            string dob = Domain.Helper.GetCanadianDateStr(this.ddMonth.SelectedItem.Text + "/" + this.ddDay.SelectedItem.Text + "/" + this.ddYear.SelectedItem.Text);
            string phone = this.txtPhone.Text;

            bool inclCriteria = this.chkIncl.Checked;
            bool excCriteria = this.chkExclusion.Checked;

            List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

            PatientQuestion q1 = new PatientQuestion();
            q1.ID = 1;
            q1.Answer.Add(new PatientAnswer() { ID = 1, Value = chkQ1A1.Checked ? "1" : "0" });

            PatientQuestion q2 = new PatientQuestion();
            q2.ID = 1;
            q2.Answer.Add(new PatientAnswer() { ID = 4, Value = chkQ1A2.Checked ? "1" : "0" });

            PatientQuestion q3 = new PatientQuestion();
            q3.ID = 1;
            q3.Answer.Add(new PatientAnswer() { ID = 5, Value = chkQ1A3.Checked ? "1" : "0" });

            PatientQuestion q4 = new PatientQuestion();
            q4.ID = 1;
            q4.Answer.Add(new PatientAnswer() { ID = 6, Value = chkQ1A4.Checked ? "1" : "0" });

            PatientQuestion q5 = new PatientQuestion();
            q5.ID = 1;
            q5.Answer.Add(new PatientAnswer() { ID = 7, Value = chkQ1A5.Checked ? "1" : "0" });

            /////////////////////////////

            PatientQuestion q6 = new PatientQuestion();
            q6.ID = 2;
            q6.Answer.Add(new PatientAnswer() { ID = 8, Value = dateOFConsent });

            PatientQuestion q7 = new PatientQuestion();
            q7.ID = 3;
            q7.Answer.Add(new PatientAnswer() { ID = 9, Value = lastName });

            PatientQuestion q8 = new PatientQuestion();
            q8.ID = 4;
            q8.Answer.Add(new PatientAnswer() { ID = 10, Value = firstName });

            PatientQuestion q9 = new PatientQuestion();
            q9.ID = 5;
            q9.Answer.Add(new PatientAnswer() { ID = 11, Value = dob });

            PatientQuestion q10 = new PatientQuestion();
            q10.ID = 6;
            q10.Answer.Add(new PatientAnswer() { ID = 12, Value = phone });

            PatientQuestion q11 = new PatientQuestion();
            q11.ID = 7;
            q11.Answer.Add(new PatientAnswer() { ID = 13, Value = inclCriteria ? "1" : "0" });

            PatientQuestion q12 = new PatientQuestion();
            q12.ID = 8;
            q12.Answer.Add(new PatientAnswer() { ID = 14, Value = excCriteria ? "1" : "0" });


            lstAnswers.Add(q1);
            lstAnswers.Add(q2);
            lstAnswers.Add(q3);
            lstAnswers.Add(q4);
            lstAnswers.Add(q5);
            lstAnswers.Add(q6);
            lstAnswers.Add(q7);
            lstAnswers.Add(q8);
            lstAnswers.Add(q9);
            lstAnswers.Add(q10);
            lstAnswers.Add(q11);
            lstAnswers.Add(q12);

            visRepos.SaveVisit1Screen1(patientID, lstAnswers);

        }

        #endregion

        #region Event Handlerd

        protected void customVal_OnServerValidate(object source, ServerValidateEventArgs args)
        {

            if (this.isReadonly)
            {
                args.IsValid = true;
                return;
            }

            bool validated = true;

            DateTime? DateConsent = null;
            DateConsent = Domain.Helper.GetCanadianDate(txtDateConsent.Text);
            if (DateConsent > DateTime.Now)
            {
                validated = false;
                imgDateConsent.Visible = true;
                this.lblDateOfConsent.Visible = true;
            }

            string dob = this.ddDay.SelectedItem.Text + this.ddMonth.SelectedItem.Text + this.ddYear.SelectedItem.Text;

            if (
                    !chkQ1A1.Checked &&
                    !chkQ1A2.Checked &&
                    !chkQ1A3.Checked &&
                    !chkQ1A4.Checked &&
                    !chkQ1A5.Checked
                )
            {
                validated = false;
                imgChkLst.Visible = true;
            }


            if (!this.chkIncl.Checked)
            {
                validated = false;
                imgInclusion.Visible = true;

            }

            if (!this.chkExclusion.Checked)
            {
                validated = false;
                imgExclusion.Visible = true;
            }


            if (!DateTime.TryParse(dob, out result))
            {
                validated = false;
                imgDOB.Visible = true;
            }


            if (Helper.Utility.HasDigits(this.txtFirstName.Text))
            {
                validated = false;
                lblFirstNameNoDigits.Visible = true;
            }

            if (Helper.Utility.HasDigits(this.txtLastName.Text))
            {
                validated = false;
                lblLastNameNoDigits.Visible = true;
            }

            args.IsValid = validated;


            if (!validated)

                Helper.Utility.FocusControlOnPageLoad(this.pnlCustVal.ClientID, this.Page);
            
         
        }

        protected void imgBack_clicked(object sender, EventArgs e)
        {
            Response.Redirect("~/Portal/Patients.aspx");
        }

        protected void imgSave_clicked(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveData();
                lblResult.Text = "Saved successfully!";
            }
        }

        protected void imgNext_clicked(object sender, EventArgs e)
        {
            if (isReadonly)
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
            else
            {
                if (Page.IsValid)
                {
                    SaveData();

                    patientRepos.SaveName(patientID, txtFirstName.Text, txtLastName.Text, this.txtPhone.Text);

                    if (updateScreen)
                        visRepos.UpdateVisitScreen(1, 2, patientID);

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
            }
        }

        #endregion
    }
}