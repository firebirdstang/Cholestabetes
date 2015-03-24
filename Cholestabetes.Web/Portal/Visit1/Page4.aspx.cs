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
    public partial class Page4 : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                LoadData();
            }

            InitializeControls();

        }

        #region Methods

        private bool IsSelected(string item)
        {
            bool retVal = false;

            List<string> lst = new List<string>()
            {
                "Select one",
                "Select Total Daily Dosage",
                "Select daily Frequency",
                "Number of Injections"
            };

            if (!lst.Contains(item))
                retVal = true;

            return retVal;
        }

        private string IsValidItem(string item)
        {
            string retStr = string.Empty;

            List<string> lst = new List<string>()
            {
                "Select one",
                "Select Total Daily Dosage",
                "Select daily Frequency",
                "Number of Injections"
            };

            if (!lst.Contains(item))
                retStr = item;

            return retStr;
        }

        private void SelectStatinTherapy(string id)
        {
            List<RadioButton> lst = new List<RadioButton>()
            {
                rdoStatinAtorvastatin20,
                rdoStatinAtorvastatin40,
                rdoStatinAtorvastatin80,
                rdoStatinSimvastatin40,
                rdoStatinRosuvastatin10,
                rdoStatinRosuvastatin20 
            };

            foreach (var item in lst)
            {
                if (item.Attributes["AnswerID"].ToString() == id)
                {
                    item.Checked = true;
                    break;
                }
            }

        }

        private void SelectMetforminTherapy(string id)
        {
            List<RadioButton> lst = new List<RadioButton>()
            {
                //rdoMetformin_None,
                rdoMetformin_Metformin,
                rdoMetformin_Glumetza,
                rdoMetformin_Linagliptin,
                rdoMetformin_Saxagliptin,
                rdoMetformin_Sitagliptin, 
                rdoMetformin_SitagliptinExt
            };

            foreach (var item in lst)
            {
                if (item.Attributes["AnswerID"].ToString() == id)
                {
                    item.Checked = true;
                    break;
                }
            }

        }

        private void LoadData()
        {
            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen4(patientID);


            //string choles = txtTotalCholesterol.Text + "." + txtTotalCholesterol2.Text;
            //string LDL_C = txtLDL_C1.Text + "." + this.txtLDL_C2.Text;
            //string HDL_C = txtHDLC1.Text + "." + this.txtHDLC2.Text;
            //string nonHDLC = txtNonHDLC1.Text + "." + txtNonHDLC2.Text;
            //string Triglycerides = txtTriglycerides1.Text + "." + txtTriglycerides2.Text;


            if (lst != null && lst.Count > 0)
            {
                this.ddLDLC.SelectedValue = lst[0].Answer[0].ID.ToString();
                this.txtMostRecentLipidLabDate.Text = lst[1].Answer[0].Value;

                string cholest = lst[2].Answer[0].Value.ToString();
                txtTotalCholesterol.Text = cholest;
                //txtTotalCholesterol.Text = cholest.Split(".".ToCharArray())[0];
                //txtTotalCholesterol2.Text = cholest.Split(".".ToCharArray())[1];


                string LDLc = lst[3].Answer[0].Value.ToString();
                txtLDL_C1.Text = LDLc;
                //txtLDL_C1.Text = LDLc.Split(".".ToCharArray())[0];
                //txtLDL_C2.Text = LDLc.Split(".".ToCharArray())[1];

                string HDLc = lst[4].Answer[0].Value.ToString();
                txtHDLC1.Text = HDLc;
                //txtHDLC1.Text = HDLc.Split(".".ToCharArray())[0];
                //txtHDLC2.Text = HDLc.Split(".".ToCharArray())[1];

                string nonHDLc = lst[5].Answer[0].Value.ToString();
                txtNonHDLC1.Text = nonHDLc;
                //txtNonHDLC1.Text = nonHDLc.Split(".".ToCharArray())[0];
                //txtNonHDLC2.Text = nonHDLc.Split(".".ToCharArray())[1];

                string triglycerides = lst[6].Answer[0].Value.ToString();
                txtTriglycerides1.Text = triglycerides;
                //txtTriglycerides1.Text = triglycerides.Split(".".ToCharArray())[0];
                //txtTriglycerides2.Text = triglycerides.Split(".".ToCharArray())[1];

                SelectStatinTherapy(lst[7].Answer[0].ID.ToString());

                chkLipidBileAcidSequestrant.Checked = lst[8].Answer[0].Value.ToString() == "1";
                chkLipidEzetimibe.Checked = lst[9].Answer[0].Value.ToString() == "1";
                chkLipidFibrate.Checked = lst[10].Answer[0].Value.ToString() == "1";
                chkLipidNiacin.Checked = lst[11].Answer[0].Value.ToString() == "1";
                chkLipidOmega.Checked = lst[12].Answer[0].Value.ToString() == "1";
                chkLipidNone.Checked = lst[13].Answer[0].Value.ToString() == "1";

                this.ddDiabetesDuration.SelectedValue = lst[14].Answer[0].Value.ToString();

                this.ddACITarget.SelectedValue = lst[15].Answer[0].ID.ToString();

                this.txtRecentA1CLabDate.Text = lst[16].Answer[0].Value.ToString();

                string A1c = lst[17].Answer[0].Value.ToString();
                txtAIC1.Text = A1c;
                //txtAIC1.Text = A1c.Split(".".ToCharArray())[0];
                //txtAIC2.Text = A1c.Split(".".ToCharArray())[1];

                string glucose = lst[18].Answer[0].Value.ToString();
                txtFastingPlasmaGlucose1.Text = glucose;
                //txtFastingPlasmaGlucose1.Text = glucose.Split(".".ToCharArray())[0];
                //txtFastingPlasmaGlucose2.Text = glucose.Split(".".ToCharArray())[1];

                SelectMetforminTherapy(lst[19].Answer[0].ID.ToString());

                chk_Antihyperglycemic_Glucosidase.Checked = lst[20].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_DPP4.Checked = lst[21].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_GLP1.Checked = lst[22].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_Insulin.Checked = lst[23].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_Meglitinide.Checked = lst[24].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_SGLT2.Checked = lst[25].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_Sulfonylurea.Checked = lst[26].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_Thiazolidinedione.Checked = lst[27].Answer[0].Value.ToString() == "1";
                chk_Antihyperglycemic_None.Checked = lst[28].Answer[0].Value.ToString() == "1";

                ddBileAcidSequestrant.SelectedValue = lst[29].Answer[0].Value.ToString();

                ddDailyDoseMetformin.SelectedValue = lst[30].Answer[0].Value.ToString();
                ddDailyFreqMetformin.SelectedValue = lst[31].Answer[0].Value.ToString();

                ddDailyDoseGlumetza.SelectedValue = lst[32].Answer[0].Value.ToString();

                ddDailyDoseLinagliptin.SelectedValue = lst[33].Answer[0].Value.ToString();

                ddDailyDoseSaxagliptin.SelectedValue = lst[34].Answer[0].Value.ToString();

                ddDailyDoseSitagliptin.SelectedValue = lst[35].Answer[0].Value.ToString();

                ddDailyDoseSitagliptinExt.SelectedValue = lst[36].Answer[0].Value.ToString();

                ddNumInjections.SelectedValue = lst[37].Answer[0].Value.ToString();

                this.txtLDLCareGap.Text = lst[38].Answer[0].Value.ToString();

                chkLimitLife.Checked = lst[39].Answer[0].Value.ToString() == "1";
                chkHighFunc.Checked = lst[40].Answer[0].Value.ToString() == "1";
                chkIschemic.Checked = lst[41].Answer[0].Value.ToString() == "1";
                chkMultiMorbid.Checked = lst[42].Answer[0].Value.ToString() == "1";
                chkRecuGlycemia.Checked = lst[43].Answer[0].Value.ToString() == "1";
                chkHypoglycemiaAwareness.Checked = lst[44].Answer[0].Value.ToString() == "1";
                chkLongDia.Checked = lst[45].Answer[0].Value.ToString() == "1";
                chkClinicalJudge.Checked = lst[46].Answer[0].Value.ToString() == "1";
                chkNone.Checked = lst[47].Answer[0].Value.ToString() == "1";

                //chkLipidNone.Checked = lst[46].Answer[0].Value.ToString() == "1";
                
            }
        }

        private int GetSelectedStatinTherapyVal()
        {
            int retVal = 128; //for 'NONE'

            if (rdoStatinAtorvastatin20.Checked)
                retVal = Int32.Parse(rdoStatinAtorvastatin20.Attributes["AnswerID"].ToString());
            else
                if (rdoStatinAtorvastatin40.Checked)
                    retVal = Int32.Parse(rdoStatinAtorvastatin40.Attributes["AnswerID"].ToString());
                else
                    if (rdoStatinAtorvastatin80.Checked)
                        retVal = Int32.Parse(rdoStatinAtorvastatin80.Attributes["AnswerID"].ToString());
                    else
                        if (rdoStatinSimvastatin40.Checked)
                            retVal = Int32.Parse(rdoStatinSimvastatin40.Attributes["AnswerID"].ToString());
                        else
                            if (rdoStatinRosuvastatin10.Checked)
                                retVal = Int32.Parse(rdoStatinRosuvastatin10.Attributes["AnswerID"].ToString());
                            else
                                if (rdoStatinRosuvastatin20.Checked)
                                    retVal = Int32.Parse(rdoStatinRosuvastatin20.Attributes["AnswerID"].ToString());

            return retVal;

        }

        private string GetSelectedStatinTherapyText()
        {
            string retVal = string.Empty; //for 'NONE'

            if (rdoStatinAtorvastatin20.Checked)
                retVal = (rdoStatinAtorvastatin20.Attributes["TextStr"].ToString());
            else
                if (rdoStatinAtorvastatin40.Checked)
                    retVal = (rdoStatinAtorvastatin40.Attributes["TextStr"].ToString());
                else
                    if (rdoStatinAtorvastatin80.Checked)
                        retVal = (rdoStatinAtorvastatin80.Attributes["TextStr"].ToString());
                    else
                        if (rdoStatinSimvastatin40.Checked)
                            retVal = (rdoStatinSimvastatin40.Attributes["TextStr"].ToString());
                        else
                            if (rdoStatinRosuvastatin10.Checked)
                                retVal = (rdoStatinRosuvastatin10.Attributes["TextStr"].ToString());
                            else
                                if (rdoStatinRosuvastatin20.Checked)
                                    retVal = (rdoStatinRosuvastatin20.Attributes["TextStr"].ToString());


            return retVal;

        }

        private int GetMetforminTherapyValue()
        {

            int retVal = 129;

            //if (rdoMetformin_None.Checked)
            //    retVal = Int32.Parse(rdoMetformin_None.Attributes["AnswerID"].ToString());
            //else
            if (rdoMetformin_Metformin.Checked)
                retVal = Int32.Parse(rdoMetformin_Metformin.Attributes["AnswerID"].ToString());
            else
                if (rdoMetformin_Glumetza.Checked)
                    retVal = Int32.Parse(rdoMetformin_Glumetza.Attributes["AnswerID"].ToString());
                else
                    if (rdoMetformin_Linagliptin.Checked)
                        retVal = Int32.Parse(rdoMetformin_Linagliptin.Attributes["AnswerID"].ToString());
                    else
                        if (rdoMetformin_Saxagliptin.Checked)
                            retVal = Int32.Parse(rdoMetformin_Saxagliptin.Attributes["AnswerID"].ToString());
                        else
                            if (rdoMetformin_Sitagliptin.Checked)
                                retVal = Int32.Parse(rdoMetformin_Sitagliptin.Attributes["AnswerID"].ToString());
                            else
                                if (rdoMetformin_SitagliptinExt.Checked)
                                    retVal = Int32.Parse(rdoMetformin_SitagliptinExt.Attributes["AnswerID"].ToString());

            return retVal;
        }

        private string GetMetforminTherapyText()
        {

            string retVal = string.Empty;

            //if (rdoMetformin_None.Checked)
            //    retVal = Int32.Parse(rdoMetformin_None.Attributes["AnswerID"].ToString());
            //else
            if (rdoMetformin_Metformin.Checked)
                retVal = rdoMetformin_Metformin.Attributes["TextStr"].ToString();
            else
                if (rdoMetformin_Glumetza.Checked)
                    retVal = rdoMetformin_Glumetza.Attributes["TextStr"].ToString();
                else
                    if (rdoMetformin_Linagliptin.Checked)
                        retVal = rdoMetformin_Linagliptin.Attributes["TextStr"].ToString();
                    else
                        if (rdoMetformin_Saxagliptin.Checked)
                            retVal = rdoMetformin_Saxagliptin.Attributes["TextStr"].ToString();
                        else
                            if (rdoMetformin_Sitagliptin.Checked)
                                retVal = rdoMetformin_Sitagliptin.Attributes["TextStr"].ToString();
                            else
                                if (rdoMetformin_SitagliptinExt.Checked)
                                    retVal = rdoMetformin_SitagliptinExt.Attributes["TextStr"].ToString();

            return retVal;
        }

        private void SaveData()
        {

            List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

            //string choles = txtTotalCholesterol.Text + "." + (string.IsNullOrEmpty(txtTotalCholesterol2.Text) ? "0" : txtTotalCholesterol2.Text);
            //string LDL_C = txtLDL_C1.Text + "." + (string.IsNullOrEmpty(txtLDL_C2.Text) ? "0" : txtLDL_C2.Text);
            //string HDL_C = txtHDLC1.Text + "." + (string.IsNullOrEmpty(txtHDLC2.Text) ? "0" : txtHDLC2.Text);
            //string nonHDLC = txtNonHDLC1.Text + "." + (string.IsNullOrEmpty(txtNonHDLC2.Text) ? "0" : txtNonHDLC2.Text);
            //string Triglycerides = txtTriglycerides1.Text + "." + (string.IsNullOrEmpty(txtTriglycerides2.Text) ? "0" : txtTriglycerides2.Text);
            //string A1C = this.txtAIC1.Text + "." + (string.IsNullOrEmpty(txtAIC2.Text) ? "0" : txtAIC2.Text);
            //string glucose = txtFastingPlasmaGlucose1.Text + "." + (string.IsNullOrEmpty(txtFastingPlasmaGlucose2.Text) ? "0" : txtFastingPlasmaGlucose2.Text);

            string choles = txtTotalCholesterol.Text;
            string LDL_C = txtLDL_C1.Text;
            string HDL_C = txtHDLC1.Text;
            string nonHDLC = txtNonHDLC1.Text;
            string Triglycerides = txtTriglycerides1.Text;
            string A1C = this.txtAIC1.Text;
            string glucose = txtFastingPlasmaGlucose1.Text;

            PatientQuestion q1 = new PatientQuestion();
            q1.ID = 27;
            q1.Answer.Add(new PatientAnswer() { ID = Int32.Parse(this.ddLDLC.SelectedValue.ToString()), Value = (this.ddLDLC.SelectedItem.Text.ToString()) });

            PatientQuestion q2 = new PatientQuestion();
            q2.ID = 28;
            q2.Answer.Add(new PatientAnswer() { ID = 74, Value = txtMostRecentLipidLabDate.Text });

            PatientQuestion q3 = new PatientQuestion();
            q3.ID = 29;
            q3.Answer.Add(new PatientAnswer() { ID = 75, Value = choles });

            PatientQuestion q4 = new PatientQuestion();
            q4.ID = 30;
            q4.Answer.Add(new PatientAnswer() { ID = 76, Value = LDL_C });


            PatientQuestion q5 = new PatientQuestion();
            q5.ID = 31;
            q5.Answer.Add(new PatientAnswer() { ID = 77, Value = HDL_C });

            PatientQuestion q6 = new PatientQuestion();
            q6.ID = 32;
            q6.Answer.Add(new PatientAnswer() { ID = 78, Value = nonHDLC });

            PatientQuestion q7 = new PatientQuestion();
            q7.ID = 33;
            q7.Answer.Add(new PatientAnswer() { ID = 79, Value = Triglycerides });


            PatientQuestion q8 = new PatientQuestion();
            q8.ID = 34;
            q8.Answer.Add(new PatientAnswer() { ID = GetSelectedStatinTherapyVal(), Value = GetSelectedStatinTherapyText().ToString() });

            //Additional Lipid Lowering Therapy
            PatientQuestion q9 = new PatientQuestion();
            q9.ID = 35;
            q9.Answer.Add(new PatientAnswer() { ID = 86, Value = chkLipidBileAcidSequestrant.Checked ? "1" : "0" });

            PatientQuestion q10 = new PatientQuestion();
            q10.ID = 35;
            q10.Answer.Add(new PatientAnswer() { ID = 87, Value = chkLipidEzetimibe.Checked ? "1" : "0" });

            PatientQuestion q11 = new PatientQuestion();
            q11.ID = 35;
            q11.Answer.Add(new PatientAnswer() { ID = 88, Value = chkLipidFibrate.Checked ? "1" : "0" });

            PatientQuestion q12 = new PatientQuestion();
            q12.ID = 35;
            q12.Answer.Add(new PatientAnswer() { ID = 89, Value = chkLipidNiacin.Checked ? "1" : "0" });

            PatientQuestion q13 = new PatientQuestion();
            q13.ID = 35;
            q13.Answer.Add(new PatientAnswer() { ID = 90, Value = chkLipidOmega.Checked ? "1" : "0" });


            //PatientQuestion q14 = new PatientQuestion();
            //q14.ID = 36;
            //q14.Answer.Add(new PatientAnswer() { ID = Int32.Parse(this.ddDiabetesDuration.SelectedValue.ToString()) });

            PatientQuestion q14 = new PatientQuestion();
            q14.ID = 36;
            q14.Answer.Add(new PatientAnswer() { ID = 93, Value = this.ddDiabetesDuration.SelectedValue.ToString() });


            PatientQuestion q15 = new PatientQuestion();
            q15.ID = 37;
            q15.Answer.Add(new PatientAnswer() { ID = Int32.Parse(this.ddACITarget.SelectedValue.ToString()), Value = this.ddACITarget.SelectedItem.Text });

            PatientQuestion q16 = new PatientQuestion();
            q16.ID = 38;
            q16.Answer.Add(new PatientAnswer() { ID = 102, Value = this.txtRecentA1CLabDate.Text });

            PatientQuestion q17 = new PatientQuestion();
            q17.ID = 39;
            q17.Answer.Add(new PatientAnswer() { ID = 103, Value = A1C });

            PatientQuestion q18 = new PatientQuestion();
            q18.ID = 40;
            q18.Answer.Add(new PatientAnswer() { ID = 104, Value = glucose });


            PatientQuestion q19 = new PatientQuestion();
            q19.ID = 41;
            q19.Answer.Add(new PatientAnswer() { ID = GetMetforminTherapyValue(), Value = this.GetMetforminTherapyText() });


            //What is your A1C target for this patient?
            PatientQuestion q20 = new PatientQuestion();
            q20.ID = 42;
            q20.Answer.Add(new PatientAnswer() { ID = 111, Value = chk_Antihyperglycemic_Glucosidase.Checked ? "1" : "0" });

            PatientQuestion q21 = new PatientQuestion();
            q21.ID = 42;
            q21.Answer.Add(new PatientAnswer() { ID = 112, Value = chk_Antihyperglycemic_DPP4.Checked ? "1" : "0" });

            PatientQuestion q22 = new PatientQuestion();
            q22.ID = 42;
            q22.Answer.Add(new PatientAnswer() { ID = 113, Value = chk_Antihyperglycemic_GLP1.Checked ? "1" : "0" });

            PatientQuestion q23 = new PatientQuestion();
            q23.ID = 42;
            q23.Answer.Add(new PatientAnswer() { ID = 114, Value = chk_Antihyperglycemic_Insulin.Checked ? "1" : "0" });

            PatientQuestion q24 = new PatientQuestion();
            q24.ID = 42;
            q24.Answer.Add(new PatientAnswer() { ID = 115, Value = chk_Antihyperglycemic_Meglitinide.Checked ? "1" : "0" });

            PatientQuestion q25 = new PatientQuestion();
            q25.ID = 42;
            q25.Answer.Add(new PatientAnswer() { ID = 116, Value = chk_Antihyperglycemic_SGLT2.Checked ? "1" : "0" });

            PatientQuestion q26 = new PatientQuestion();
            q26.ID = 42;
            q26.Answer.Add(new PatientAnswer() { ID = 117, Value = chk_Antihyperglycemic_Sulfonylurea.Checked ? "1" : "0" });

            PatientQuestion q27 = new PatientQuestion();
            q27.ID = 42;
            q27.Answer.Add(new PatientAnswer() { ID = 118, Value = chk_Antihyperglycemic_Thiazolidinedione.Checked ? "1" : "0" });

            //additional questions
            PatientQuestion q28 = new PatientQuestion();
            q28.ID = 43;
            q28.Answer.Add(new PatientAnswer() { ID = 119, Value = ddBileAcidSequestrant.SelectedValue });

            PatientQuestion q29 = new PatientQuestion();
            q29.ID = 44;
            q29.Answer.Add(new PatientAnswer() { ID = 120, Value = ddDailyDoseMetformin.SelectedValue });

            PatientQuestion q30 = new PatientQuestion();
            q30.ID = 45;
            q30.Answer.Add(new PatientAnswer() { ID = 121, Value = ddDailyFreqMetformin.SelectedValue });

            PatientQuestion q31 = new PatientQuestion();
            q31.ID = 46;
            q31.Answer.Add(new PatientAnswer() { ID = 122, Value = ddDailyDoseGlumetza.SelectedValue });

            PatientQuestion q32 = new PatientQuestion();
            q32.ID = 47;
            q32.Answer.Add(new PatientAnswer() { ID = 123, Value = ddDailyDoseLinagliptin.SelectedValue });

            PatientQuestion q33 = new PatientQuestion();
            q33.ID = 48;
            q33.Answer.Add(new PatientAnswer() { ID = 124, Value = ddDailyDoseSaxagliptin.SelectedValue });

            PatientQuestion q34 = new PatientQuestion();
            q34.ID = 49;
            q34.Answer.Add(new PatientAnswer() { ID = 125, Value = ddDailyDoseSitagliptin.SelectedValue });

            PatientQuestion q35 = new PatientQuestion();
            q35.ID = 50;
            q35.Answer.Add(new PatientAnswer() { ID = 126, Value = ddDailyDoseSitagliptinExt.SelectedValue });

            PatientQuestion q36 = new PatientQuestion();
            q36.ID = 51;
            q36.Answer.Add(new PatientAnswer() { ID = 127, Value = ddNumInjections.SelectedValue });

            PatientQuestion q37 = new PatientQuestion();
            q37.ID = 52;
            q37.Answer.Add(new PatientAnswer() { ID = 130, Value = this.txtLDLCareGap.Text });



            PatientQuestion q38 = new PatientQuestion();
            q38.ID = 53;
            q38.Answer.Add(new PatientAnswer() { ID = 131, Value = this.chkLimitLife.Checked ? "1" : "0" });

            PatientQuestion q39 = new PatientQuestion();
            q39.ID = 53;
            q39.Answer.Add(new PatientAnswer() { ID = 132, Value = this.chkHighFunc.Checked ? "1" : "0" });

            PatientQuestion q40 = new PatientQuestion();
            q40.ID = 53;
            q40.Answer.Add(new PatientAnswer() { ID = 133, Value = this.chkIschemic.Checked ? "1" : "0" });

            PatientQuestion q41 = new PatientQuestion();
            q41.ID = 53;
            q41.Answer.Add(new PatientAnswer() { ID = 134, Value = this.chkMultiMorbid.Checked ? "1" : "0" });

            PatientQuestion q42 = new PatientQuestion();
            q42.ID = 53;
            q42.Answer.Add(new PatientAnswer() { ID = 135, Value = this.chkRecuGlycemia.Checked ? "1" : "0" });

            PatientQuestion q43 = new PatientQuestion();
            q43.ID = 53;
            q43.Answer.Add(new PatientAnswer() { ID = 136, Value = this.chkHypoglycemiaAwareness.Checked ? "1" : "0" });

            PatientQuestion q44 = new PatientQuestion();
            q44.ID = 53;
            q44.Answer.Add(new PatientAnswer() { ID = 137, Value = this.chkLongDia.Checked ? "1" : "0" });

            PatientQuestion q45 = new PatientQuestion();
            q45.ID = 53;
            q45.Answer.Add(new PatientAnswer() { ID = 138, Value = this.chkClinicalJudge.Checked ? "1" : "0" });

            PatientQuestion q46 = new PatientQuestion();
            q46.ID = 53;
            q46.Answer.Add(new PatientAnswer() { ID = 139, Value = this.chkNone.Checked ? "1" : "0" });


            PatientQuestion q47 = new PatientQuestion();
            q47.ID = 35;
            q47.Answer.Add(new PatientAnswer() { ID = 213, Value = this.chkLipidNone.Checked ? "1" : "0" });


            PatientQuestion q48 = new PatientQuestion();
            q48.ID = 42;
            q48.Answer.Add(new PatientAnswer() { ID = 214, Value = this.chk_Antihyperglycemic_None.Checked ? "1" : "0" });


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
            lstAnswers.Add(q45);
            lstAnswers.Add(q46);
            lstAnswers.Add(q47);
            lstAnswers.Add(q48);

            visRepos.SaveVisit1Screen4(patientID, lstAnswers);
        }

        private void InitializeControls()
        {
            this.pnlMain.Enabled = !isReadonly;
            this.imgNext.CausesValidation = !isReadonly;
            this.imgBack.CausesValidation = !isReadonly;
            this.imgSave.Enabled = !isReadonly;

            imgLDLC.Visible = false;
            lblLDLValue.Visible = false;

            imgAIC.Visible = false;
            lblAIC.Visible = false;

            lblMostRecentLipidLabDate.Visible = false;
            imgMostRecentLipidLabDate.Visible = false;

            lblA1C.Visible = false;
            imgA1CLabDate.Visible = false;

            imgStatin.Visible = false;

            lblResult.Text = string.Empty;

            lblCholest.Visible = false;
            lblDLC.Visible = false;
            lblHLDC.Visible = false;
            lblNONHDLC.Visible = false;
            lblTrig.Visible = false;
            lblFasting.Visible = false;
            imgMetaformin.Visible = false;
            this.lblDiabetesDuration.Visible = false;

            imgAdditionalAntihyperglycemicTherapy.Visible = false;
            imgLipidLoweringTherapy.Visible = false;
        }

        #endregion

        #region Event Handlers

        protected void imgBack_clicked(object sender, EventArgs e)
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
                string url = string.Format("~/Portal/Visit1/Page5.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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
                        visRepos.UpdateVisitScreen(1, 5, patientID);

                    string url = string.Format("~/Portal/Visit1/Page5.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}",
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
            float dummy;
            DateTime dummyDT;

            bool validated = true;

            if (this.isReadonly)
            {
                args.IsValid = true;
                return;
            }


            DateTime? visit1Date = visRepos.GetVisit1Date(this.patientID);

            //float choles = float.Parse(txtTotalCholesterol.Text + "." + txtTotalCholesterol2.Text);
            //float HDL_C = float.Parse(txtHDLC1.Text + "." + this.txtHDLC2.Text);
            ////   float nonHDLC = float.Parse(txtNonHDLC1.Text + "." + txtNonHDLC2.Text);
            //float Triglycerides = float.Parse(txtTriglycerides1.Text + "." + txtTriglycerides2.Text);
            //float glucose = float.Parse(txtFastingPlasmaGlucose1.Text + "." + txtFastingPlasmaGlucose2.Text);

            float choles = float.Parse(txtTotalCholesterol.Text);
            float HDL_C = float.Parse(txtHDLC1.Text);
            //   float nonHDLC = float.Parse(txtNonHDLC1.Text + "." + txtNonHDLC2.Text);
            float Triglycerides = float.Parse(txtTriglycerides1.Text);
            float glucose = float.Parse(txtFastingPlasmaGlucose1.Text);


            if (choles < 1 || choles > 10)
            {
                validated = false;
                lblCholest.Visible = true;
            }

            if (HDL_C < 0.1 || HDL_C > 5)
            {
                validated = false;
                lblHLDC.Visible = true;
            }

            if (Triglycerides < 0.1 || Triglycerides > 10)
            {
                validated = false;
                lblTrig.Visible = true;
            }

            if (glucose < 3 || glucose > 12)
            {
                validated = false;
                lblFasting.Visible = true;
            }


            //DLC
            //string ldl = txtLDL_C1.Text + "." + this.txtLDL_C2.Text;
            string ldl = txtLDL_C1.Text;
            if (!float.TryParse(ldl, out dummy))
            {
                validated = false;
                imgLDLC.Visible = true;
            }
            else
            {
                var result = float.Parse(ldl);
                if (result <= 2 || result > 10)
                {

                    validated = false;
                    imgLDLC.Visible = true;
                    lblLDLValue.Visible = true;

                }
            }


            if (

                   !rdoStatinAtorvastatin20.Checked &&
                   !rdoStatinAtorvastatin40.Checked &&
                   !rdoStatinAtorvastatin80.Checked &&
                   !rdoStatinSimvastatin40.Checked &&
                   !rdoStatinRosuvastatin10.Checked &&
                   !rdoStatinRosuvastatin20.Checked

                )
            {

                validated = false;
                imgStatin.Visible = true;
            }


            if (

                   !rdoMetformin_Metformin.Checked &&
                   !rdoMetformin_Glumetza.Checked &&
                   !rdoMetformin_Linagliptin.Checked &&
                   !rdoMetformin_Saxagliptin.Checked &&
                   !rdoMetformin_Sitagliptin.Checked &&
                   !rdoMetformin_SitagliptinExt.Checked
                )
            {

                validated = false;
                imgMetaformin.Visible = true;
            }


            //aic
            //string AIC = txtAIC1.Text + "." + this.txtAIC2.Text;
            string AIC = txtAIC1.Text;
            if (!float.TryParse(AIC, out dummy))
            {
                validated = false;
                imgAIC.Visible = true;
            }
            else
            {
                var result = float.Parse(AIC);

                if (result <= 7 || result > 8.9)
                {
                    validated = false;
                    imgAIC.Visible = true;
                    lblAIC.Visible = true;

                }
            }
            //lipd date 
            DateTime? MostRecentLipidLabDate = null;
            MostRecentLipidLabDate = Domain.Helper.GetCanadianDate(txtMostRecentLipidLabDate.Text);

            if (MostRecentLipidLabDate > visit1Date || MostRecentLipidLabDate < visit1Date.Value.AddMonths(-6))
            {
                validated = false;
                lblMostRecentLipidLabDate.Visible = true;
                imgMostRecentLipidLabDate.Visible = true;
            }


            DateTime? MostRecentA1CLabDate = null;

            MostRecentA1CLabDate = Domain.Helper.GetCanadianDate(txtRecentA1CLabDate.Text);


            if (MostRecentA1CLabDate > visit1Date || MostRecentA1CLabDate < visit1Date.Value.AddMonths(-6))
            {
                validated = false;
                lblA1C.Visible = true;
                imgA1CLabDate.Visible = true;
            }

            //duration of diabetes and patient's age 
            PatientRepository patRepos = new PatientRepository();

            int patientAge = Int32.Parse(patRepos.GetPatientAge(this.patientID));
            int diabetesDuration = Int32.Parse(ddDiabetesDuration.SelectedValue);
            if (diabetesDuration == 31) //more than 30 years 
            {
                if (patientAge <= 30)
                {
                    validated = false;
                    this.lblDiabetesDuration.Visible = true;

                }

            }
            else
                if (patientAge < diabetesDuration)
                {
                    validated = false;
                    this.lblDiabetesDuration.Visible = true;
                }


            if (

                !chk_Antihyperglycemic_Glucosidase.Checked &&
                !chk_Antihyperglycemic_DPP4.Checked &&
                !chk_Antihyperglycemic_GLP1.Checked &&
                !chk_Antihyperglycemic_Insulin.Checked &&
                !chk_Antihyperglycemic_Meglitinide.Checked &&
                !chk_Antihyperglycemic_SGLT2.Checked &&
                !chk_Antihyperglycemic_Sulfonylurea.Checked &&
                !chk_Antihyperglycemic_Thiazolidinedione.Checked &&
                !chk_Antihyperglycemic_None.Checked

              )
            {

                validated = false;
                imgAdditionalAntihyperglycemicTherapy.Visible = true;
            }



            if (

            !chkLipidBileAcidSequestrant.Checked &&
            !chkLipidEzetimibe.Checked &&
            !chkLipidFibrate.Checked &&
            !chkLipidNiacin.Checked &&
            !chkLipidOmega.Checked &&
            !chkLipidNone.Checked

          )
            {

                validated = false;
                imgLipidLoweringTherapy.Visible = true;
            }


            args.IsValid = validated;

            if (!validated)

                Helper.Utility.FocusControlOnPageLoad(this.pnlCustVal.ClientID, this.Page);

        }

        #endregion
    }
}