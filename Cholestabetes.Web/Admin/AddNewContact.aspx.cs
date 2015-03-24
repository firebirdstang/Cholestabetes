using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Domain;

namespace Cholestabetes.Web.Admin
{
    public partial class AddNewContact : System.Web.UI.Page
    {
        int physicianID = -1;

        InviteeRepository invRepos = new Repositories.InviteeRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                LoadProvinces();

            }
        }

        private void LoadProvinces()
        {
            ProvinceRepository provRepos = new ProvinceRepository();

            this.ddProvince.Items.Add(new ListItem("--", Helper.Constants.NOID.ToString()  ));

            foreach (Province prov in provRepos.GetProvinces())
            {
                this.ddProvince.Items.Add(new ListItem(prov.Name, prov.ID.ToString()));
            }

            ddProvince.DataBind();

        }

        #region Event Handlers

        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            bool errored = false;

            Invitee newInv = new Invitee();

            RegCode regCode = new RegCode();

            RegCodeRepository regRepos = new RegCodeRepository();

            newInv.Salutation = this.txtInvRank.Text;
            newInv.FirstName = txtFirstName.Text;
            newInv.LastName = txtLastName.Text;
            newInv.Address = this.txtAddress.Text;
            // updatedInv.Clinic = this.txtClinic.Text;
            newInv.City = this.txtCity.Text;
            newInv.Province = new Province();
            newInv.Province.ID = Int32.Parse(this.ddProvince.SelectedValue);
            newInv.PostalCode = this.txtPostal.Text;
            newInv.Phone = this.txtTelephone.Text;
            // updatedInv.CellPhone = this.txtCellPhone.Text;
            newInv.Fax = this.txtFax.Text;
            newInv.Email = this.txtEmail.Text;
            //newInv.Comments = "Manually Added" + Environment.NewLine + this.txtComments.Text;
            newInv.Comments =  this.txtComments.Text;
            regCode = regRepos.GetNewCode();

            newInv.RegistrationCode = regCode.Code;
            

            try
            {
                invRepos.AddInvitee(newInv);

                regRepos.UpdateRegCode(regCode.ID);

            }
            catch (Exception exc)
            {

                lblMsg.Text = exc.InnerException.Message;

                errored = true;

                //throw;
            }

            if (!errored)
                ScriptManager.RegisterStartupScript(this, GetType(), "", "window.alert('Physician Record updated successfully'); parent.location.reload(true); parent.jQuery.fancybox.close();", true);
            //else
            //    ScriptManager.RegisterStartupScript(this, GetType(), "", "window.alert('Physician Record CANNOT be updated, please try again later'); parent.location.reload(true); parent.jQuery.fancybox.close();", true);

        }

        #endregion
    }

}