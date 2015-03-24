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

    public partial class Page2 : System.Web.UI.Page
    {
        VisitRepository visRepos = new VisitRepository();
        PatientRepository patientRepos = new PatientRepository();
        int patientID = -1;
        bool isReadonly = false;
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

        #region Metthods

        private void LoadDropDowns()
        {



        }

        private void LoadData()
        {
            this.txtPatientAge.Text = patientRepos.GetPatientAge(patientID);

            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen2(patientID);

            if (lst != null && lst.Count > 0)
            {
                this.txtVisit1Date.Text = lst[0].Answer[0].Value;
                this.chkGender.SelectedValue = lst[1].Answer[0].ID.ToString();
                this.ddEthinicity.SelectedValue = lst[2].Answer[0].ID.ToString();
                this.ddMedCoverage.SelectedValue = lst[3].Answer[0].ID.ToString();

                this.txtSystolic.Text = lst[4].Answer[0].Value;
                this.txtDiastolic.Text = lst[5].Answer[0].Value;

                if (lst[6].Answer[0].ID == 33)
                {
                    //chkKg.Checked = true;
                    //chkLbs.Checked = false;

                    rdoWeightType.SelectedIndex = 0;
                }
                else
                    if (lst[6].Answer[0].ID == 34)
                    {
                        //chkKg.Checked = false;
                        //chkLbs.Checked = true;

                        rdoWeightType.SelectedIndex = 1;
                    }


                if (lst[7].Answer[0].ID == 35)
                {
                    //chkCM.Checked = true;
                    //chkInch.Checked = false;

                    rdoHeightType.SelectedIndex = 0;
                }
                else
                    if (lst[7].Answer[0].ID == 36)
                    {
                        //chkCM.Checked = false;
                        //chkInch.Checked = true;

                        rdoHeightType.SelectedIndex = 1;
                    }


                this.txtWeight.Text = lst[6].Answer[0].Value;
                this.txtHeight.Text = lst[7].Answer[0].Value;

                this.chkNeverSmoked.Checked = lst[8].Answer[0].Value == "1";
                this.chkPastSmoker.Checked = lst[9].Answer[0].Value == "1";
                this.chkCurrentSmoker.Checked = lst[10].Answer[0].Value == "1";

                this.chkDepressionYes.Checked = lst[11].Answer[0].Value == "1";
                this.chkErectleYes.Checked = lst[12].Answer[0].Value == "1";
                this.chkHypoglycemiaYes.Checked = lst[13].Answer[0].Value == "1";
                this.chkMacroalbuminuriaYes.Checked = lst[14].Answer[0].Value == "1";
                this.chkMicroalbuminuriaYes.Checked = lst[15].Answer[0].Value == "1";
                this.chkRetinopathyYes.Checked = lst[16].Answer[0].Value == "1";
                chkDiabetesComplicationsNone.Checked = lst[17].Answer[0].Value == "1";


                chkCurrentMedicationNone.Checked = lst[18].Answer[0].Value == "1";
                this.chkASAYes.Checked = lst[19].Answer[0].Value == "1";
                this.chkOtherAntiplateletAgentYes.Checked = lst[20].Answer[0].Value == "1";
                this.chkACEInhibitorYes.Checked = lst[21].Answer[0].Value == "1";
                this.chkARBYes.Checked = lst[22].Answer[0].Value == "1";
                this.chkBetaBlockerYes.Checked = lst[23].Answer[0].Value == "1";
                this.chkCalciumChannelBlockerYes.Checked = lst[24].Answer[0].Value == "1";
                this.chkDiureticYes.Checked = lst[25].Answer[0].Value == "1";
                

                this.ddPatientAdherence.SelectedValue = lst[26].Answer[0].ID.ToString();

                this.chkPatientCaregiver.Checked = lst[27].Answer[0].Value == "1";
                this.chkPhramacyRenewal.Checked = lst[28].Answer[0].Value == "1";
                this.chkMedicationCount.Checked = lst[29].Answer[0].Value == "1";
                this.chkGuessedEstimated.Checked = lst[30].Answer[0].Value == "1";
                this.chkDidNotEvaluate.Checked = lst[31].Answer[0].Value == "1";

                //chkDiabetesComplicationsNone.Checked = lst[30].Answer[0].Value == "1";
                //chkCurrentMedicationNone.Checked = lst[31].Answer[0].Value == "1";
                //chkEstimateMedicationNo.Checked = lst[32].Answer[0].Value == "1";
            }

        }

        private void InitializeControls()
        {
            this.pnlMain.Enabled = !isReadonly;
            this.imgNext.CausesValidation = !isReadonly;
            this.imgBack.CausesValidation = !isReadonly;
            this.imgSave.Enabled = !isReadonly;

            imgPatientGender.Visible = false;
            imgWeight.Visible = false;
            imgHeight.Visible = false;
            imgSmokingHistory.Visible = false;
            imgDepression.Visible = false;
            imgErectile.Visible = false;
            imgHypoglycemia.Visible = false;
            imgMicroalbuminuria.Visible = false;
            imgMacroalbuminuria.Visible = false;
            imgRetinopathy.Visible = false;
            imgASA.Visible = false;
            imgAntiplatelet.Visible = false;
            imgACEInhibito.Visible = false;
            imgARB.Visible = false;
            imgBetaBlocker.Visible = false;
            imgCalciumChannelBlocker.Visible = false;
            imgDiuretic.Visible = false;
            imgVisit1Date.Visible = false;

            lblResult.Text = string.Empty;

            lblBPLarge.Visible = false;

            lblHeight.Visible = false;
            lblHeight.Text = string.Empty;

            lblWeight.Visible = false;
            lblWeight.Text = string.Empty;

            lblDateOfConsent.Visible = false;

            imgDiab.Visible = false;
            imgCurrMed.Visible = false;
            imgEstMedAdhere.Visible = false;
        }

        private void SaveData()
        {

            string visit1Date = this.txtVisit1Date.Text;
            int genderAnsID = Int32.Parse(chkGender.SelectedItem.Value);
            int ethinicityID = Int32.Parse(this.ddEthinicity.SelectedItem.Value);
            int medCoverageID = Int32.Parse(ddMedCoverage.SelectedItem.Value);

            string bpSystolic = this.txtSystolic.Text;
            string bpDystolic = this.txtDiastolic.Text;

            string weight = this.txtWeight.Text;
            string height = this.txtHeight.Text;

            // bool weightInPounds = this.chkLbs.Checked;
            bool weightInPounds = !(this.rdoWeightType.SelectedIndex == 0);

            bool heightInCms = rdoHeightType.SelectedIndex == 0;

            //bool heightCM = this.chkCM.Checked;
            //bool heightInch = this.chkInch.Checked;

            bool neverSmoked = chkNeverSmoked.Checked;
            bool pastSmoker = chkPastSmoker.Checked;
            bool currSmoker = chkCurrentSmoker.Checked;


            bool diabCompl_Depression = chkDepressionYes.Checked;
            bool diabCompl_Erectile = chkErectleYes.Checked;
            bool diabCompl_Hypoglycemia = chkHypoglycemiaYes.Checked;
            bool diabCompl_Macroalbuminuria = chkMacroalbuminuriaYes.Checked;
            bool diabCompl_Microalbuminuria = chkMicroalbuminuriaYes.Checked;
            bool diabCompl_Retinopathy = chkRetinopathyYes.Checked;
            bool diabCompl_None = chkDiabetesComplicationsNone.Checked;

            bool currMedication_ASA = chkASAYes.Checked;
            bool currMedication_OtherAntiplateletAgent = chkOtherAntiplateletAgentYes.Checked;
            bool currMedication_ACEInhibitor = chkACEInhibitorYes.Checked;
            bool currMedication_ARB = chkARBYes.Checked;
            bool currMedication_BetaBlocker = chkBetaBlockerYes.Checked;
            bool currMedication_CalciumChannelBlocker = chkCalciumChannelBlockerYes.Checked;
            bool currMedication_Diuretic = chkDiureticYes.Checked;
            bool currMedication_None = chkCurrentMedicationNone.Checked;

            int adherentCurrMed = Int32.Parse(this.ddPatientAdherence.SelectedItem.Value);

            bool estimate_PatientCaregiver = chkPatientCaregiver.Checked;
            bool estimate_PhramacyRenewal = chkPhramacyRenewal.Checked;
            bool estimate_MedicationCount = chkMedicationCount.Checked;
            bool estimate_GuessedEstimated = chkGuessedEstimated.Checked;
            bool estimate_DidNotEvaluate = chkDidNotEvaluate.Checked;
            //bool estimate_None = chkEstimateMedicationNo.Checked;
            bool estimate_None = false;

            List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

            PatientQuestion q1 = new PatientQuestion();
            q1.ID = 9;
            q1.Answer.Add(new PatientAnswer() { ID = 15, Value = visit1Date });

            PatientQuestion q2 = new PatientQuestion();
            q2.ID = 10;
            q2.Answer.Add(new PatientAnswer() { ID = genderAnsID, Value = chkGender.SelectedItem.Text });

            PatientQuestion q3 = new PatientQuestion();
            q3.ID = 11;
            q3.Answer.Add(new PatientAnswer() { ID = ethinicityID, Value = ddEthinicity.SelectedItem.Text });

            PatientQuestion q4 = new PatientQuestion();
            q4.ID = 12;
            q4.Answer.Add(new PatientAnswer() { ID = medCoverageID, Value = this.ddMedCoverage.SelectedItem.Text });

            //blood pressure
            PatientQuestion q5 = new PatientQuestion();
            q5.ID = 13;
            q5.Answer.Add(new PatientAnswer() { ID = 31, Value = bpSystolic });

            PatientQuestion q6 = new PatientQuestion();
            q6.ID = 13;
            q6.Answer.Add(new PatientAnswer() { ID = 32, Value = bpDystolic });

            //weight
            PatientQuestion q7 = new PatientQuestion();
            q7.ID = 14;
            q7.Answer.Add(new PatientAnswer() { ID = weightInPounds ? 34 : 33, Value = weight });

            //height
            PatientQuestion q8 = new PatientQuestion();
            q8.ID = 15;
            q8.Answer.Add(new PatientAnswer() { ID = heightInCms ? 35 : 36, Value = height });

            //smoking history
            PatientQuestion q9 = new PatientQuestion();
            q9.ID = 16;
            q9.Answer.Add(new PatientAnswer() { ID = 37, Value = neverSmoked ? "1" : "0" });

            PatientQuestion q10 = new PatientQuestion();
            q10.ID = 16;
            q10.Answer.Add(new PatientAnswer() { ID = 38, Value = pastSmoker ? "1" : "0" });

            PatientQuestion q11 = new PatientQuestion();
            q11.ID = 16;
            q11.Answer.Add(new PatientAnswer() { ID = 39, Value = currSmoker ? "1" : "0" });


            //diabetes complications
            PatientQuestion q12 = new PatientQuestion();
            q12.ID = 17;
            q12.Answer.Add(new PatientAnswer() { ID = 40, Value = diabCompl_Depression ? "1" : "0" });

            PatientQuestion q13 = new PatientQuestion();
            q13.ID = 17;
            q13.Answer.Add(new PatientAnswer() { ID = 41, Value = diabCompl_Erectile ? "1" : "0" });

            PatientQuestion q14 = new PatientQuestion();
            q14.ID = 17;
            q14.Answer.Add(new PatientAnswer() { ID = 42, Value = diabCompl_Hypoglycemia ? "1" : "0" });

            PatientQuestion q15 = new PatientQuestion();
            q15.ID = 17;
            q15.Answer.Add(new PatientAnswer() { ID = 43, Value = diabCompl_Macroalbuminuria ? "1" : "0" });

            PatientQuestion q16 = new PatientQuestion();
            q16.ID = 17;
            q16.Answer.Add(new PatientAnswer() { ID = 44, Value = diabCompl_Microalbuminuria ? "1" : "0" });

            PatientQuestion q17 = new PatientQuestion();
            q17.ID = 17;
            q17.Answer.Add(new PatientAnswer() { ID = 45, Value = diabCompl_Retinopathy ? "1" : "0" });

            //current medication 
            PatientQuestion q18 = new PatientQuestion();
            q18.ID = 18;
            q18.Answer.Add(new PatientAnswer() { ID = 46, Value = currMedication_ASA ? "1" : "0" });

            PatientQuestion q19 = new PatientQuestion();
            q19.ID = 18;
            q19.Answer.Add(new PatientAnswer() { ID = 47, Value = currMedication_OtherAntiplateletAgent ? "1" : "0" });

            PatientQuestion q20 = new PatientQuestion();
            q20.ID = 18;
            q20.Answer.Add(new PatientAnswer() { ID = 48, Value = currMedication_ACEInhibitor ? "1" : "0" });

            PatientQuestion q21 = new PatientQuestion();
            q21.ID = 18;
            q21.Answer.Add(new PatientAnswer() { ID = 49, Value = currMedication_ARB ? "1" : "0" });

            PatientQuestion q22 = new PatientQuestion();
            q22.ID = 18;
            q22.Answer.Add(new PatientAnswer() { ID = 50, Value = currMedication_BetaBlocker ? "1" : "0" });

            PatientQuestion q23 = new PatientQuestion();
            q23.ID = 18;
            q23.Answer.Add(new PatientAnswer() { ID = 51, Value = currMedication_CalciumChannelBlocker ? "1" : "0" });

            PatientQuestion q24 = new PatientQuestion();
            q24.ID = 18;
            q24.Answer.Add(new PatientAnswer() { ID = 52, Value = currMedication_Diuretic ? "1" : "0" });

            //curr medication 
            PatientQuestion q25 = new PatientQuestion();
            q25.ID = 19;
            q25.Answer.Add(new PatientAnswer() { ID = adherentCurrMed, Value = ddPatientAdherence.SelectedItem.Text });


            //how did you estimate 
            PatientQuestion q26 = new PatientQuestion();
            q26.ID = 20;
            q26.Answer.Add(new PatientAnswer() { ID = 56, Value = estimate_PatientCaregiver ? "1" : "0" });

            PatientQuestion q27 = new PatientQuestion();
            q27.ID = 20;
            q27.Answer.Add(new PatientAnswer() { ID = 57, Value = estimate_PhramacyRenewal ? "1" : "0" });

            PatientQuestion q28 = new PatientQuestion();
            q28.ID = 20;
            q28.Answer.Add(new PatientAnswer() { ID = 58, Value = estimate_MedicationCount ? "1" : "0" });

            PatientQuestion q29 = new PatientQuestion();
            q29.ID = 20;
            q29.Answer.Add(new PatientAnswer() { ID = 59, Value = estimate_GuessedEstimated ? "1" : "0" });

            PatientQuestion q30 = new PatientQuestion();
            q30.ID = 20;
            q30.Answer.Add(new PatientAnswer() { ID = 60, Value = estimate_DidNotEvaluate ? "1" : "0" });


            PatientQuestion q31 = new PatientQuestion();
            q31.ID = 17;
            q31.Answer.Add(new PatientAnswer() { ID = 210, Value = diabCompl_None ? "1" : "0" });

            PatientQuestion q32 = new PatientQuestion();
            q32.ID = 18;
            q32.Answer.Add(new PatientAnswer() { ID = 211, Value = currMedication_None ? "1" : "0" });


            PatientQuestion q33 = new PatientQuestion();
            q33.ID = 20;
            q33.Answer.Add(new PatientAnswer() { ID = 212, Value = estimate_None ? "1" : "0" });


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
            lstAnswers.Add(q13);
            lstAnswers.Add(q14);
            lstAnswers.Add(q15);
            lstAnswers.Add(q16);
            lstAnswers.Add(q17);
            lstAnswers.Add(q18);
            lstAnswers.Add(q19);
            lstAnswers.Add(q20);
            lstAnswers.Add(q21);
            lstAnswers.Add(q22);
            lstAnswers.Add(q23);
            lstAnswers.Add(q24);
            lstAnswers.Add(q25);
            lstAnswers.Add(q26);
            lstAnswers.Add(q27);
            lstAnswers.Add(q28);
            lstAnswers.Add(q29);
            lstAnswers.Add(q30);
            lstAnswers.Add(q31);
            lstAnswers.Add(q32);
            lstAnswers.Add(q33);

            visRepos.SaveVisit1Screen2(patientID, lstAnswers);

        }

        #endregion

        #region Event Handlers

        protected void imgBack_clicked(object sender, EventArgs e)
        {
            string url = string.Format("~/Portal/Visit1/Page1.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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
                string url = string.Format("~/Portal/Visit1/Page3.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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
                        visRepos.UpdateVisitScreen(1, 3, patientID);

                    string url = string.Format("~/Portal/Visit1/Page3.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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

            if (this.isReadonly)
            {
                args.IsValid = true;
                return;
            }

            DateTime? visit1Date = null;

            visit1Date = Domain.Helper.GetCanadianDate(this.txtVisit1Date.Text);

            DateTime dateOfConsent = visRepos.GetVisit1DateOfConsent(this.patientID);

            if (visit1Date < dateOfConsent || visit1Date > DateTime.Now)
            {
                validated = false;
                this.imgVisit1Date.Visible = true;
                lblDateOfConsent.Visible = true;
            }

            if (chkGender.SelectedItem == null)
            {
                validated = false;
                imgPatientGender.Visible = true;
            }


            if (rdoWeightType.SelectedIndex == -1)
            {
                validated = false;
                imgWeight.Visible = true;
            }

            if (rdoHeightType.SelectedIndex == -1)
            {
                validated = false;
                imgHeight.Visible = true;
            }


            if (rdoWeightType.SelectedIndex > -1 && rdoHeightType.SelectedIndex > -1)
            {

                bool isKg = rdoWeightType.SelectedIndex == 0;
                bool isCm = rdoHeightType.SelectedIndex == 0;

                decimal weight = decimal.Parse(this.txtWeight.Text);
                decimal height = decimal.Parse(this.txtHeight.Text);

                if (isKg)
                {
                    if (weight < 30 || weight > 300)
                    {
                        validated = false;
                        lblWeight.Visible = true;
                        lblWeight.Text = "Weight should be between 30 and 300 Kg";
                    }
                }
                else
                {
                    if (weight < 66 || weight > 660)
                    {
                        validated = false;
                        lblWeight.Visible = true;
                        lblWeight.Text = "Weight should be between 66 and 660 lbs";
                    }
                }

                if (isCm)
                {
                    if (height < 100 || height > 230)
                    {
                        validated = false;
                        lblHeight.Visible = true;
                        lblHeight.Text = "Height should be between 100 and 230 cm";
                    }
                }
                else
                {
                    if (height < 39 || height > 90)
                    {
                        validated = false;
                        lblHeight.Visible = true;
                        lblHeight.Text = "Height should be between 39 and 90 Inches";
                    }
                }

            }

            //BP
            int bpSystolic = Int32.Parse(this.txtSystolic.Text);
            int bpDystolic = Int32.Parse(this.txtDiastolic.Text);

            if (bpDystolic > bpSystolic)
            {
                validated = false;
                lblBPLarge.Visible = true;
            }


            if (!chkNeverSmoked.Checked && !chkPastSmoker.Checked && !chkCurrentSmoker.Checked)
            {
                validated = false;
                imgSmokingHistory.Visible = true;
            }


            if (

                !chkDepressionYes.Checked &&
                !chkErectleYes.Checked &&
                !chkHypoglycemiaYes.Checked &&
                !chkMacroalbuminuriaYes.Checked &&
                !chkMicroalbuminuriaYes.Checked &&
                !chkRetinopathyYes.Checked &&
                !chkDiabetesComplicationsNone.Checked
            )
            {

                validated = false;
                imgDiab.Visible = true;

            }


            if (

                  !chkCurrentMedicationNone.Checked &&
                  !chkASAYes.Checked &&
                  !chkOtherAntiplateletAgentYes.Checked &&
                  !chkACEInhibitorYes.Checked &&
                  !chkARBYes.Checked &&
                  !chkBetaBlockerYes.Checked &&
                  !chkCalciumChannelBlockerYes.Checked &&
                    !chkDiureticYes.Checked
              )
            {

                validated = false;
                imgCurrMed.Visible = true;

            }


            if (

                  //!chkEstimateMedicationNo.Checked &&
                  !chkPatientCaregiver.Checked &&
                  !chkPhramacyRenewal.Checked &&
                  !chkMedicationCount.Checked &&
                  !chkGuessedEstimated.Checked &&
                  !chkDidNotEvaluate.Checked


              )
            {

                validated = false;
                imgEstMedAdhere.Visible = true;

            }


            args.IsValid = validated;

            if (!validated)

                Helper.Utility.FocusControlOnPageLoad(this.pnlCustVal.ClientID, this.Page);

        }

        #endregion
    }
}