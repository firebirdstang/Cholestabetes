using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;
using Cholestabetes.Domain;

namespace Cholestabetes.Web.Portal.Visit1
{
    public partial class Page5 : System.Web.UI.Page
    {
        bool isReadonly = false;
        int patientID = -1;
        bool updateScreen = true;
        VisitRepository visRepos = new VisitRepository();

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


            ScriptManager.RegisterStartupScript(Page, typeof(Page), "ClearControlScript", this.GetScript(), true);

            InitializeControls();

           

        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);

            if (this.wiz.ActiveStepIndex > 2)

                lblHeading.Text = "5 - Clinical Rationale and Next Steps in Management: Glycemia";

            else

                lblHeading.Text = "5 - Clinical Rationale and Next Steps in Management: Dyslipidemia";

        }

        #region Methods

        private void AdvanceWizard()
        {
            //do not go beyond the last page of the wizard
            if (this.wiz.ActiveStepIndex < this.wiz.WizardSteps.Count - 1)
            {
                this.wiz.ActiveStepIndex = this.wiz.ActiveStepIndex + 1;
            }

            Helper.Utility.FocusControlOnPageLoad(this.pnlCustVal.ClientID, this.Page);

        }

        private string GetScript()
        {
            string script = "HideAll(); HideSubDivAll();HideAllSecPage();";

            return script;

        }

        private void InitializeControls()
        {
            //this.pnlMain.Enabled = !isReadonly;
            (wiz.FindControl("pnlMain") as Panel).Enabled = !isReadonly;
            (wiz.FindControl("pnlSec") as Panel).Enabled = !isReadonly;

            lblColesevelamRdo.Visible = false;
            lblddAddColesevelam.Visible = false;
            lbldivrdoColesevelamNo.Visible = false;

            lblrdoEzetimibe.Visible = false;
            lblEzetimibeNo.Visible = false;

            lblFibrateRdoSelReq.Visible = false;
            lblFibrateRdoLst.Visible = false;

            lblNiacinRdo.Visible = false;
            lblNiacinRdoLst.Visible = false;

            lblNoChange.Visible = false;

            lblMainSelRequired.Visible = false;

            lblSecPageSelRequired.Visible = false;
            lblAddTherapyRdo.Visible = false;

            lblrdoAddSec.Visible = false;
            lblNoChangesManagement.Visible = false;

            lblBaseLineLDLC.Visible = false;

        }

        private void LoadData()
        {

            Domain.Page4Values values = visRepos.GetPage4Values(this.patientID);

            chkColesevelam.Visible = values.AddColesevelam;
            chkEzetimibe.Visible = values.AddEzetimibe;
            chkFibrate.Visible = values.AddFibrate;
            chkNiacin.Visible = values.AddNiacin;

            
            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen5(patientID);

            if (lst != null && lst.Count > 0)
            {

                chkColesevelam.Checked = lst[0].Answer[0].Value.ToString() == "1";
                chkEzetimibe.Checked = lst[1].Answer[0].Value.ToString() == "1";
                chkFibrate.Checked = lst[2].Answer[0].Value.ToString() == "1";
                chkNiacin.Checked = lst[3].Answer[0].Value.ToString() == "1";
                chkNoChange.Checked = lst[4].Answer[0].Value.ToString() == "1";
                rdoColesevelamYes.Checked = lst[5].Answer[0].Value.ToString() == "1";
                rdoColesevelamNo.Checked = lst[6].Answer[0].Value.ToString() == "1";

                int index = 0;
                foreach (ListItem item in ddAddColesevelam.Items)
                {
                    if (item.Text.ToLower() == lst[7].Answer[0].Value)
                    {
                        break;
                    }
                    index++;
                }
                ddAddColesevelam.SelectedIndex = index;

                rdoColesevelamPatientRefusal.Checked = lst[8].Answer[0].Value.ToString() == "1";
                rdoColesevelamPatientAfford.Checked = lst[9].Answer[0].Value.ToString() == "1";
                rdoColesevelamDrugAdmin.Checked = lst[10].Answer[0].Value.ToString() == "1";
                rdoColesevelamPatientRX.Checked = lst[11].Answer[0].Value.ToString() == "1";
                rdoEzetimibeYes.Checked = lst[12].Answer[0].Value.ToString() == "1";
                rdoEzetimibeNo.Checked = lst[13].Answer[0].Value.ToString() == "1";
                rdoEzetimibePatientRefusal.Checked = lst[14].Answer[0].Value.ToString() == "1";
                rdoEzetimibePatientAfford.Checked = lst[15].Answer[0].Value.ToString() == "1";
                rdoEzetimibeDrugAdmin.Checked = lst[16].Answer[0].Value.ToString() == "1";
                rdoEzetimibePatientRX.Checked = lst[17].Answer[0].Value.ToString() == "1";
                rdoFibrateYes.Checked = lst[18].Answer[0].Value.ToString() == "1";
                rdoFibrateNo.Checked = lst[19].Answer[0].Value.ToString() == "1";
                rdoFibratePatientAppr.Checked = lst[20].Answer[0].Value.ToString() == "1";
                rdoFibratePatientTG.Checked = lst[21].Answer[0].Value.ToString() == "1";
                rdoFibrateDisagreeRecom.Checked = lst[22].Answer[0].Value.ToString() == "1";
                rdoFibrateMedicalConstraints.Checked = lst[23].Answer[0].Value.ToString() == "1";
                rdoFibrateCoverage.Checked = lst[24].Answer[0].Value.ToString() == "1";
                rdoNiacinYes.Checked = lst[25].Answer[0].Value.ToString() == "1";
                rdoNiacinNo.Checked = lst[26].Answer[0].Value.ToString() == "1";
                rdoNiacinPatientAppr.Checked = lst[27].Answer[0].Value.ToString() == "1";
                rdoNiacinPatientDisagree.Checked = lst[28].Answer[0].Value.ToString() == "1";
                rdoNiacinMedical.Checked = lst[29].Answer[0].Value.ToString() == "1";
                rdoNiacinReimbursement.Checked = lst[30].Answer[0].Value.ToString() == "1";
                rdoNoChangePatientAchieved.Checked = lst[31].Answer[0].Value.ToString() == "1";
                rdoNoChangeLifeStyle.Checked = lst[32].Answer[0].Value.ToString() == "1";
                rdoNoChangeNeedTime.Checked = lst[33].Answer[0].Value.ToString() == "1";
                rdoNoChangeStatin.Checked = lst[34].Answer[0].Value.ToString() == "1";
                rdoNoChangeNewTherapy.Checked = lst[35].Answer[0].Value.ToString() == "1";
                this.rdoNoChangePatientAppro.Checked = lst[36].Answer[0].Value.ToString() == "1";
                this.rdoNoChangeRiskAssesment.Checked = lst[37].Answer[0].Value.ToString() == "1";
                this.rdoNoChangeDisagreeRecom.Checked = lst[38].Answer[0].Value.ToString() == "1";
                this.rdoNoChangePatientRefusal.Checked = lst[39].Answer[0].Value.ToString() == "1";
                this.rdoNoChangeMedicalConstraints.Checked = lst[40].Answer[0].Value.ToString() == "1";
                this.rdoNoChangePatientAge.Checked = lst[41].Answer[0].Value.ToString() == "1";
                rdoNoChangeReimbursement.Checked = lst[42].Answer[0].Value.ToString() == "1";
               this.txtBaselineLDLC.Text  = lst[43].Answer[0].Value.ToString()  ;

                string func = string.Empty;

                if (chkColesevelam.Checked)
                {

                    func = string.Format(
                                                  "ShowControls( ['{0}','{1}' ]);",
                                                  divColesevelam.ClientID,

                                                  rdoColesevelamYes.Checked ?
                                                  divrdoColesevelamYes.ClientID :
                                                  divrdoColesevelamNo.ClientID

                                              );
                }
                else
                    if (this.chkEzetimibe.Checked)
                    {
                        func = string.Format(
                                                     "ShowControls( ['{0}','{1}' ]);",
                                                      this.divEzetimibe.ClientID,

                                                      this.rdoEzetimibeYes.Checked ?
                                                      this.divrdoEzetimibeYes.ClientID :
                                                      this.divrdoEzetimibeNo.ClientID
                                                  );
                    }
                    else
                        if (this.chkFibrate.Checked)
                        {
                            func = string.Format(
                                                          "ShowControls( ['{0}','{1}' ]);",
                                                          this.divFibrate.ClientID,

                                                          this.rdoFibrateYes.Checked ?
                                                          this.divrdoFibrateNo.ClientID :
                                                          this.divrdoFibrateNo.ClientID
                                                      );
                        }
                        else
                            if (this.chkNiacin.Checked)
                            {
                                func = string.Format(
                                                              "ShowControls( ['{0}','{1}' ]);",
                                                              this.divNiacin.ClientID,

                                                              this.rdoNiacinYes.Checked ?
                                                              this.divrdoNiacinNo.ClientID :
                                                              this.divrdoNiacinNo.ClientID

                                                          );
                            }
                            else
                                if (this.chkNoChange.Checked)
                                {

                                    if (this.rdoNoChangePatientAchieved.Checked)
                                    {
                                        func = string.Format(
                                                                      "ShowControls( ['{0}','{1}' ]);",
                                                                      this.divNoChangePatientAchieved.ClientID,
                                                                      this.divNoChangePatientAchieved.ClientID

                                                                  );
                                    }
                                   

                                        func += string.Format(
                                                                      "ShowControls( ['{0}','{1}' ]);",
                                                                      this.chkNoChange.ClientID,
                                                                      this.divNoChange.ClientID

                                                                  );
                                     
                                }


                ScriptManager.RegisterStartupScript(Page, typeof(Page), "ShowScript", func, true);
            }
            //else
            //{
            //    Domain.Page4Values values = visRepos.GetPage4Values(this.patientID);

            //    chkColesevelam.Visible = values.AddColesevelam;
            //    chkEzetimibe.Visible = values.AddEzetimibe;
            //    chkFibrate.Visible = values.AddFibrate;
            //    chkNiacin.Visible = values.AddNiacin;
            //}

        }

        private void LoadDataLastPage()
        {

            Domain.Page4ValuesSec values = visRepos.GetPage4ValuesSec(this.patientID);

            chkGlucosidase.Visible = values.AddGlucosidase;
            chkDPP4Inhibitor.Visible = values.AddDPP4;
            chkReceptorAgonist.Visible = values.AddGLP1;
            chkInsulin.Visible = values.AddInsulin;
            chkMeglitinide.Visible = values.AddMeglitinide;
            chkSGLT2Inhibitor.Visible = values.AddSGLT2;
            chkSulfonylurea.Visible = values.AddSulfonylurear;
            chkThiazolidinedione.Visible = values.AddThiazolidinedione;

            
            PatientRepository patRepos = new PatientRepository();
            this.pnlPatientAdherence.Visible = patRepos.ShowPatientAdherenceBox(this.patientID);
          
            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen6(patientID);

            if (lst != null && lst.Count > 0)
            {
                chkGlucosidase.Checked = lst[0].Answer[0].Value.ToString() == "1";
                chkDPP4Inhibitor.Checked = lst[1].Answer[0].Value.ToString() == "1";
                chkReceptorAgonist.Checked = lst[2].Answer[0].Value.ToString() == "1";
                chkInsulin.Checked = lst[3].Answer[0].Value.ToString() == "1";
                chkMeglitinide.Checked = lst[4].Answer[0].Value.ToString() == "1";
                chkSGLT2Inhibitor.Checked = lst[5].Answer[0].Value.ToString() == "1";
                chkSulfonylurea.Checked = lst[6].Answer[0].Value.ToString() == "1";
                chkThiazolidinedione.Checked = lst[7].Answer[0].Value.ToString() == "1";
                chkNoChangeMgmt.Checked = lst[8].Answer[0].Value.ToString() == "1";

                rdoAddTherapyYes.Checked = lst[9].Answer[0].Value.ToString() == "1";
                rdoAddTherapyNo.Checked = lst[10].Answer[0].Value.ToString() == "1";

                rdoAddSecPatientRefusal.Checked = lst[11].Answer[0].Value.ToString() == "1";
                rdoAddSecInsurance.Checked = lst[12].Answer[0].Value.ToString() == "1";
                rdoAddSecAdmin.Checked = lst[13].Answer[0].Value.ToString() == "1";
                rdoAddSecRX.Checked = lst[14].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoReinforce.Checked = lst[15].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoEvaluate.Checked = lst[16].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoTitrated.Checked = lst[17].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoColesevelam.Checked = lst[18].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoNewTherapy.Checked = lst[19].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoCurrMed.Checked = lst[20].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoRiskAsses.Checked = lst[21].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoRecommend.Checked = lst[22].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoRefusal.Checked = lst[23].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoConstraints.Checked = lst[24].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoAge.Checked = lst[25].Answer[0].Value.ToString() == "1";
                rdoAddTherapySecNoDiff.Checked = lst[26].Answer[0].Value.ToString() == "1";

                string func = string.Empty;

                if (
                        chkGlucosidase.Checked ||
                        chkGlucosidase.Checked ||
                        chkDPP4Inhibitor.Checked ||
                        chkReceptorAgonist.Checked ||
                        chkInsulin.Checked ||
                        chkMeglitinide.Checked ||
                        chkSGLT2Inhibitor.Checked ||
                        chkSulfonylurea.Checked ||
                        chkThiazolidinedione.Checked  
                      

                    )
                {

                    func = string.Format(
                                                  "ShowControlsSec( ['{0}','{1}' ]);",
                                                  divAddThereapy.ClientID,

                                                  rdoAddTherapyNo.Checked ?
                                                  divAddThereapyNo.ClientID :
                                                  divAddThereapyYes.ClientID

                                              );
                }
                else
                    if (   chkNoChangeMgmt.Checked )
                    {

                        func = string.Format(
                                                      "ShowControlsSec( ['{0}','{1}' ]);",
                                                      divNoChangesManagement.ClientID,
                                                      divNoChangesManagement.ClientID

                                                  );
                    }


                ScriptManager.RegisterStartupScript(Page, typeof(Page), "ShowSecScript", func, true);
            }
            //else
            //{
            //    Domain.Page4ValuesSec values = visRepos.GetPage4ValuesSec(this.patientID);

            //    chkGlucosidase.Visible = values.AddGlucosidase;
            //    chkDPP4Inhibitor.Visible = values.AddDPP4;
            //    chkReceptorAgonist.Visible = values.AddGLP1;
            //    chkInsulin.Visible = values.AddInsulin;
            //    chkMeglitinide.Visible = values.AddMeglitinide;
            //    chkSGLT2Inhibitor.Visible = values.AddSGLT2;
            //    chkSulfonylurea.Visible = values.AddSulfonylurear;
            //    chkThiazolidinedione.Visible = values.AddThiazolidinedione;

            //}

        }

        private void SaveData(int pageNum)
        {

            List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

            if (pageNum == 1)
            {
                #region Saving data

                PatientQuestion q1 = new PatientQuestion();
                q1.ID = 54;
                q1.Answer.Add(new PatientAnswer() { ID = 140, Value = chkColesevelam.Checked ? "1" : "0" });

                PatientQuestion q2 = new PatientQuestion();
                q2.ID = 55;
                q2.Answer.Add(new PatientAnswer() { ID = 141, Value = chkEzetimibe.Checked ? "1" : "0" });

                PatientQuestion q3 = new PatientQuestion();
                q3.ID = 56;
                q3.Answer.Add(new PatientAnswer() { ID = 142, Value = chkFibrate.Checked ? "1" : "0" });

                PatientQuestion q4 = new PatientQuestion();
                q4.ID = 57;
                q4.Answer.Add(new PatientAnswer() { ID = 143, Value = chkNiacin.Checked ? "1" : "0" });

                PatientQuestion q5 = new PatientQuestion();
                q5.ID = 58;
                q5.Answer.Add(new PatientAnswer() { ID = 144, Value = chkNoChange.Checked ? "1" : "0" });

                PatientQuestion q6 = new PatientQuestion();
                q6.ID = 59;
                q6.Answer.Add(new PatientAnswer() { ID = 145, Value = rdoColesevelamYes.Checked ? "1" : "0" });

                PatientQuestion q7 = new PatientQuestion();
                q7.ID = 60;
                q7.Answer.Add(new PatientAnswer() { ID = 146, Value = rdoColesevelamNo.Checked ? "1" : "0" });

                PatientQuestion q8 = new PatientQuestion();
                q8.ID = 61;
                q8.Answer.Add(new PatientAnswer() { ID = 147, Value = ddAddColesevelam.SelectedItem.Text });


                PatientQuestion q9 = new PatientQuestion();
                q9.ID = 62;
                q9.Answer.Add(new PatientAnswer() { ID = 148, Value = rdoColesevelamPatientRefusal.Checked ? "1" : "0" });

                PatientQuestion q10 = new PatientQuestion();
                q10.ID = 63;
                q10.Answer.Add(new PatientAnswer() { ID = 149, Value = rdoColesevelamPatientAfford.Checked ? "1" : "0" });

                PatientQuestion q11 = new PatientQuestion();
                q11.ID = 64;
                q11.Answer.Add(new PatientAnswer() { ID = 150, Value = rdoColesevelamDrugAdmin.Checked ? "1" : "0" });

                PatientQuestion q12 = new PatientQuestion();
                q12.ID = 65;
                q12.Answer.Add(new PatientAnswer() { ID = 151, Value = rdoColesevelamPatientRX.Checked ? "1" : "0" });

                PatientQuestion q13 = new PatientQuestion();
                q13.ID = 66;
                q13.Answer.Add(new PatientAnswer() { ID = 152, Value = rdoEzetimibeYes.Checked ? "1" : "0" });


                PatientQuestion q14 = new PatientQuestion();
                q14.ID = 67;
                q14.Answer.Add(new PatientAnswer() { ID = 153, Value = rdoEzetimibeNo.Checked ? "1" : "0" });


                PatientQuestion q15 = new PatientQuestion();
                q15.ID = 68;
                q15.Answer.Add(new PatientAnswer() { ID = 154, Value = rdoEzetimibePatientRefusal.Checked ? "1" : "0" });

                PatientQuestion q16 = new PatientQuestion();
                q16.ID = 69;
                q16.Answer.Add(new PatientAnswer() { ID = 155, Value = rdoEzetimibePatientAfford.Checked ? "1" : "0" });

                PatientQuestion q17 = new PatientQuestion();
                q17.ID = 70;
                q17.Answer.Add(new PatientAnswer() { ID = 156, Value = rdoEzetimibeDrugAdmin.Checked ? "1" : "0" });

                PatientQuestion q18 = new PatientQuestion();
                q18.ID = 71;
                q18.Answer.Add(new PatientAnswer() { ID = 157, Value = rdoEzetimibePatientRX.Checked ? "1" : "0" });


                PatientQuestion q19 = new PatientQuestion();
                q19.ID = 72;
                q19.Answer.Add(new PatientAnswer() { ID = 158, Value = rdoFibrateYes.Checked ? "1" : "0" });


                //What is your A1C target for this patient?
                PatientQuestion q20 = new PatientQuestion();
                q20.ID = 73;
                q20.Answer.Add(new PatientAnswer() { ID = 159, Value = rdoFibrateNo.Checked ? "1" : "0" });

                PatientQuestion q21 = new PatientQuestion();
                q21.ID = 74;
                q21.Answer.Add(new PatientAnswer() { ID = 160, Value = rdoFibratePatientAppr.Checked ? "1" : "0" });

                PatientQuestion q22 = new PatientQuestion();
                q22.ID = 75;
                q22.Answer.Add(new PatientAnswer() { ID = 161, Value = rdoFibratePatientTG.Checked ? "1" : "0" });

                PatientQuestion q23 = new PatientQuestion();
                q23.ID = 76;
                q23.Answer.Add(new PatientAnswer() { ID = 162, Value = rdoFibrateDisagreeRecom.Checked ? "1" : "0" });

                PatientQuestion q24 = new PatientQuestion();
                q24.ID = 77;
                q24.Answer.Add(new PatientAnswer() { ID = 163, Value = rdoFibrateMedicalConstraints.Checked ? "1" : "0" });

                PatientQuestion q25 = new PatientQuestion();
                q25.ID = 78;
                q25.Answer.Add(new PatientAnswer() { ID = 164, Value = rdoFibrateCoverage.Checked ? "1" : "0" });

                PatientQuestion q26 = new PatientQuestion();
                q26.ID = 79;
                q26.Answer.Add(new PatientAnswer() { ID = 165, Value = rdoNiacinYes.Checked ? "1" : "0" });

                PatientQuestion q27 = new PatientQuestion();
                q27.ID = 80;
                q27.Answer.Add(new PatientAnswer() { ID = 166, Value = rdoNiacinNo.Checked ? "1" : "0" });

                //additional questions
                PatientQuestion q28 = new PatientQuestion();
                q28.ID = 81;
                q28.Answer.Add(new PatientAnswer() { ID = 167, Value = rdoNiacinPatientAppr.Checked ? "1" : "0" });

                PatientQuestion q29 = new PatientQuestion();
                q29.ID = 82;
                q29.Answer.Add(new PatientAnswer() { ID = 168, Value = rdoNiacinPatientDisagree.Checked ? "1" : "0" });

                PatientQuestion q30 = new PatientQuestion();
                q30.ID = 83;
                q30.Answer.Add(new PatientAnswer() { ID = 169, Value = rdoNiacinMedical.Checked ? "1" : "0" });

                PatientQuestion q31 = new PatientQuestion();
                q31.ID = 84;
                q31.Answer.Add(new PatientAnswer() { ID = 170, Value = rdoNiacinReimbursement.Checked ? "1" : "0" });

                PatientQuestion q32 = new PatientQuestion();
                q32.ID = 85;
                q32.Answer.Add(new PatientAnswer() { ID = 171, Value = rdoNoChangePatientAchieved.Checked ? "1" : "0" });

                PatientQuestion q33 = new PatientQuestion();
                q33.ID = 86;
                q33.Answer.Add(new PatientAnswer() { ID = 172, Value = rdoNoChangeLifeStyle.Checked ? "1" : "0" });

                PatientQuestion q34 = new PatientQuestion();
                q34.ID = 87;
                q34.Answer.Add(new PatientAnswer() { ID = 173, Value = rdoNoChangeNeedTime.Checked ? "1" : "0" });

                PatientQuestion q35 = new PatientQuestion();
                q35.ID = 88;
                q35.Answer.Add(new PatientAnswer() { ID = 174, Value = rdoNoChangeStatin.Checked ? "1" : "0" });

                PatientQuestion q36 = new PatientQuestion();
                q36.ID = 89;
                q36.Answer.Add(new PatientAnswer() { ID = 175, Value = rdoNoChangeNewTherapy.Checked ? "1" : "0" });

                PatientQuestion q37 = new PatientQuestion();
                q37.ID = 90;
                q37.Answer.Add(new PatientAnswer() { ID = 176, Value = this.rdoNoChangePatientAppro.Checked ? "1" : "0" });

                PatientQuestion q38 = new PatientQuestion();
                q38.ID = 91;
                q38.Answer.Add(new PatientAnswer() { ID = 177, Value = this.rdoNoChangeRiskAssesment.Checked ? "1" : "0" });

                PatientQuestion q39 = new PatientQuestion();
                q39.ID = 92;
                q39.Answer.Add(new PatientAnswer() { ID = 178, Value = this.rdoNoChangeDisagreeRecom.Checked ? "1" : "0" });

                PatientQuestion q40 = new PatientQuestion();
                q40.ID = 93;
                q40.Answer.Add(new PatientAnswer() { ID = 179, Value = this.rdoNoChangePatientRefusal.Checked ? "1" : "0" });

                PatientQuestion q41 = new PatientQuestion();
                q41.ID = 94;
                q41.Answer.Add(new PatientAnswer() { ID = 180, Value = this.rdoNoChangeMedicalConstraints.Checked ? "1" : "0" });

                PatientQuestion q42 = new PatientQuestion();
                q42.ID = 95;
                q42.Answer.Add(new PatientAnswer() { ID = 181, Value = this.rdoNoChangePatientAge.Checked ? "1" : "0" });

                PatientQuestion q43 = new PatientQuestion();
                q43.ID = 96;
                q43.Answer.Add(new PatientAnswer() { ID = 182, Value = this.rdoNoChangeReimbursement.Checked ? "1" : "0" });


                PatientQuestion q44 = new PatientQuestion();
                q44.ID = 124;
                q44.Answer.Add(new PatientAnswer() { ID = 215, Value = this.txtBaselineLDLC.Text });


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
                lstAnswers.Add(q34);
                lstAnswers.Add(q35);
                lstAnswers.Add(q36);
                lstAnswers.Add(q37);
                lstAnswers.Add(q38);
                lstAnswers.Add(q39);
                lstAnswers.Add(q40);
                lstAnswers.Add(q41);
                lstAnswers.Add(q42);
                lstAnswers.Add(q43);
                lstAnswers.Add(q44);

                visRepos.SaveVisit1Screen5(patientID, lstAnswers);


                #endregion
            }
            else
                if (pageNum == 2)
                {

                    #region Saving data

                    PatientQuestion q1 = new PatientQuestion();
                    q1.ID = 97;
                    q1.Answer.Add(new PatientAnswer() { ID = 183, Value = chkGlucosidase.Checked ? "1" : "0" });

                    PatientQuestion q2 = new PatientQuestion();
                    q2.ID = 98;
                    q2.Answer.Add(new PatientAnswer() { ID = 184, Value = chkDPP4Inhibitor.Checked ? "1" : "0" });

                    PatientQuestion q3 = new PatientQuestion();
                    q3.ID = 99;
                    q3.Answer.Add(new PatientAnswer() { ID = 185, Value = chkReceptorAgonist.Checked ? "1" : "0" });

                    PatientQuestion q4 = new PatientQuestion();
                    q4.ID = 100;
                    q4.Answer.Add(new PatientAnswer() { ID = 186, Value = chkInsulin.Checked ? "1" : "0" });

                    PatientQuestion q5 = new PatientQuestion();
                    q5.ID = 101;
                    q5.Answer.Add(new PatientAnswer() { ID = 187, Value = chkMeglitinide.Checked ? "1" : "0" });

                    PatientQuestion q6 = new PatientQuestion();
                    q6.ID = 102;
                    q6.Answer.Add(new PatientAnswer() { ID = 188, Value = chkSGLT2Inhibitor.Checked ? "1" : "0" });

                    PatientQuestion q7 = new PatientQuestion();
                    q7.ID = 103;
                    q7.Answer.Add(new PatientAnswer() { ID = 189, Value = chkSulfonylurea.Checked ? "1" : "0" });

                    PatientQuestion q8 = new PatientQuestion();
                    q8.ID = 104;
                    q8.Answer.Add(new PatientAnswer() { ID = 190, Value = chkThiazolidinedione.Checked ? "1" : "0" });

                    PatientQuestion q9 = new PatientQuestion();
                    q9.ID = 105;
                    q9.Answer.Add(new PatientAnswer() { ID = 191, Value = chkNoChangeMgmt.Checked ? "1" : "0" });

                    PatientQuestion q10 = new PatientQuestion();
                    q10.ID = 106;
                    q10.Answer.Add(new PatientAnswer() { ID = 192, Value = rdoAddTherapyYes.Checked ? "1" : "0" });

                    PatientQuestion q11 = new PatientQuestion();
                    q11.ID = 107;
                    q11.Answer.Add(new PatientAnswer() { ID = 193, Value = rdoAddTherapyNo.Checked ? "1" : "0" });

                    PatientQuestion q12 = new PatientQuestion();
                    q12.ID = 108;
                    q12.Answer.Add(new PatientAnswer() { ID = 194, Value = rdoAddSecPatientRefusal.Checked ? "1" : "0" });

                    PatientQuestion q13 = new PatientQuestion();
                    q13.ID = 109;
                    q13.Answer.Add(new PatientAnswer() { ID = 195, Value = rdoAddSecInsurance.Checked ? "1" : "0" });

                    PatientQuestion q14 = new PatientQuestion();
                    q14.ID = 110;
                    q14.Answer.Add(new PatientAnswer() { ID = 196, Value = rdoAddSecAdmin.Checked ? "1" : "0" });


                    PatientQuestion q15 = new PatientQuestion();
                    q15.ID = 111;
                    q15.Answer.Add(new PatientAnswer() { ID = 197, Value = rdoAddSecRX.Checked ? "1" : "0" });

                    PatientQuestion q16 = new PatientQuestion();
                    q16.ID = 112;
                    q16.Answer.Add(new PatientAnswer() { ID = 198, Value = rdoAddTherapySecNoReinforce.Checked ? "1" : "0" });

                    PatientQuestion q17 = new PatientQuestion();
                    q17.ID = 113;
                    q17.Answer.Add(new PatientAnswer() { ID = 199, Value = rdoAddTherapySecNoEvaluate.Checked ? "1" : "0" });

                    PatientQuestion q18 = new PatientQuestion();
                    q18.ID = 114;
                    q18.Answer.Add(new PatientAnswer() { ID = 200, Value = rdoAddTherapySecNoTitrated.Checked ? "1" : "0" });

                    PatientQuestion q19 = new PatientQuestion();
                    q19.ID = 115;
                    q19.Answer.Add(new PatientAnswer() { ID = 201, Value = rdoAddTherapySecNoColesevelam.Checked ? "1" : "0" });

                    PatientQuestion q20 = new PatientQuestion();
                    q20.ID = 116;
                    q20.Answer.Add(new PatientAnswer() { ID = 202, Value = rdoAddTherapySecNoNewTherapy.Checked ? "1" : "0" });

                    PatientQuestion q21 = new PatientQuestion();
                    q21.ID = 117;
                    q21.Answer.Add(new PatientAnswer() { ID = 203, Value = rdoAddTherapySecNoCurrMed.Checked ? "1" : "0" });

                    PatientQuestion q22 = new PatientQuestion();
                    q22.ID = 118;
                    q22.Answer.Add(new PatientAnswer() { ID = 204, Value = rdoAddTherapySecNoRiskAsses.Checked ? "1" : "0" });

                    PatientQuestion q23 = new PatientQuestion();
                    q23.ID = 119;
                    q23.Answer.Add(new PatientAnswer() { ID = 205, Value = rdoAddTherapySecNoRecommend.Checked ? "1" : "0" });

                    PatientQuestion q24 = new PatientQuestion();
                    q24.ID = 120;
                    q24.Answer.Add(new PatientAnswer() { ID = 206, Value = rdoAddTherapySecNoRefusal.Checked ? "1" : "0" });

                    PatientQuestion q25 = new PatientQuestion();
                    q25.ID = 121;
                    q25.Answer.Add(new PatientAnswer() { ID = 207, Value = rdoAddTherapySecNoConstraints.Checked ? "1" : "0" });

                    PatientQuestion q26 = new PatientQuestion();
                    q26.ID = 122;
                    q26.Answer.Add(new PatientAnswer() { ID = 208, Value = rdoAddTherapySecNoAge.Checked ? "1" : "0" });

                    PatientQuestion q27 = new PatientQuestion();
                    q27.ID = 123;
                    q27.Answer.Add(new PatientAnswer() { ID = 209, Value = rdoAddTherapySecNoDiff.Checked ? "1" : "0" });


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

                    visRepos.SaveVisit1Screen6(patientID, lstAnswers);

                    #endregion
                }
        }

        private void Redirect()
        {
            if (isReadonly)
            {
                //string url = string.Format("~/Portal/Visit1/Page6.aspx?{0}={1}&{2}={3}&{4}={5}",
                //   Constants.PATIENTID,
                //   patientID.ToString(),
                //   Constants.READONLY,
                //   isReadonly ? "1" : "0",
                //   Constants.PATIENTNUM,
                //   this.lblPatientNum.Text
                //   );

                string url = "~/Portal/Patients.aspx";

                Response.Redirect(url);
            }

            else
            {
                if (Page.IsValid)
                {
                    //SaveData(pageNum);

                    if (updateScreen)
                        visRepos.UpdateVisitScreen(1, 6, patientID);

                    string url = string.Format("~/Portal/Visit1/Page6.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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

        #region Event Handlers

        protected void imgPrevStep_clicked(object sender, EventArgs e)
        {

            if (this.wiz.ActiveStepIndex == 0)
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

                this.wiz.ActiveStepIndex = this.wiz.ActiveStepIndex - 1;
            }

            if (this.wiz.ActiveStepIndex == 2)
            {
                LoadData();
                //AdvanceWizard();
            }

            Helper.Utility.FocusControlOnPageLoad(this.pnlCustVal.ClientID, this.Page);
        }

        protected void imgNextStep_clicked(object sender, EventArgs e)
        {
           
            
            string script = string.Empty;

            string mainScript = string.Empty;

            bool argsValid = false;

            if (this.wiz.ActiveStepIndex == 1)
            {
                LoadData();
                AdvanceWizard();
            }
            else
                if (this.wiz.ActiveStepIndex == 2)
                {

                    if (
                          !chkColesevelam.Checked &&
                          !chkEzetimibe.Checked &&
                          !chkFibrate.Checked &&
                          !chkNiacin.Checked &&
                          !chkNoChange.Checked
                        )
                    {
                        lblMainSelRequired.Visible = true;

                    }
                    else
                        if (this.chkColesevelam.Checked)
                        {
                            mainScript = "ShowHideDivs(0);";

                            this.divColesevelam.Visible = true;

                            if (!rdoColesevelamYes.Checked && !rdoColesevelamNo.Checked)
                            {
                                lblColesevelamRdo.Visible = true;

                                script = string.Format("$('#{0}').show();", lblColesevelamRdo.ClientID);

                            }
                            else
                                if (rdoColesevelamYes.Checked)
                                {

                                    if (this.ddAddColesevelam.SelectedValue == Helper.Constants.NOID.ToString())
                                    {
                                        script = string.Format("$('#{0}').show();", lblddAddColesevelam.ClientID);

                                        this.lblddAddColesevelam.Visible = true;
                                    }
                                    else
                                    {
                                        argsValid = true;
                                    }

                                }
                                else
                                    if (rdoColesevelamNo.Checked)
                                    {

                                        if (
                                             !rdoColesevelamPatientRefusal.Checked &&
                                             !rdoColesevelamPatientAfford.Checked &&
                                             !rdoColesevelamDrugAdmin.Checked &&
                                             !rdoColesevelamPatientRX.Checked
                                            )
                                        {

                                            script = string.Format("$('#{0}').show();", lbldivrdoColesevelamNo.ClientID);

                                            lbldivrdoColesevelamNo.Visible = true;
                                        }
                                        else
                                        {
                                            argsValid = true;
                                        }
                                    }

                        }
                        else
                            if (this.chkEzetimibe.Checked)
                            {
                                mainScript = "ShowHideDivs(1);";

                                if (!this.rdoEzetimibeYes.Checked && !rdoEzetimibeNo.Checked)
                                {
                                    this.lblrdoEzetimibe.Visible = true;

                                    script = string.Format("$('#{0}').show();", lblrdoEzetimibe.ClientID);

                                }
                                else
                                    if (this.rdoEzetimibeYes.Checked)
                                    {
                                        argsValid = true;

                                    }
                                    else
                                        if (this.rdoEzetimibeNo.Checked)
                                        {
                                            if (
                                                       !rdoEzetimibePatientRefusal.Checked &&
                                                       !rdoEzetimibePatientAfford.Checked &&
                                                       !rdoEzetimibeDrugAdmin.Checked &&
                                                       !rdoEzetimibePatientRX.Checked
                                                      )
                                            {

                                                script = string.Format("$('#{0}').show();", lblEzetimibeNo.ClientID);

                                                lblEzetimibeNo.Visible = true;
                                            }
                                            else
                                            {
                                                argsValid = true;
                                            }
                                        }

                            }

                            else
                                if (this.chkFibrate.Checked)
                                {
                                    mainScript = "ShowHideDivs(2);";

                                    if (!this.rdoFibrateYes.Checked && !rdoFibrateNo.Checked)
                                    {
                                        this.lblFibrateRdoSelReq.Visible = true;

                                        script = string.Format("$('#{0}').show();", lblFibrateRdoSelReq.ClientID);

                                    }
                                    else


                                        if (
                                                   !rdoFibratePatientAppr.Checked &&
                                                   !rdoFibratePatientTG.Checked &&
                                                   !rdoFibrateDisagreeRecom.Checked &&
                                                   !rdoFibrateMedicalConstraints.Checked &&
                                                   !rdoFibrateCoverage.Checked
                                             )
                                        {

                                            script = string.Format("$('#{0}').show();", this.lblFibrateRdoLst.ClientID);

                                            lblFibrateRdoLst.Visible = true;
                                        }
                                        else
                                        {
                                            argsValid = true;
                                        }

                                }
                                else
                                    if (this.chkNiacin.Checked)
                                    {
                                        mainScript = "ShowHideDivs(3);";

                                        if (!this.rdoNiacinYes.Checked && !rdoNiacinNo.Checked)
                                        {
                                            this.lblNiacinRdo.Visible = true;

                                            script = string.Format("$('#{0}').show();", lblNiacinRdo.ClientID);

                                        }
                                        else


                                            if (
                                                       !rdoNiacinPatientAppr.Checked &&
                                                       !rdoNiacinPatientDisagree.Checked &&
                                                       !rdoNiacinMedical.Checked &&
                                                       !rdoNiacinReimbursement.Checked

                                                 )
                                            {

                                                script = string.Format("$('#{0}').show();", this.lblNiacinRdoLst.ClientID);

                                                lblNiacinRdoLst.Visible = true;
                                            }
                                            else
                                            {
                                                argsValid = true;
                                            }

                                    }
                                    else
                                        if (this.chkNoChange.Checked)
                                        {

                                            mainScript = "ShowHideDivs(4);";

                                            if (
                                                      !rdoNoChangePatientAchieved.Checked &&
                                                      !rdoNoChangeLifeStyle.Checked &&
                                                      !rdoNoChangeNeedTime.Checked &&
                                                      !rdoNoChangeStatin.Checked &&
                                                      !rdoNoChangeNewTherapy.Checked &&
                                                      !rdoNoChangePatientAppro.Checked &&
                                                      !rdoNoChangeRiskAssesment.Checked &&
                                                      !rdoNoChangeDisagreeRecom.Checked &&
                                                      !rdoNoChangePatientRefusal.Checked &&
                                                      !rdoNoChangeMedicalConstraints.Checked &&
                                                      !rdoNoChangePatientAge.Checked &&
                                                      !rdoNoChangeReimbursement.Checked

                                                )
                                            {

                                                script = string.Format("$('#{0}').show();", lblNoChange.ClientID);

                                                lblNoChange.Visible = true;
                                            }
                                            else
                                                if (
                                                        rdoNoChangePatientAchieved.Checked &&
                                                        string.IsNullOrEmpty(this.txtBaselineLDLC.Text)
                                                    )
                                                {
                                                    script = string.Format("$('#{0}').show();", lblNoChange.ClientID);

                                                    lblBaseLineLDLC.Visible = true;

                                                }

                                                else
                                                {
                                                    argsValid = true;
                                                }

                                        }



                    if (argsValid)
                    {
                        if (!this.isReadonly)

                            SaveData(1);

                        this.AdvanceWizard();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(

                                                              Page,
                                                              typeof(Page),
                                                              "ShowHideScript",
                                                              mainScript + script,
                                                               true
                                                          );
                    }
                }

                else
                    if (this.wiz.ActiveStepIndex == 3)
                    {
                        this.LoadDataLastPage();

                        AdvanceWizard();
                    }

                    else
                        if (this.wiz.ActiveStepIndex == 4)
                        {

                            mainScript = "ShowHideSecDivs();";

                            if (
                             !chkGlucosidase.Checked &&
                             !chkDPP4Inhibitor.Checked &&
                             !chkReceptorAgonist.Checked &&
                             !chkInsulin.Checked &&
                             !chkMeglitinide.Checked &&
                             !chkSGLT2Inhibitor.Checked &&
                             !chkSulfonylurea.Checked &&
                             !chkThiazolidinedione.Checked &&
                             !chkNoChangeMgmt.Checked
                           )
                            {
                                this.lblSecPageSelRequired.Visible = true;
                            }
                            else

                                if (chkNoChangeMgmt.Checked)
                                {
                                    if (
                                        !rdoAddTherapySecNoReinforce.Checked &&
                                        !rdoAddTherapySecNoEvaluate.Checked &&
                                        !rdoAddTherapySecNoTitrated.Checked &&
                                        !rdoAddTherapySecNoColesevelam.Checked &&
                                        !rdoAddTherapySecNoNewTherapy.Checked &&
                                        !rdoAddTherapySecNoCurrMed.Checked &&
                                        !rdoAddTherapySecNoRiskAsses.Checked &&
                                        !rdoAddTherapySecNoRecommend.Checked &&
                                        !rdoAddTherapySecNoRefusal.Checked &&
                                        !rdoAddTherapySecNoConstraints.Checked &&
                                        !rdoAddTherapySecNoAge.Checked &&
                                        !rdoAddTherapySecNoDiff.Checked
                                       )
                                    {
                                        script = string.Format("$('#{0}').show();", lblNoChangesManagement.ClientID);

                                        this.lblNoChangesManagement.Visible = true;

                                    }
                                    else
                                        argsValid = true;

                                }
                                else

                                    if (!rdoAddTherapyYes.Checked && !rdoAddTherapyNo.Checked)
                                    {
                                        lblAddTherapyRdo.Visible = true;

                                        script = string.Format("$('#{0}').show();", lblAddTherapyRdo.ClientID);

                                    }
                                    else
                                        if (rdoAddTherapyNo.Checked)
                                        {

                                            if (
                                                   !rdoAddSecPatientRefusal.Checked &&
                                                   !rdoAddSecInsurance.Checked &&
                                                   !rdoAddSecAdmin.Checked &&
                                                   !rdoAddSecRX.Checked
                                                )
                                            {
                                                script = string.Format("$('#{0}').show();", lblrdoAddSec.ClientID);

                                                this.lblrdoAddSec.Visible = true;

                                            }
                                            else
                                                argsValid = true;

                                        }
                                        else
                                            argsValid = true;


                            if (argsValid)
                            {
                                if (!this.isReadonly)

                                    SaveData(2);

                                Redirect();
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(

                                                                      Page,
                                                                      typeof(Page),
                                                                      "ShowHideScript",
                                                                      mainScript + script,
                                                                       true
                                                                  );
                            }

                        }
                        else
                        {
                            AdvanceWizard();

                        }

            
        }

        protected void imgBack_clicked(object sender, EventArgs e)
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

        #endregion
    }
}