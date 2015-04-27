using Cholestabetes.Domain;
using Cholestabetes.MVC.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace Cholestabetes.MVC.Controllers
{
    public class PatientController : BaseController
    {
        
        public ActionResult Index()
        {
            List<PatientVisit> result = new List<PatientVisit>();
            
            using (var client = new HttpClient())
            {
                //var patientURL = Url.RouteUrl("Service", new { controller = "Patient", action = "Name", patientID = 22 });
                //HttpResponseMessage response = client.GetAsync( patientURL)  .Result;
                //if (response.IsSuccessStatusCode)
                //{
                //    res = response.Content.ReadAsAsync<string>().Result;
                //}


                client.BaseAddress = new Uri(Cholestabetes.MVC.Code.Helper.SERVICE_URL);
                string method = string.Format("Patient/PatientsByPhysicians?physicianID={0}", 235);
                HttpResponseMessage response = client.GetAsync(Cholestabetes.MVC.Code.Helper.GetServiceURL(method)).Result;
                if (response.IsSuccessStatusCode)
                {
                    result = response.Content.ReadAsAsync<List<PatientVisit>>().Result;
                }
 
            }


            return View(result);
        }
  
    }
}
