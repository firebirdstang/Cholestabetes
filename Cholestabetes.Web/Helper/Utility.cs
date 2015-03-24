using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using AjaxControlToolkit;
 

namespace Cholestabetes.Web.Helper
{
    public class Utility
    {
         
        public static void SendMail(MailMessage Message)
        {
            SmtpClient client = new SmtpClient();
            try
            {

                client.Host = ConfigurationManager.AppSettings[Helper.Constants.SMTPSERVER];

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                // NetworkCred.UserName = "webmaster@questionaf.ca";
                //NetworkCred.Password = "xkc232v";
                NetworkCred.UserName = ConfigurationManager.AppSettings[Helper.Constants.SMTPUSER];
                NetworkCred.Password = ConfigurationManager.AppSettings[Helper.Constants.SMTPPASSWORD];
                client.UseDefaultCredentials = false;
                client.Credentials = NetworkCred;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                // client.Port = 25;
                client.Port = Convert.ToInt32(ConfigurationManager.AppSettings[Helper.Constants.SMTPPORT]);

                client.Timeout = 20000;
                client.Send(Message);

            }
            catch (Exception e)
            {
                client = null;
                String Error = e.Message.ToString();
                //Utility.WriteToLog("SendMail Error: " + Error);
            }

        }

        public static string GetHTMLSalutation(string salutation)
        {
            string retStr = string.Empty;
            if (!string.IsNullOrEmpty(salutation))
            {
                if (salutation.Contains(Constants.SALUTATION_STR))
                    retStr = salutation.Replace(Constants.SALUTATION_STR, "<sup>(e).</sup>");
                else
                    retStr = salutation;
            }
            return retStr;
        }

        public static string GetStrippedSalutation(string salutation)
        {
            string retStr = string.Empty;
            if (!string.IsNullOrEmpty(salutation))
            {
                if (salutation.Contains(Constants.SALUTATION_STR))
                    retStr = salutation.Replace(Constants.SALUTATION_STR, string.Empty);
                else
                    retStr = salutation;
            }
            return retStr;
        }

        public static bool HasDigits(string str)
        {

            bool retVal = false;
            
            foreach (char c in str)
            {
                if (char.IsDigit(c))
                {
                    retVal = true;
                    break;
                }
            }

            return retVal;
        }

        public static void SetFocus( Page page ,  Control control)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("\r\n<script language='JavaScript'>\r\n");
            sb.Append("<!--\r\n");
            sb.Append("function SetFocus()\r\n");
            sb.Append("{\r\n");
            sb.Append("\tdocument.");

            Control p = control.Parent;
            while (!(p is System.Web.UI.HtmlControls.HtmlForm)) p = p.Parent;

            sb.Append(p.ClientID);
            sb.Append("['");
            sb.Append(control.UniqueID);
            sb.Append("'].focus();\r\n");
            sb.Append("}\r\n");
            sb.Append("window.onload = SetFocus;\r\n");
            sb.Append("// -->\r\n");
            sb.Append("</script>");


            ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "SETFOCUS", sb.ToString(), true);
        }

//        public static string FocusControlOnPageLoad(string ClientID, System.Web.UI.Page page)
//        {


////            string script = @"function ScrollView()
////                                      {
////                                         var el = document.getElementById('" + ClientID + @"')
////                                         if (el != null)
////                                         {        
////                                            el.scrollIntoView();
////                                            el.focus();
////                                         }
////                                      }
////
////                                      window.onload = ScrollView;";

//            string script = @"function ScrollView()
//                                      {
//                                        alert('hi');
//                                      }
//
//                                      window.onload = ScrollView;";


//            return script;
             
 
//        }


        public static void FocusControlOnPageLoad(string ClientID,
                                            System.Web.UI.Page page)
        {

//            string script = @"function ScrollView()
//
//                                      {
//                                         var el = document.getElementById('" + ClientID + @"')
//                                         if (el != null)
//                                         {        
//                                            el.scrollIntoView();
//                                            el.focus();
//                                         }
//                                      }
//
//                                       ScrollView()  ;";

            string script = string.Format( "cntrlToFocus = '{0}'" , ClientID );
 
            ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "ClearControlScript", script, true);
        }

 

    }
}