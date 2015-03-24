using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Domain;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Admin
{
    public partial class AddPhysician : System.Web.UI.Page
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

            newInv.Salutation = this.txtInvRank.Text;
            newInv.FirstName = txtFirstName.Text;
            newInv.LastName = txtLastName.Text;
            newInv.Address = this.txtAddress.Text;
           // updatedInv.Clinic = this.txtClinic.Text;
            newInv.City = this.txtCity.Text;
            newInv.Province = new Province()
            {
                ID = Int32.Parse(this.ddProvince.SelectedValue)
            };

            newInv.PostalCode = this.txtPostal.Text;
            newInv.Phone = this.txtTelephone.Text;
            // updatedInv.CellPhone = this.txtCellPhone.Text;
            newInv.Fax = this.txtFax.Text;
            newInv.Email = this.txtEmail.Text;
           // updatedInv.ID = this.physicianID;

            try
            {
                invRepos.AddInvitee(newInv);

            }
            catch (Exception exc)
            {

                lblMsg.Text = exc.Message;

                errored = true;

                //throw;
            }

            if (!errored)
                ScriptManager.RegisterStartupScript(this, GetType(), "", "window.alert('Physician Record updated successfully'); parent.location.reload(true); parent.jQuery.fancybox.close();", true);
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "", "window.alert('Physician Record CANNOT be updated, please try again later'); parent.location.reload(true); parent.jQuery.fancybox.close();", true);

        }

        #endregion 
    }
}