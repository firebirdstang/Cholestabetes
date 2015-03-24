using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Repositories;

using System.Configuration;
using System.Net.Mail;

using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private UserRepository userRepo = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        private string GetEmailBody(string userName, string password, string lastName)
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

        protected void CancelPushButton_clicked(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnPassword_clicked(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this.txtEmail.Text))
                {

                    this.lblResult.Text = "Username/Email required";
                    return;
                }


                var useDetails = userRepo.GetUserDetails(this.txtEmail.Text);
 
                MailMessage mailMessage = new MailMessage();

                mailMessage.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings[Helper.Constants.EMAILGENERAL]);
                mailMessage.To.Add(new System.Net.Mail.MailAddress(useDetails.Email));
                mailMessage.Subject = "Cholestabetes – Password Retreival ";

                mailMessage.IsBodyHtml = true;
                
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetEmailBody(useDetails.Username, useDetails.Password, useDetails.LastName), null, "text/html");


                mailMessage.AlternateViews.Add(htmlView);


                Utility.SendMail(mailMessage);

                lblResult.Text = "Password sent to email address";

            }
            catch (Exception exc)
            {

                lblResult.Text = "Error occurred while retreving password";
            }

        }
    }
}