using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;
using Cholestabetes.Domain;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Admin
{
    public partial class GenerateInvitation : System.Web.UI.Page
    {

        private string formname;

        private bool isfrench = false;

        //private const string PATH = "~/Templates/";
        private const string PATH = "~/PDF/";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (Request.QueryString[Helper.Constants.ISFRENCH] != null)
                isfrench = Request.QueryString[Helper.Constants.ISFRENCH].ToString() == "1";
            
            //formname = isfrench ? "Invitation Letter_French_Form Fields.pdf" : "Invitation Letter_English_Form Fields.pdf";

            formname = isfrench ? "Invitation Letter_French_Form Fields.pdf" : "Invitation Letter_English_Form Fields.pdf";

           
            byte[] bytes = getPracticePdf();

            if (bytes == null)
            {
                UIHelper.Alert(this, "Could not generate Pdf");
                return;
            }
            if (bytes.Length == 0)
            {
                UIHelper.Alert(this, "Could not generate Pdf");
                return;
            }

            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(bytes);

            }
            catch
            {
                UIHelper.Alert(this, "Could not display Pdf");
            }

        }

        public byte[] getPracticePdf()
        {

            List<Invitee> lstInvitee = new List<Invitee>();

            InviteeRepository invRepos = new InviteeRepository();

            GenPdf genpdf = new GenPdf(Server.MapPath(PATH));

            List<Invitee> invList = new List<Invitee>();

            List<int> lstIDInt = new List<int>();

            foreach (string id in Request.QueryString["physlst"].Split(",".ToCharArray()).ToList())
            {
                lstIDInt.Add(Int32.Parse(id));
            }


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


            //GenPdf genpdf = new GenPdf(Server.MapPath(PATH));
            //List<Physician> doclist = new List<Physician>();
            //genpdf.Create();
            //string idlst = Request.QueryString["physlst"];
            //string[] idarr = idlst.Split(",".ToCharArray());
            //doclist = Physician.GetPhysicianList(idarr);
            //foreach (Physician doc in doclist)  //loop by physician
            //{   //f1
            //    genpdf.AddForm(formname);
            //    //string nameA = doc.LastName + ", ";

            //    //string nameB = nameA;
            //    string id = doc.PhysicianID;
            //    string regid = doc.PhysicianID;
            //    string name = doc.FirstName + " " + doc.LastName + ",";
            //    //genpdf.AddField("Last Name", nameA, 0);
            //    genpdf.AddField("name", name, 0);
            //    genpdf.AddField("id", id, 0);
            //    genpdf.AddField("regid", regid, 0);
            //    // genpdf.Save();
            //    genpdf.FinalizeForm(true);
            //}
            //return genpdf.Close();

        }
    }
}