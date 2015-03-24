using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Controls
{
    public partial class PhysicianSpeceficRequirements : System.Web.UI.UserControl
    {
        readonly string IMG_CHECKED = "~/images/icon_checked.png";
        readonly string IMG_UNCHECKED = "~/images/icon_unchecked.png";

        protected void Page_Load(object sender, EventArgs e)
        {
            // if (!Page.IsPostBack)
            LoadData();
        }

        #region Methods

        public void Reload()
        {
            UserHelper.ReloadUser(HttpContext.Current.Session);

            LoadData();
        }

        private void LoadData()
        {

            Domain.User loadedUser = UserHelper.GetLoggedInUser(HttpContext.Current.Session);

            if (loadedUser != null)
            {
                imgMOU.ImageUrl = loadedUser.MOU.HasValue ?
                                        (loadedUser.MOU.Value ? IMG_CHECKED : IMG_UNCHECKED)
                                        : IMG_UNCHECKED;


                imgSurvey.ImageUrl = loadedUser.AssesmentSurvey.HasValue ?
                                        (loadedUser.AssesmentSurvey.Value ? IMG_CHECKED : IMG_UNCHECKED)
                                        : IMG_UNCHECKED;

                imgPayeeInfo.ImageUrl = loadedUser.PayeeInformation.HasValue ?
                                        (loadedUser.PayeeInformation.Value ? IMG_CHECKED : IMG_UNCHECKED)
                                        : IMG_UNCHECKED;
            }
        }

        #endregion


        #region Event Handlers

        protected void imgnBtnMOU_clicked(object sender, System.EventArgs e)
        {
            Response.Redirect("~/Physician/MOU_Agreement.aspx");
        }

        protected void imgSurvey_clicked(object sender, System.EventArgs e)
        {
            QuestionAnswerRepository repos = new QuestionAnswerRepository();
            bool isReadOnly = false;
            int? screenNum = repos.GetLastScreenInSurvey(UserHelper.GetLoggedInUser(Session).UserID);

            if (!screenNum.HasValue)
            {
                screenNum = 1;
            }

            if (screenNum == 4)
            {
                isReadOnly = true;
                screenNum = 1;
            }

            Response.Redirect(
                                string.Format("~/Physician/AssesSurvey.aspx?screenID={0}&{1}={2}",
                                screenNum.ToString(),
                                Constants.READONLY,
                                UserHelper.GetLoggedInUser(HttpContext.Current.Session).AssesmentSurvey.HasValue ? isReadOnly ? "1" : "0" : "0")
                            );

        }

        protected void imgPayee_clicked(object sender, System.EventArgs e)
        {

            Response.Redirect("~/Physician/PayeeForm.aspx");
        }

        #endregion

    }
}