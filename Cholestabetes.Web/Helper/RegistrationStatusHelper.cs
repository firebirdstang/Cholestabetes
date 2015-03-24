using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cholestabetes.Domain;
using Cholestabetes.Repositories;

namespace Cholestabetes.Web.Helper
{
    public class RegistrationStatusHelper
    {
         
          public List<RegistrationStatus> GetRecords()
          {
              InviteeRepository invRepos = new InviteeRepository();

              return invRepos.GetRegistartionStatus();

          }

    }
}