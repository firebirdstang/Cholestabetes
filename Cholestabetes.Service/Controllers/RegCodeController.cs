using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;
using Cholestabetes.Domain;

namespace Cholestabetes.Service.Controllers
{
    public class RegCodeController : ApiController
    {
        RegCodeRepository regRepos = new Repositories.RegCodeRepository();
        
        public RegCode GetNewCode()
        {
            return regRepos.GetNewCode();
        }

        public void UpdateRegCode(int id)
        {

            regRepos.UpdateRegCode(id);
        }
    }
}
