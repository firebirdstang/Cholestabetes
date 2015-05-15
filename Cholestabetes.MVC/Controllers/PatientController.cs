using Cholestabetes.Domain;
using Cholestabetes.MVC.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace Cholestabetes.MVC.Controllers
{
    public class PatientController : BaseController
    {
        
        public ActionResult Index()
        {
             
            return View();
        }

        public ActionResult Index2()
        {

            List<PatientVisit> result = new List<PatientVisit>();

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri(Cholestabetes.MVC.Code.Helper.SERVICE_URL);
                string method = string.Format("Patient/PatientsByPhysicians?physicianID={0}", 202);
                HttpResponseMessage response = client.GetAsync(Cholestabetes.MVC.Code.Helper.GetServiceURL(method)).Result;
                if (response.IsSuccessStatusCode)
                {
                    result = response.Content.ReadAsAsync<List<PatientVisit>>().Result;
                }
            }
            return View(result);
        }

        public JsonResult GetPatientData(int physicianID)
        {
            List<PatientVisit> result = new List<PatientVisit>();

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri(Cholestabetes.MVC.Code.Helper.SERVICE_URL);
                string method = string.Format("Patient/PatientsByPhysicians?physicianID={0}", 202);
                HttpResponseMessage response = client.GetAsync(Cholestabetes.MVC.Code.Helper.GetServiceURL(method)).Result;
                if (response.IsSuccessStatusCode)
                {
                    result = response.Content.ReadAsAsync<List<PatientVisit>>().Result;
                }
            }
            return Json(new { List = result }, JsonRequestBehavior.AllowGet);
        }
  
  
    }
}
