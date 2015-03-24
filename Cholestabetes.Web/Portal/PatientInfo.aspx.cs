using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Portal
{
    public partial class PatientInfo : System.Web.UI.Page
    {
        PatientRepository  patRepos = new PatientRepository();
        int patientID = -1;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[Constants.PATIENTID] != null)
               patientID = Int32.Parse( Request.QueryString[Constants.PATIENTID].ToString());


            LoadData();
        }


        private void LoadData()
        {
           lblName.Text =  patRepos.GetPatientName( patientID);

        }
 
    }
}