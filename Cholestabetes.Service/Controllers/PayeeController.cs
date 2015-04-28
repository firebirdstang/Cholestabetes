using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;

namespace Cholestabetes.Service.Controllers
{
    [RoutePrefix("Payee")]
    public class PayeeController : ApiController
    {
        PayeeRepository payeeRepos = new Repositories.PayeeRepository();

        [Route("AddPayee")]
        public void AddPayee(Domain.Payee payee)
        {

            payeeRepos.AddPayee(payee);

        }

        [Route("Payee")]
        public Domain.Payee GetPayee(int userID)
        {
            return payeeRepos.GetPayee(userID);

        }
    }
}
