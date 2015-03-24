using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Domain;
using Cholestabetes.Web.Helper;
using System.IO;

using System.Configuration;
using System.Net.Mail;

namespace Cholestabetes.Web.Admin
{
    public partial class PhysicianInfo : System.Web.UI.Page
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

            this.btnSave.Visible = !UserHelper.GetLoggedInUser(HttpContext.Current.Session).Roles.Contains(Helper.Constants.VALIENT_ROLE);
            pnlEmailInvittaion.Visible = !UserHelper.GetLoggedInUser(HttpContext.Current.Session).Roles.Contains(Helper.Constants.VALIENT_ROLE);
        }

        #region Methods

        private void LoadProvinces()
        {
            ProvinceRepository provRepos = new ProvinceRepository();

            this.ddProvince.Items.Add(new ListItem("--", Helper.Constants.NOID.ToString()));

            foreach (Province prov in provRepos.GetProvinces())
            {
                this.ddProvince.Items.Add(new ListItem(prov.Name, prov.ID.ToString()));
            }

            ddProvince.DataBind();

        }

        private void LoadData()
        {
            Invitee inv = invRepos.GetInviteeData(physicianID);
            if (inv != null)
            {
                this.txtInvRank.Text = inv.InvitationTier;
                txtFirstName.Text = inv.FirstName;
                txtLastName.Text = inv.LastName;
                this.txtAddress.Text = inv.Address;
                this.txtClinic.Text = inv.Clinic;
                this.txtCity.Text = inv.City;

                if (inv.Province.ID.HasValue)
                {
                    ddProvince.SelectedValue = inv.Province.ID.Value.ToString();
                }
                else
                {
                    ddProvince.SelectedValue = Constants.NOID.ToString();
                }

                //this.ddProvince.SelectedValue = inv.Province.ID.Value.ToString();
                this.txtPostal.Text = inv.PostalCode;
                this.txtTelephone.Text = inv.Phone;
                // this.txtCellPhone.Text = inv.CellPhone;
                this.txtFax.Text = inv.Fax;
                this.txtEmail.Text = inv.Email;
                this.txtComments.Text = inv.Comments;
                this.txtRegCode.Text = inv.RegistrationCode;
                this.txtUserName.Text = inv.UserName;
                
                ViewState[Constants.LASTNAME] = inv.LastName;
            }

        }

        private string GetEmailBody(string lastName)
        {
            string html = string.Empty;


            html = @" <style>
                        .redLabel
                        {
                            color: Red;
                        }
                        .bolded
                        {
                            font-weight: bold;
                        }
                        .unbolded
                        {
                            font-weight: normal;
                        }
                        .emailBodyWrapper
                        {
                            padding: 5px;
                            font-family: Candara;
                             font-size:14px;
                        }
                     li
                            {
                              padding-top:28px;   
                            }
                    </style>
                    <div class='emailBodyWrapper'>
                         <p>
                            Dear Dr. {LastName},
                        </p>
                        <p>
                            On behalf of the Canadian Heart Research Centre (CHRC: <a href='http://www.chrc.net' >www.chrc.net</a> ), we are pleased to invite you to participate in the CHOLESTerol lowering in type 2 diABETES Quality Enhancement Research Initiative (CHOLESTABETES QuERI).
                        </p>
                        <p>
                            Please see the appended document with registration instructions and the program details.
                             </p>
                        <p>
                            Should you have any questions, please do not hesitate to contact the CHRC at 416-977-8010 ext. 296 
                        </p>
                        <p>
                           Thank you for taking the time to review this invitation and we hope to have the opportunity to collaborate with you. 
                        </p>
                        <p>
                            Best Regards,
                        </p>
                        <p>
                            The CHRC
                        </p>
                    </div>";



            html = html.Replace("{LastName}", lastName);

            return html;

        }

        public byte[] GetPdf()
        {

            //  List<Invitee> lstInvitee = new List<Invitee>();
            //   InviteeRepository invRepos = new InviteeRepository();
            List<Invitee> invList = new List<Invitee>();
            List<int> lstIDInt = new List<int>();

            const string PATH = "~/PDF/";

            GenPdf genpdf = new GenPdf(Server.MapPath(PATH));

            string formname = chkFrench.Checked ? "Invitation Letter_French_Form Fields.pdf" : "Invitation Letter_English_Form Fields.pdf";

            //foreach (string id in Request.QueryString["physlst"].Split(",".ToCharArray()).ToList())
            //{
            //    lstIDInt.Add(Int32.Parse(physicianID));
            //}

            lstIDInt.Add(physicianID);

            invList = invRepos.GetInviteeData(lstIDInt);

            genpdf.Create();

            foreach (Invitee inv in invList)  //loop by physician
            {   //f1

                genpdf.AddForm(formname);
                //string nameA = doc.LastName + ", ";

                string fullName = string.Empty;

                if (inv.Salutation != null)
                    fullName = Utility.GetStrippedSalutation(inv.Salutation) + " " + inv.FirstName + " " + inv.LastName;
                else
                    fullName = inv.FirstName + " " + inv.LastName;


                genpdf.AddField("UniqueID", inv.RegistrationCode, 0);
                genpdf.AddField("Salutation FNAME LNAME", fullName, 0);
                genpdf.AddField("Salutation FNAME LNAME", fullName, 0);

                // genpdf.Save();
                genpdf.FinalizeForm(true);
            }

            return genpdf.Close();

        }

        protected bool SendEmail(string email, string lastName, Attachment attachment)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();

                mailMessage.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings[Helper.Constants.EMAILGENERAL]);
                mailMessage.To.Add(new System.Net.Mail.MailAddress(email));
                mailMessage.Subject = "Invitation to participate CHOLESTABETES QuERI";



                mailMessage.IsBodyHtml = true;
                //AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetRegistrationEmailBody(string.Empty, string.Empty, string.Empty, string.Empty), null, "text/html");
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetEmailBody(lastName), null, "text/html");

                mailMessage.Attachments.Add(attachment);

                mailMessage.AlternateViews.Add(htmlView);

                Utility.SendMail(mailMessage);

                return true;


            }

            catch (Exception e)
            {
                Response.Write("Failed to send invitation via email in PhysicianInfo.aspx " + e.Message.ToString());

                return false;
            }
        }

        #endregion

        #region Event Handlers

        protected void btnUpdatePhysician_Click(object sender, System.EventArgs e)
        {
            bool errored = false;

            Invitee updatedInv = new Invitee();

            updatedInv.InvitationTier = this.txtInvRank.Text;
            updatedInv.FirstName = txtFirstName.Text;
            updatedInv.LastName = txtLastName.Text;
            updatedInv.Address = this.txtAddress.Text;
            updatedInv.Clinic = this.txtClinic.Text;
            updatedInv.City = this.txtCity.Text;
            updatedInv.Province = new Province()
            {
                ID = Int32.Parse(this.ddProvince.SelectedValue)
            };

            updatedInv.PostalCode = this.txtPostal.Text;
            updatedInv.Phone = this.txtTelephone.Text;
            // updatedInv.CellPhone = this.txtCellPhone.Text;
            updatedInv.Fax = this.txtFax.Text;
            updatedInv.Email = this.txtEmail.Text;
            updatedInv.ID = this.physicianID;
            updatedInv.Comments = this.txtComments.Text;

            try
            {
                invRepos.UpdateInvitee(updatedInv);

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

        protected void btnInvite_clicked(object sender, System.EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this.txtEmailInvitation.Text))
                    return;

                string email = this.txtEmailInvitation.Text;
                string lastName = string.Empty;
                byte[] dataArray = GetPdf();

                MemoryStream s = new MemoryStream(dataArray);
                s.Seek(0, SeekOrigin.Begin);
                Attachment a = new Attachment(s, "Invitation.pdf");

                if (ViewState[Constants.LASTNAME] != null)
                    lastName = ViewState[Constants.LASTNAME].ToString();

                SendEmail(email, lastName, a);

                invRepos.UpdateInviteDate(physicianID, true, this.chkFrench.Checked, true);

                ScriptManager.RegisterStartupScript(this, GetType(), "", "window.alert('Physician invitation sent'); parent.location.reload(true); parent.jQuery.fancybox.close();", true);

                lblInvResult.Text = "Invitation/s successfully sent";

            }
            catch (Exception exception)
            {

                lblInvResult.Text = "Following Error occurred " + Environment.NewLine + exception.ToString();
            }

        }

        #endregion

    }
}