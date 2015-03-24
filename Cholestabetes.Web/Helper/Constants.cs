using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Configuration;

namespace Cholestabetes.Web.Helper
{
    public class Constants
    {

        public static readonly int    NOID              = -1;
       
        public static readonly string ID                = "ID";
        public static readonly string USERID            = "USERID";
        public static readonly string USER              = "USER";
        public static readonly string SCREENID          = "SCREENID";
        public static readonly string REGISTARTION_CODE = "REGISTARTION_CODE";
        public static readonly string SALUTATION_STR    = "(e)";

        public static readonly string NOVALUESELECTED   = "---";

        public static readonly string PHYSICIAN_ROLE    = "Physician";
        public static readonly string VALIENT_ROLE      = "Valeant";
        public static readonly string ADMIN_ROLE        = "Admin";

        public static readonly string EMAILGENERAL      = "EMAILGENERAL";
        public static readonly string NOTIFIEDOFREGISTRANT = "NOTIFIEDOFREGISTRANT";
        public static readonly string SMTPSERVER        = "SMTPSERVER";
        public static readonly string SMTPUSER          = "SMTPUSER";
        public static readonly string SMTPPASSWORD      = "SMTPPASSWORD";
        public static readonly string SMTPPORT          = "SMTPPORT";
        public static readonly string PORTAL_OPEN       = "PORTAL_OPEN";

        public static readonly string PROVINCEID        = "PROVINCEID";

        public static readonly string ISFRENCH          = "ISFRENCH";
        public static readonly string PATIENTID         = "PATIENTID";
        public static readonly string READONLY          = "READONLY";
        public static readonly string PATIENTNUM        = "PATIENTNUM";
        public static readonly string UPDATESCREENNUM   = "UPDATESCREENNUM";
        public static readonly string MODE              = "MODE";
        public static readonly string VALEANT           = "VALEANT";
        public static readonly string ADMIN             = "ADMIN";
        public static readonly string LASTNAME          = "LASTNAME";
     
        public static readonly string ELMAH_CONN_STR    = WebConfigurationManager.ConnectionStrings["ErrorLog"].ConnectionString;

        public static readonly int Visit2StartGap       = Int32.Parse(ConfigurationSettings.AppSettings["Visit2StartGap"].ToString());
        public static readonly int Visit2EndGap         = Int32.Parse(ConfigurationSettings.AppSettings["Visit2EndGap"].ToString());
        public static readonly int Visit3StartGap       = Int32.Parse(ConfigurationSettings.AppSettings["Visit3StartGap"].ToString());
        public static readonly int Visit3EndGap         = Int32.Parse(ConfigurationSettings.AppSettings["Visit3EndGap"].ToString());

        public static readonly bool IsPortalOpen        = ConfigurationSettings.AppSettings["PORTAL_OPEN"].ToString() == "1";

        public static string GetCorrectPortalURL()
        {
            string returl = string.Empty;

            if (IsPortalOpen)
                returl = "~/Portal/Patients.aspx";
            else
                returl = "~/Portal/ComingSoon.aspx";

            return returl;
        }

        public static string GetPortalURLForPhysician(string url)
        {
            string returl = string.Empty;

            if (
                    url.ToLower().Contains(Constants.ADMIN.ToLower()) ||
                    url.ToLower().Contains(Constants.VALEANT.ToLower())
                )
                returl = GetCorrectPortalURL();
            else
                returl = url;

            return returl;
        }
       

        public enum LoginType
        {
            Physician   = 0, 
            Sponser     = 1,
            Admin       = 2 
        }
     
    }
}