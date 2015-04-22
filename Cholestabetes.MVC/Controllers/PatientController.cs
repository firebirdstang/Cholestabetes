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

            using (var client = new HttpClient())
            {
                
                //http://localhost:8088/api/values

                //var productDetailUrl = Url.RouteUrl(
                //        "DefaultApi",
                //        new { httproute = "", controller = "ProductDetails", id = id },
                //        Request.Url.Scheme
                //    );

                client.BaseAddress = new Uri(Helper.SERVICE_URL);

                string method = string.Format("Patient/Name?patientID={0}", 202);
                
                //string method = string.Format("Patient/PatientsByPhysicians?physicianID={0}", 202);
                
                //string method = "values";

                HttpResponseMessage response = client.GetAsync(Helper.GetServiceURL(method)).Result;

                if (response.IsSuccessStatusCode)
                {
                    var lst = response.Content.ReadAsAsync<IEnumerable<string>>().Result;
                }



                //var model = client.GetAsync(Helper.GetServiceURL(method))
                //                  .Result
                //                  .Content.ReadAsAsync<string>().Result;

                

            }

            return View();
        }

      
         
    }
}
