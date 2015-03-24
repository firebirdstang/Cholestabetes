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
    public partial class EditPhysician : System.Web.UI.Page
    {
        int physicianID = -1;

        InviteeRepository invRepos = new Repositories.InviteeRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["ID"] != null)
            {
                physicianID = Int32.Parse(Request["ID"].ToString());
            }

            if (!Page.IsPostBack)
            {
                LoadProvinces();
                LoadData();
            }
        }

        private void LoadProvinces()
        {
            ProvinceRepository provRepos = new ProvinceRepository();

            foreach (Province prov in provRepos.GetProvinces())
            {
                this.DDListPro.Items.Add(new ListItem(prov.Name, prov.ID.ToString()));
            }

            DDListPro.DataBind();

        }

        private void LoadData()
        {
            Invitee inv = invRepos.GetInviteeData(physicianID);
            if (inv != null)
            {
                lblFirstname.Text = inv.FirstName;
                lblLastname.Text = inv.LastName;
                this.lblAddress_1.Text = inv.Address;
                this.txtClinic.Text = inv.Clinic;
                this.lblCity.Text = inv.City;
                this.DDListPro.SelectedValue = inv.Province.ID.Value.ToString();
                this.lblPstCode.Text = inv.PostalCode;
                this.lblPhone.Text = inv.Phone;
                this.txtCellPhone.Text = inv.CellPhone;
                this.lblFax.Text = inv.Fax;
                this.lblEmail.Text = inv.Email;
            }

        }


        protected void btnUpdatePhysician_Click(object sender, System.EventArgs e)
        {
                bool errored = false;   

                Invitee updatedInv      =  new Invitee();
                updatedInv.FirstName    =  lblFirstname.Text ;
                updatedInv.LastName     =  lblLastname.Text;
                updatedInv.Address      =  this.lblAddress_1.Text   ;
                updatedInv.Clinic       =  this.txtClinic.Text;
                updatedInv.City         =  this.lblCity.Text  ;
                updatedInv.Province     = new Province()
                                        {
                                            ID = Int32.Parse(this.DDListPro.SelectedValue)
                                        };  
                                                   
                updatedInv.PostalCode   =  this.lblPstCode.Text  ;
                updatedInv.Phone        =  this.lblPhone.Text  ;
                updatedInv.CellPhone    =  this.txtCellPhone.Text;
                updatedInv.Fax          =  this.lblFax.Text   ;
                updatedInv.Email        =  this.lblEmail.Text   ;
                updatedInv.ID           = this.physicianID;

                try
                {
                    invRepos.UpdateInvitee(updatedInv);
 
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
    }
}