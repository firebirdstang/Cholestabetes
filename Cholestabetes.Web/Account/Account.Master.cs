using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cholestabetes.Web.Helper;

namespace Cholestabetes.Web.Account
{
    public partial class Account : System.Web.UI.MasterPage
    {

        Cholestabetes.Web.Helper.Constants.LoginType loginType;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.RawUrl.ToLower().Contains(Constants.VALEANT.ToLower()))
                loginType = Constants.LoginType.Sponser;
            else
                if (Request.RawUrl.ToLower().Contains(Constants.ADMIN.ToLower()))
                    loginType = Constants.LoginType.Admin;

            switch (loginType)
            {

                case Constants.LoginType.Physician:

                    break;

                case Constants.LoginType.Sponser:

                    pnlLogin.Visible = false;
                    pnlSponser.Visible = true;
                    pnlCHRC.Visible = false;

                    break;


                case Constants.LoginType.Admin:

                    pnlLogin.Visible = false;
                    pnlSponser.Visible = false;
                    pnlCHRC.Visible = true;

                    break;

            }

        }
    }
}