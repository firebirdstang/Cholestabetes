using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Cholestabetes.Repositories;
using System.Text;
using Cholestabetes.Domain;
using Cholestabetes.Domain.CSV;

namespace Cholestabetes.Web.Admin
{
    public partial class GetPayeeInfo : System.Web.UI.Page
    {

        PhysicianRepository phyRepos = new  PhysicianRepository();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }



        #region Methods

        private void LoadData()
        {

            this.lstDocs.DataSource = phyRepos.GetRegisteredPhysicanList();
            this.lstDocs.DataTextField = "Name";
            this.lstDocs.DataValueField = "UserID";
            this.lstDocs.DataBind();

        }

        #endregion 

        #region Event Handlers

        protected void btnGen_clicked(object sender, System.EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            string lstIDs = string.Empty;
            
            foreach (ListItem item in lstDocs.Items)
	        {
                if (item.Selected)
                {
                    sb.Append(item.Value).Append(",");
                }
	        }

            lstIDs = sb.ToString().TrimEnd(",".ToCharArray());


            CSV_Helper csvHelper = new CSV_Helper();

           DisplayLogFile( csvHelper.GetCsv<Payee>( phyRepos.GetPayeeList(lstIDs)));
 
           // grd.DataSource = phyRepos.GetPayeeList(lstIDs);
           //grd.DataBind();
 
        }


        internal void DisplayLogFile(string csvExportContents)
        {
            byte[] data = new ASCIIEncoding().GetBytes(csvExportContents);

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "APPLICATION/OCTET-STREAM";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=Export.csv");
            HttpContext.Current.Response.OutputStream.Write(data, 0, data.Length);
            HttpContext.Current.Response.End();
        }

        #endregion 
    }
}