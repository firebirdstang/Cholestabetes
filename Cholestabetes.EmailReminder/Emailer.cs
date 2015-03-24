using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Repositories;
using System.Net.Mail;

namespace Cholestabetes.EmailReminder
{
    public class Emailer
    {

        private string Host { get; set; }
        private string UserName { get; set; }
        private string Password { get; set; }
        private string FromEmail { get; set; }
        private int Port { get; set; }

        public Emailer(string host, string userName, string password, string fromEmail, int port)
        {
            Host = host;
            UserName = userName;
            Password = password;
            FromEmail = fromEmail;
            Port = port;
        }

        public void SendNotifications()
        {


            EmailReminderRepository reminderRepos = new EmailReminderRepository();

            StringBuilder sbIDs = new StringBuilder();

            reminderRepos.LoadPendingNotifications();

            foreach (Domain.EmailReminder item in reminderRepos.GetPendingNotifications())
            {
                SendNotification(

                                item.UserEmail,
                                item.PhysicianLastName,
                                item.PhysicianFirstName,
                                item.PatientLastName,
                                item.PatientFirstName,
                                item.VisitID.Value.ToString()
                            );


                sbIDs.Append(item.ID).Append(",");
            }

            reminderRepos.ClosePendingNotifications(sbIDs.ToString().TrimEnd(",".ToCharArray()));


        }

        private string GetEmailBody(

                                        string physicianLastName,
                                        string physicianFirstName,
                                        string patientLastName,
                                        string patientFirstName,
                                        string visitID
                                    )
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
                            Dear Dr. {physicianFirstName} {physicianLastName},
                        </p>
                        <p>
                            On behalf of the Canadian Heart Research Centre, we like to inform you that
                            patient {patientFirstName} {patientLastName}'s Visit {VisitID} is due.
                            </p>
                        
                        <p>
                            Please sign-in with your username and password at <a href='http://www.CHOLESTABETES.ca'
                                target='_blank'>www.CHOLESTABETES.ca</a> to complete the visit.</p>
                           
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




            html = html.Replace("{physicianFirstName}", physicianFirstName);
            html = html.Replace("{physicianLastName}", physicianLastName);
            html = html.Replace("{VisitID}", visitID);
            html = html.Replace("{patientFirstName}", patientFirstName);
            html = html.Replace("{patientLastName}", patientLastName);

            return html;

        }

        private void SendMail(MailMessage Message)
        {
            SmtpClient client = new SmtpClient();


            client.Host = Host;

            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            // NetworkCred.UserName = "webmaster@questionaf.ca";
            //NetworkCred.Password = "xkc232v";
            NetworkCred.UserName = UserName;
            NetworkCred.Password = Password;
            client.UseDefaultCredentials = false;
            client.Credentials = NetworkCred;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            // client.Port = 25;
            client.Port = Port;

            client.Timeout = 20000;
            client.Send(Message);


        }

        private bool SendNotification(
                                       string email,
                                       string physicianLastName,
                                       string physicianFirstName,
                                       string patientLastName,
                                       string patientFirstName,
                                       string visitID)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();


                email = "himan_sa@yahoo.com";

                mailMessage.From = new System.Net.Mail.MailAddress(FromEmail);
                mailMessage.To.Add(new System.Net.Mail.MailAddress(email));
                mailMessage.Subject = "Cholestabetes – Visit reminder";

                mailMessage.IsBodyHtml = true;
                //AlternateView htmlView = AlternateView.CreateAlternateViewFromString(GetRegistrationEmailBody(string.Empty, string.Empty, string.Empty, string.Empty), null, "text/html");
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(

                    GetEmailBody(
                                    physicianLastName,
                                    physicianFirstName,
                                    patientLastName,
                                    patientFirstName,
                                    visitID
                                )

                    ,
                    null,
                    "text/html");

                mailMessage.AlternateViews.Add(htmlView);


                SendMail(mailMessage);
                return true;

            }

            catch (Exception e)
            {

                return false;
            }
        }
    }
}
