using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Domain;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Physician
{
    public partial class PayeeForm : BasePage
    {

        PayeeRepository payeeRepos = new PayeeRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            InitializeControls();

            if (!Page.IsPostBack)
            {
                LoadData();
                LoadProvince();
            }
        }

        private void InitializeControls()
        {
            lblRdo.Visible = false;
        }

        #region Methods

        private void LoadData()
        {
            Payee payeeRead = payeeRepos.GetPayee(UserHelper.GetLoggedInUser(Session).UserID);

            pnlMain.Enabled = payeeRead == null;

            if (payeeRead != null)
            {
                //rblPayMethod.Items.FindByText(payeeRead.PaymentMethod).Selected = true;
                foreach (ListItem item in rblPayMethod.Items)
                {
                    if (item.Value.ToLower() == payeeRead.PaymentMethod.ToLower())
                    {
                        item.Selected = true;
                        break;
                    }
                }
                txtInternal.Text = payeeRead.InternalRefNum;
                this.txtChequePayableTo.Text = payeeRead.ChequePayableTo;
                this.txtAttentionTo.Text = payeeRead.AttentionTo;
                this.txtMailingAddr1.Text = payeeRead.MailingAddr1;
                this.txtMailingAddr2.Text = payeeRead.MailingAddr2;
                this.txtCity.Text = payeeRead.City;
                this.DDListPro.SelectedValue = payeeRead.ProvinceID.Value.ToString();
                this.txtPostalCode.Text = payeeRead.PostalCode;
                this.txtTaxNumber.Text = payeeRead.TaxNumber;
                txtInstructions.Text = payeeRead.AdditionalInstructions;
            }

        }
        private void LoadProvince()
        {
            ProvinceRepository provRepos = new ProvinceRepository();

            DDListPro.Items.Add(new ListItem("---", "---"));

            foreach (Province prov in provRepos.GetProvinces())
            {
                this.DDListPro.Items.Add(new ListItem(prov.Name, prov.ID.ToString()));
            }

            DDListPro.DataBind();

        }

        #endregion


        #region Event Handlers

        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {

            try
            {

                if (rblPayMethod.SelectedItem == null)
                {
                    lblRdo.Visible = true;
                    return;

                }

                Domain.Payee newPayee = new Payee();

                PhysicianRepository phyRepos = new PhysicianRepository();

                newPayee.UserID = UserHelper.GetLoggedInUser(HttpContext.Current.Session).UserID;
                newPayee.PaymentMethod = rblPayMethod.SelectedItem.Value;
                newPayee.ChequePayableTo = this.txtChequePayableTo.Text;
                newPayee.AttentionTo = this.txtAttentionTo.Text;
                newPayee.MailingAddr1 = this.txtMailingAddr1.Text;
                newPayee.MailingAddr2 = this.txtMailingAddr2.Text;
                newPayee.City = this.txtCity.Text;
                newPayee.ProvinceID = Int32.Parse(this.DDListPro.SelectedValue);
                newPayee.PostalCode = this.txtPostalCode.Text;
                newPayee.TaxNumber = this.txtTaxNumber.Text;
                newPayee.AdditionalInstructions = txtInstructions.Text;
                newPayee.InternalRefNum = this.txtInternal.Text;

                payeeRepos.AddPayee(newPayee);  //add payee info

                phyRepos.UpdatePayeeInformation(HttpContext.Current.User.Identity.Name, 1);

                UserHelper.ReloadUser(HttpContext.Current.Session);

                Controls.PhysicianSpeceficRequirements actionItemCntrl =
                   Page.Master.FindControl("actionItem") as Controls.PhysicianSpeceficRequirements;

                actionItemCntrl.Reload();

                Master.LoadPortalVisibility();

                pnlMain.Enabled = false;

                lblSystemMsg.Text = "Payee Info saved successfully";
            }
            catch (Exception exc)
            {
                lblSystemMsg.Text = "Error occuued while trying to save Payee Info";

            }
        }


        protected void btncancel_Click(object sender, System.EventArgs e)
        {

            Response.Redirect("~/default.aspx");
        }

        #endregion
    }
}