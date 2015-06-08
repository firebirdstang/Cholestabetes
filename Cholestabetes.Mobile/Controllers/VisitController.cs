using Cholestabetes.Mobile.Models;
using Cholestabetes.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cholestabetes.Mobile.Controllers
{
    public class VisitController : Controller
    {
        int patientID = 34;
        VisitRepository visRepos = new VisitRepository();
        
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult V1P1()
        {

            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen1(patientID);
            
            V1P1 data = new V1P1();

            if (lst != null && lst.Count > 0)
            {
                data.HighRisk_1 = lst[0].Answer[0].Value == "1";
                data.HighRisk_2 = lst[1].Answer[0].Value == "1";
                data.HighRisk_3 = lst[2].Answer[0].Value == "1";
                data.HighRisk_4 = lst[3].Answer[0].Value == "1";
                data.HighRisk_5 = lst[4].Answer[0].Value == "1";

                data.DateOfConsent = DateTime.Parse(lst[5].Answer[0].Value.ToString());
                data.LastName = lst[6].Answer[0].Value;
                data.FirstName = lst[7].Answer[0].Value;

                data .DOB = DateTime.Parse(lst[8].Answer[0].Value.ToString());
                data.Phone = lst[9].Answer[0].Value;

            }
            
            return View(data);
        }

    }
}
