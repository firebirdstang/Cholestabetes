using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Domain;
using Cholestabetes.Repositories;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Physician
{
    public partial class AssesSurvey : BasePage
    {
        QuestionAnswerRepository quesRepos = new QuestionAnswerRepository();
        List<Domain.Question> lstQuestionAnswers = new List<Domain.Question>();
        List<AnsweredQuestion> lstAnsweredAlready = new List<AnsweredQuestion>();
        int screenID = -1;
        bool isReadOnly = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request[Helper.Constants.SCREENID] != null)
                screenID = Int32.Parse(Request[Helper.Constants.SCREENID].ToString());

            if (Request[Constants.READONLY] != null)
                isReadOnly = Request[Constants.READONLY].ToString() == "1";


            if (isReadOnly)
            {
                this.pnlMain.Enabled = false;
                this.btnSave.Visible = false;
                //this.btnNext.Visible = false;

            }

            this.btnNext.CssClass = screenID == 3 ? "btnSubmit_Yellow" : "nextScreen";
            this.btnPrevScreen.Visible = screenID != 1;


            if (!Page.IsPostBack)
            {
                LoadAnswers(screenID);
                LoadData(screenID);

            }
        }


        #region Methods

        private void LoadAnswers(int screenID)
        {
            lstAnsweredAlready = quesRepos.GetUserAnswers(UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID, screenID);
        }

        private void LoadData(int screenID)
        {

            lstQuestionAnswers = quesRepos.GetQuestionList(screenID);


            repSurvey.DataSource = lstQuestionAnswers;
            repSurvey.DataBind();
        }

        #endregion

        #region Event Handlers

        protected void btnSave_clicked(object sender, System.EventArgs e)
        {
            List<AnsweredQuestion> ansLst = new List<AnsweredQuestion>();


            foreach (RepeaterItem item in repSurvey.Items)
            {

                Panel pnl = item.FindControl("pnlAnswer") as Panel;
                CheckBoxList chkLst = item.FindControl("chkLstAnswer") as CheckBoxList;
                RadioButtonList rdoLst = item.FindControl("rdoLstAnswer") as RadioButtonList;
                Repeater rep = item.FindControl("rep") as Repeater;

                string questionType = pnl.Attributes["QuestionType"].ToString();
                int qid = Int32.Parse(pnl.Attributes["QuestionID"].ToString());

                List<int> ansIDLst = new List<int>();

                if (questionType.ToLower() == "RadioButton".ToLower())
                {
                    foreach (ListItem li in rdoLst.Items)
                    {
                        if (li.Selected)
                        {
                            AnsweredQuestion ansQ = new AnsweredQuestion();

                            ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                            ansQ.QID = qid;
                            ansQ.AID = Int32.Parse(li.Value);

                            ansLst.Add(ansQ);
                        }
                    }
                }
                else
                    if (questionType.ToLower() == "CheckBox".ToLower())
                    {
                        foreach (ListItem li in chkLst.Items)
                        {
                            if (li.Selected)
                            {
                                AnsweredQuestion ansQ = new AnsweredQuestion();

                                ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                                ansQ.QID = qid;
                                ansQ.AID = Int32.Parse(li.Value);

                                ansLst.Add(ansQ);
                            }
                        }
                    }
                    else
                    {
                        foreach (RepeaterItem repItem in rep.Items)
                        {

                            DropDownList dd = repItem.FindControl("ddRating") as DropDownList;

                            if (dd.SelectedIndex > 0)
                            {
                                AnsweredQuestion ansQ = new AnsweredQuestion();

                                ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                                ansQ.QID = qid;
                                ansQ.AID = Int32.Parse(dd.Attributes["AID"].ToString());
                                ansQ.Answer = dd.SelectedValue;

                                ansLst.Add(ansQ);
                            }
                        }

                    }
            }

            quesRepos.ClearAnswers(UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID, screenID); //clear all answers first
            quesRepos.Save(ansLst);   //save answers

        }

        protected void btnNext_clicked(object sender, System.EventArgs e)
        {

            if (isReadOnly)
            {
                screenID++;

                if (screenID == 4)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    Response.Redirect(string.Format("~/Physician/AssesSurvey.aspx?SCREENID={0}&{1}={2}",
                        screenID.ToString(),
                        Constants.READONLY,
                               this.isReadOnly ? "1" : "0"));
                }

            }

            else
            {

                List<AnsweredQuestion> ansLst = new List<AnsweredQuestion>();
                PhysicianRepository phyRepos = new PhysicianRepository();

                if (Page.IsValid)
                {
                    foreach (RepeaterItem item in repSurvey.Items)
                    {

                        Panel pnl = item.FindControl("pnlAnswer") as Panel;

                        CheckBoxList chkLst = item.FindControl("chkLstAnswer") as CheckBoxList;

                        RadioButtonList rdoLst = item.FindControl("rdoLstAnswer") as RadioButtonList;

                        Repeater rep = item.FindControl("rep") as Repeater;

                        string questionType = pnl.Attributes["QuestionType"].ToString();

                        int qid = Int32.Parse(pnl.Attributes["QuestionID"].ToString());

                        List<int> ansIDLst = new List<int>();

                        if (questionType.ToLower() == "RadioButton".ToLower())
                        {
                            foreach (ListItem li in rdoLst.Items)
                            {
                                if (li.Selected)
                                {
                                    AnsweredQuestion ansQ = new AnsweredQuestion();

                                    ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                                    ansQ.QID = qid;
                                    ansQ.AID = Int32.Parse(li.Value);

                                    ansLst.Add(ansQ);
                                }
                            }
                        }
                        else
                            if (questionType.ToLower() == "CheckBox".ToLower())
                            {
                                foreach (ListItem li in chkLst.Items)
                                {
                                    if (li.Selected)
                                    {
                                        AnsweredQuestion ansQ = new AnsweredQuestion();

                                        ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                                        ansQ.QID = qid;
                                        ansQ.AID = Int32.Parse(li.Value);

                                        ansLst.Add(ansQ);
                                    }
                                }
                            }
                            else
                            {
                                foreach (RepeaterItem repItem in rep.Items)
                                {

                                    DropDownList dd = repItem.FindControl("ddRating") as DropDownList;

                                    if (dd.SelectedIndex > 0)
                                    {
                                        AnsweredQuestion ansQ = new AnsweredQuestion();

                                        ansQ.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                                        ansQ.QID = qid;
                                        ansQ.AID = Int32.Parse(dd.Attributes["AID"].ToString());
                                        ansQ.Answer = dd.SelectedValue;

                                        ansLst.Add(ansQ);
                                    }
                                }

                            }
                    }

                    quesRepos.ClearAnswers(UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID, screenID); //clear all answers first
                    quesRepos.Save(ansLst);   //save answers


                    if (screenID == 3)
                    {


                        phyRepos.UpdateAssesmentInformation(HttpContext.Current.User.Identity.Name, 1);

                        phyRepos.UpdateAssesmentSurveyScreenID(UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID, 4); //make it readonly

                        UserHelper.ReloadUser(HttpContext.Current.Session);

                        Master.LoadPortalVisibility();

                        Response.Redirect("~/default.aspx");
                    }
                    else
                    {
                        screenID++;

                        phyRepos.UpdateAssesmentSurveyScreenID(UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID, screenID);

                        Response.Redirect(string.Format("~/Physician/AssesSurvey.aspx?SCREENID={0}&{1}={2}",
                            screenID.ToString(),
                            Constants.READONLY,
                            this.isReadOnly ? "1" : "0"));
                    }

                }
            }

        }

        protected void repSurvey_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBoxList lstAns = (e.Item.FindControl("chkLstAnswer") as CheckBoxList);
                RadioButtonList rdolstAns = (e.Item.FindControl("rdoLstAnswer") as RadioButtonList);
                Repeater rep = (e.Item.FindControl("rep") as Repeater);
                RequiredFieldValidator reqValid = (e.Item.FindControl("reqValid") as RequiredFieldValidator);

                int questionID = Int32.Parse(((lstAns.Parent) as Panel).Attributes["QuestionID"]);

                int leftToRight = Int32.Parse(((lstAns.Parent) as Panel).Attributes["QuestionFormat"]);

                bool isRadioList = (((lstAns.Parent) as Panel).Attributes["QuestionType"]).ToString().ToLower() == "RadioButton".ToLower();

                bool isCheckBox = (((lstAns.Parent) as Panel).Attributes["QuestionType"]).ToString().ToLower() == "CheckBox".ToLower();

                lstAns.RepeatDirection = leftToRight == 1 ? RepeatDirection.Horizontal : RepeatDirection.Vertical;
                rdolstAns.RepeatDirection = leftToRight == 1 ? RepeatDirection.Horizontal : RepeatDirection.Vertical;

                var lstAnswers = lstQuestionAnswers.AsQueryable().Where(q => q.ID == questionID).Select(q => q.Answers).ToList();

                List<Domain.Answer> tmpAnsLst = new List<Domain.Answer>();

                //get the answers
                foreach (var item in lstAnswers)
                {
                    foreach (var prop in item)
                    {
                        tmpAnsLst.Add(new Domain.Answer() { ID = prop.ID, QID = prop.QID, Text = prop.Text });
                    }
                }

                if (isRadioList)
                {
                    rdolstAns.Visible = true;
                    lstAns.Visible = false;
                    rep.Visible = false;

                    rdolstAns.DataValueField = "ID";
                    rdolstAns.DataTextField = "Text";
                    rdolstAns.DataSource = tmpAnsLst;
                    rdolstAns.DataBind();

                    foreach (var item in lstAnsweredAlready.Where(q => q.QID == questionID).ToList())
                    {
                        foreach (ListItem lstItem in rdolstAns.Items)
                        {
                            if (lstItem.Value == item.AID.ToString())
                                lstItem.Selected = true;
                        }
                    }
                }
                else
                    if (isCheckBox)
                    {
                        lstAns.Visible = true;
                        rdolstAns.Visible = false;
                        rep.Visible = false;

                        lstAns.DataValueField = "ID";
                        lstAns.DataTextField = "Text";
                        lstAns.DataSource = tmpAnsLst;
                        lstAns.DataBind();

                        foreach (var item in lstAnsweredAlready.Where(q => q.QID == questionID).ToList())
                        {
                            foreach (ListItem lstItem in lstAns.Items)
                            {
                                if (lstItem.Value == item.AID.ToString())
                                    lstItem.Selected = true;
                            }
                        }
                    }
                    else
                    {
                        rep.Visible = true;
                        lstAns.Visible = false;
                        rdolstAns.Visible = false;

                        rep.DataSource = tmpAnsLst;
                        rep.DataBind();

                        foreach (var item in lstAnsweredAlready.Where(q => q.QID == questionID).ToList())
                        {
                            foreach (RepeaterItem lstItem in rep.Items)
                            {

                                DropDownList ddRating = lstItem.FindControl("ddRating") as DropDownList;

                                if (ddRating.Attributes["AID"].ToString() == item.AID.ToString())
                                {

                                    ddRating.SelectedValue = item.Answer;
                                }
                            }
                        }

                    }

            }
        }

        protected void btnNextScreen_clicked(object sender, System.EventArgs e)
        {

            screenID++;
            Response.Redirect(string.Format("~/Physician/AssesSurvey.aspx?SCREENID={0}&{1}={2}",
                screenID.ToString(),
                Constants.READONLY,
                       this.isReadOnly ? "1" : "0"));

        }

        protected void btnPrevScreen_clicked(object sender, System.EventArgs e)
        {

            screenID--;
            Response.Redirect(string.Format("~/Physician/AssesSurvey.aspx?SCREENID={0}&{1}={2}",
                 screenID.ToString(),
                 Constants.READONLY,
                       this.isReadOnly ? "1" : "0"));

        }

        protected void customVal_OnServerValidate(object source, ServerValidateEventArgs args)
        {

            Panel pnl = ((source as CustomValidator).Parent as Panel);

            bool isRadioList = pnl.Attributes["QuestionType"].ToString().ToLower() == "RadioButton".ToLower();

            bool isCheckBox = pnl.Attributes["QuestionType"].ToString().ToLower() == "CheckBox".ToLower();

            CheckBoxList lst = pnl.FindControl("chkLstAnswer") as CheckBoxList;
            RadioButtonList rdolstAns = pnl.FindControl("rdoLstAnswer") as RadioButtonList;

            if (isRadioList)
                args.IsValid = rdolstAns.SelectedItem != null;
            else
                if (isCheckBox)
                    args.IsValid = lst.SelectedItem != null;

            //Label lblError = pnl.FindControl("lblError") as Label;
            //if (!args.IsValid)
            //    lblError.Text = "Nissing value";

        }

        #endregion
    }
}