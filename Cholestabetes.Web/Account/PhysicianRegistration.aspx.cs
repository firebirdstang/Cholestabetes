using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;
using Cholestabetes.Domain;
using Cholestabetes.Web.Helper;
using System.Security.Principal;
using System.Web.Security;
using System.Net.Mail;
using System.Configuration;



namespace Cholestabetes.Web.Account
{
    public partial class PhysicianRegistration1 : BasePage
    {

        ProvinceRepository provRepos = new ProvinceRepository();
        InviteeRepository invRepos = new InviteeRepository();

        string regCode = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString[Constants.REGISTARTION_CODE] != null)
                regCode = Request.QueryString[Constants.REGISTARTION_CODE].ToString();


            if (!Page.IsPostBack)
            {
                LoadProvinces();
                LoadStep1Data();
                regView.ActiveViewIndex = 0;
            }

        }

        #region Methods

        private void LoadStep1Data()
        {

            Invitee invitee = invRepos.GetInviteeData(regCode);

            this.txtLastName.Text = invitee.LastName;
            this.txtFirstName.Text = invitee.FirstName;
            this.txtCity.Text = invitee.City;
            this.txtProvince.Text = invitee.Province.Name;
        }

        private void LoadStep2Data()
        {

            Invitee invitee = invRepos.GetInviteeData(regCode);

            this.txtFirstName2.Text = invitee.FirstName;
            this.txtLastName2.Text = invitee.LastName;
            this.txtClinicName.Text = invitee.Clinic;
            this.txtAddress.Text = invitee.Address;
            this.txtCity2.Text = invitee.City;
           
            if (invitee.Province.ID.HasValue)
            {
                ddProvince2.SelectedValue = invitee.Province.ID.Value.ToString();
            }
            else
            {
                ddProvince2.SelectedValue = Constants.NOID.ToString();
            }
           
            this.txtPostalCode.Text = invitee.PostalCode;
            this.txtPhone.Text = invitee.Phone;
            this.txtCell.Text = invitee.CellPhone;
            this.txtFax.Text = invitee.Fax;

        }

        private void LoadProvinces()
        {

            LoadProvincesStep2();
        }

        private void LoadProvincesStep2()
        {

            this.ddProvince2.Items.Add(new ListItem("--", Helper.Constants.NOID.ToString()));
            
            foreach (Province prov in provRepos.GetProvinces())
            {
                this.ddProvince2.Items.Add(new ListItem(prov.Name, prov.ID.ToString()));
            }

            ddProvince2.DataBind();

        }

        protected bool SendEmail(string email, string lastName, string userName, string password)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();

                mailMessage.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings[Helper.Constants.EMAILGENERAL]);
                mailMessage.To.Add(new System.Net.Mail.MailAddress(email));
                mailMessage.Subject = "Cholestabetes – Registration Confirmation";

                mailMessage.IsBodyHtml = true;
                //AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetRegistrationEmailBody(string.Empty, string.Empty, string.Empty, string.Empty), null, "text/html");
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetEmailBody(lastName, userName, password), null, "text/html");


                //LinkedResource imagelink = new LinkedResource(Server.MapPath("~/images/regEmailImage.jpg"), "image/jpg");

                //imagelink.ContentId = "imageId";

                //imagelink.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;

                //htmlView.LinkedResources.Add(imagelink);

                mailMessage.AlternateViews.Add(htmlView);
                //  mailMessage.Attachments.Add(new Attachment(Server.MapPath("~/pdf/CHOLESTABETES Needs Assessment.pdf")));

                Utility.SendMail(mailMessage);
                return true;


            }

            catch (Exception e)
            {
                Response.Write("fail in sendEmailNotification+++++" + e.Message.ToString());

                return false;
            }
        }

        protected bool SendEmailToCHRC(string firstName, string lastName, string userName, string email)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();

                mailMessage.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings[Helper.Constants.EMAILGENERAL]);
                mailMessage.To.Add(new System.Net.Mail.MailAddress(email));
                mailMessage.Subject = "Cholestabetes – Registration Confirmation";

                mailMessage.IsBodyHtml = true;
                //AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetRegistrationEmailBody(string.Empty, string.Empty, string.Empty, string.Empty), null, "text/html");
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetEmailBodytoCHRC(firstName, lastName, userName), null, "text/html");


                mailMessage.AlternateViews.Add(htmlView);


                Utility.SendMail(mailMessage);
                return true;


            }

            catch (Exception e)
            {
                Response.Write("fail in sendEmailNotification+++++" + e.Message.ToString());

                return false;
            }
        }

        private string GetEmailBodytoCHRC(string firstName, string lastName, string userName)
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
                             Dr. {lastName} has joined the Cholestabetes program with the username {userName}.
                            Please visit <a href='http://www.CHOLESTABETES.ca'
                                    target='_blank'>www.CHOLESTABETES.ca</a>.
                        </p>
                        <p>
                        
                            <ul style='list-style: none;'>
                            
                                <li><b>   Username:</b>   {userName}</li>
                               
                                <li><b>  Name:</b>  Dr. {firstName} {lastName} </li>
                            </ul>
                        </p>
                       
                        <p>
                            Should you have any questions, please do not hesitate to contact us at <a href='mailto:info@cholestabetes.ca'>
                                info@cholestabetes.ca </a>
                        </p>
                      
                        <p>
                            With best regards,
                        </p>
                        <p>
                            The CHRC
                        </p>
                    </div>";


            html = html.Replace("{userName}", userName);
            html = html.Replace("{firstName}", firstName);
            html = html.Replace("{lastName}", lastName);


            return html;

        }

        private string GetEmailBody(string lastName, string userName, string password)
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
                            On behalf of the Canadian Heart Research Centre, we thank you for your interest
                            in the <b>CHOLESTABETES QuERI</b> and for taking the time to register online.</p>
                        <p>
                            <b>Please take note of your username and password which you will be required to enter
                                each time you access your personal online portal at <a href='http://www.CHOLESTABETES.ca'
                                    target='_blank'>www.CHOLESTABETES.ca</a> <i>- Please keep this information confidential
                                        and do not share or forward your username and password. </i></b>
                            <ul style='list-style: none;'>
                            
                                <li><b>  Your Username:</b>   {userName}</li>
                               
                                <li><b>  Your Password:</b>   {password} </li>
                            </ul>
                        </p>
                        <p>
                            <b>Next Step:</b> Please sign-in with your username and password at <a href='http://www.CHOLESTABETES.ca'
                                target='_blank'>www.CHOLESTABETES.ca</a> to review the protocol and complete
                            the required documents.</p>
                        <p>
                            Should you have any questions, please do not hesitate to contact us at <a href='mailto:info@cholestabetes.ca'>
                                info@cholestabetes.ca </a>
                        </p>
                        <p>
                            We look forward to working with you.
                        </p>
                        <p>
                            With best regards,
                        </p>
                        <p>
                            The CHRC
                        </p>
                    </div>";


            html = html.Replace("{userName}", userName);
            html = html.Replace("{password}", password);
            html = html.Replace("{LastName}", lastName);


            return html;

        }

        private string GetRegistrationEmailBody(string firstName, string lastName, string userName, string password)
        {


            string html =

                      @" <style>
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
                    }
                </style>
            <div class='emailBodyWrapper'>
                    <p>
                        Dear Colleague,
                    </p>
                    <p>
                        On behalf of the Canadian Heart Research Centre, welcome to your personal online
                        portal and thank you for taking part in this initiative.</p>
                    <p>
                        The CHOLESTABETES QuERI is an observational, prospective quality enhancement research
                        initiative of high-risk patients with diabetes who have not yet achieved guideline
                        recommended LDL-C and A1C targets. Additionally, this program incorporates knowledge
                        translation through clinical decision making support but the decision to follow
                        the recommendations is left to the participating physician’s discretion. The CHOLESTABETES
                        QuERI has been reviewed and approved by OPTIMUM Clinical Research Inc., an independent,
                        central Ethics Review Board.</p>
                    <p>
                        The online portal has been created to provide you with timely access to the program
                        materials, a convenient way to manage the program documents and complete the Electronic
                        Case Report Forms (e-CRFs). Please keep your username and password confidential.
                        In order to download documents, you will need to enable cookies in your browser.
                        Please follow the link for additional information: Enabling Cookies.</p>
                    <p>
                        In order to download documents, you will need to enable cookies in your browser.
                        Please follow the link for additional information: <a href='#' class='redLabel'>Enabling
                            Cookies</a>
                    </p>
                    <p>
                        Please take a few minutes to familiarize yourself with the program requirements
                        and the site functionalities.
                        <br />
                        Download: <a href='#' class='redLabel'>CHOLESTABETES QuERI Program Overview</a>
                    </p>
                    <p class='bolded'>
                        Your online portal consists of the following:
                    </p>
                    <p class='redLabel'>
                        Resource Centre:
                    </p>
                    <p>
                        <ul>
                            <li class='bolded'>Instructions </li>
                            <li class='bolded'>Physician Specific Requirements – <span class='redLabel'>MUST BE
                                COMPLETED TO GAIN ACCESS TO THE e-CRF PORTAL</span>
                                <ul class='unbolded'>
                                    <li>o Required documents that you must review and complete prior to proceeding with
                                        patient enrollment.
                                        <ul>
                                            <li><span class='bolded'>Memorandum of Understanding (MOU):</span> Outlines your responsibilities,
                                                as the participating physician, and CHRC’s as the coordinating centre</li>
                                            <li><span class='bolded'>A brief Needs Assessment Survey: </span>Multiple choice questionnaire</li>
                                            <li><span class='bolded'>Payee Form: </span></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class='bolded'>CHOLESTABETES QuERI Documents and Forms
                                <ul class='unbolded'>
                                    <li>CHOLESTABETES QuERI Program Overview, Protocol, Central Ethics Approval Forms and
                                        the Informed Consent Form</li>
                                </ul>
                            </li>
                            <li class='bolded'>Supporting Functions and General Documents and Materials </li>
                        </ul>
                    </p>
                    <p>
                        <span class='bolded'>The <span class='redLabel'>e-CRF Portal</span> (The e-CRF portal
                            will become accessible once you complete the documents in the “Physician Specific
                            Requirements” section of the Resource Centre)</span>
                        <ul class='unbolded'>
                            <li>A simple and streamlined e-CRF tool for eligible patient enrollment </li>
                            <ul>
                                <li>View: Eligibility Criteria </li>
                            </ul>
                        </ul>
                        The CHOLESTABETES QuERI team is happy to assist you with any questions. Please do
                        not hesitate to contact us at any time: <a href='#' class='redLabel'>Contact Us</a>
                    </p>
                    <p>
                        We look forward to collaborating with you.
                    </p>
                    <p>
                        With best regards,
                    </p>
                    <br />
                    <p>
                        Anatoly Langer MD, M.Sc., FRCP (C), FACC CHOLESTABETES QuERI – Steering Committee
                        Chair Chair, Canadian Heart Research Centre Professor of Medicine, University of
                        Toronto Chair, Foundation for Medical Education and Research
                    </p>
                </div>";
            return html;

            //MessageBody = "Dear Dr. " + lastName + ",<br/>";
            //MessageBody += "<p>On behalf of the CHRC and the ACS III QuERI program Steering Committee,  we thank you for your interest in this program and for taking the time to register online.  A brief program overview is attached for your files.<p>";
            //MessageBody += "<p><b>Please take note of your username and password which you will be required to enter each time you access your personal online portal at </b> <font color=\"red\"><a href=\"http:\\www.acsiii.ca\">www.ACSIII.ca</a></font> - <u> <font color=\"red\">Please keep this information confidential and do not share or forward your username and password.</font></u></p>";
            //MessageBody += "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\">Your UserName:</font> " + userName + "<br />";
            //MessageBody += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\">Your Password:</font> " + password + "<br /><p>";
            //MessageBody += "<p><font color=\"red\">Next Step:</font> Please sign-in with your username and password at <font color=\"red\"><a href=\"http:\\www.acsiii.ca\">www.ACSIII.ca</a></font> and follow the steps to complete the Confidentiality Agreement (CDA).</p>";
            //MessageBody += "<p>Should you have any questions, please do not hesitate to contact Brigita Zile (<font color=\"red\"><a href=\"mailto:zileb@chrc.net\">zileb@chrc.net</a></font>)  or Alanna Bougie (<font color=\"red\"><a href=\"mailto:bougiea@chrc.net\">bougiea@chrc.net</a></font>)<p>";
            //MessageBody += "<p>We look forward to working with you.</p>";
            //MessageBody += "<p>With best regards,</p>";
            //MessageBody += "<p>The CHRC</p>";
            //MessageBody += "<p><img src=\"cid:imageId\" border=0/></p>";


        }

        #endregion

        #region Event Handlers

        protected void lbtnConfirm1_clicked(object sender, System.EventArgs e)
        {

            regView.ActiveViewIndex = 1;
            LoadStep2Data();
        }
 
        protected void lbtnCompleteRegStep2_clicked(object sender, System.EventArgs e)
        {
            try
            {
                #region Commented Out update invitee

                string redirectUrl = string.Empty;
                string username = this.txtEmail2.Text;
                string password = this.txtPass2.Text;

                Invitee updatedInvitee = new Invitee();
                updatedInvitee.Email = username;
                updatedInvitee.FirstName = this.txtFirstName2.Text;
                updatedInvitee.LastName = this.txtLastName2.Text;
                updatedInvitee.Clinic = this.txtClinicName.Text;
                updatedInvitee.Address = this.txtAddress.Text;
                updatedInvitee.City = this.txtCity2.Text;
                updatedInvitee.Province = new Province() { ID = Int32.Parse(ddProvince2.SelectedValue) };
                updatedInvitee.PostalCode = this.txtPostalCode.Text;
                updatedInvitee.Phone = this.txtPhone.Text;
                //this.txtCell.Text = invitee.Cell;
                updatedInvitee.Fax = this.txtFax.Text;
                updatedInvitee.RegistrationCode = regCode;
                updatedInvitee.CellPhone = this.txtCell.Text;

                this.invRepos.UpdateInviteeDataAndRegister(updatedInvitee, username, password);

                //SendEmail(updatedInvitee.Email); //send email to physician

                try
                {
                    
                    
                    //SendEmail(
                    //         ConfigurationSettings.AppSettings[Helper.Constants.EMAILGENERAL].ToString(),
                    //        updatedInvitee.LastName,
                    //        username,
                    //        password
                    // );


                    SendEmail(
                             updatedInvitee.Email,
                            updatedInvitee.LastName,
                            username,
                            password
                     );

                    SendEmailToCHRC(
                        updatedInvitee.FirstName,
                        updatedInvitee.LastName,
                        username,
                        ConfigurationSettings.AppSettings[Helper.Constants.NOTIFIEDOFREGISTRANT].ToString()
                        );

                    //throw new Exception("Email Exception");
                }
                catch (Exception exc)
                {

                    Elmah.ErrorSignal.FromCurrentContext().Raise(exc);

                }

                #endregion

                #region Loggin in

                UserRepository userRepo = new Repositories.UserRepository();

                if (userRepo.AutheticateUser(username, password))
                {
                    string[] userRoles = userRepo.GetRolesAsArray(username);

                    HttpCookie AuthorizationCookie = UserHelper.GetAuthorizationCookie(username, userRepo.GetRoles(username));

                    HttpContext.Current.User = new GenericPrincipal(User.Identity, userRoles);

                    Response.Cookies.Add(AuthorizationCookie);


                    Domain.User loggedUser = userRepo.GetUserDetails(username);

                    loggedUser.Roles.AddRange(userRoles);

                    UserHelper.SetLoggedInUser(loggedUser, HttpContext.Current.Session);


                    if (HttpContext.Current.User.IsInRole(Helper.Constants.ADMIN_ROLE))
                    {
                        redirectUrl = "~/Admin/ManageRegistration.aspx";
                    }
                    else
                        if (HttpContext.Current.User.IsInRole(Helper.Constants.VALIENT_ROLE))
                        {
                            redirectUrl = "~/Admin/SelectProvince.aspx";
                        }
                        else
                        {
                            redirectUrl = FormsAuthentication.GetRedirectUrl(username, true);
                        }


                    Response.Redirect(redirectUrl, false);
                }

                #endregion

                // regView.ActiveViewIndex = 2;
            }
            catch (Exception exc)
            {
                lblMssg.Text = exc.InnerException.Message;

            }

        }

        #endregion
 
    }
}