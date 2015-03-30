using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;

namespace Cholestabetes.Service.Controllers
{
    public class ProvinceController : ApiController
    {

        ProvinceRepository provRepos = new Repositories.ProvinceRepository();
        
        public List<Cholestabetes.Domain.Province> GetProvinces()
        {
            return provRepos.GetProvinces();
            
        }
    
    }
}
