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
    public class PhysicianController : ApiController
    {
        PhysicianRepository phyRepos = new Repositories.PhysicianRepository();

        public void UpdateAssesmentSurveyScreenID(int PhysicianID, int screenID)
        {
            phyRepos.UpdateAssesmentSurveyScreenID( PhysicianID, screenID);
        }

        public void UpdateMOU(string userName, int MOU)
        {
            phyRepos.UpdateMOU(userName, MOU);
        }

        public void UpdatePayeeInformation(string userName, int payee)
        {
            phyRepos.UpdatePayeeInformation( userName, payee);
        }

        public void UpdateAssesmentInformation(string userName, int assesmentDone)
        {
            phyRepos.UpdateAssesmentInformation(userName, assesmentDone);
        }

        public EnrollmentSummary GetEnrollmentSummary(int userID)
        {

            return phyRepos.GetEnrollmentSummary(userID);
        }

        public void SetPaymentStatus(int userID, string pmtStatus1, string pmtStatus2, string pmtStatus3)
        {

            phyRepos.SetPaymentStatus(userID, pmtStatus1, pmtStatus2, pmtStatus3);
        }

        public List<Physician> GetRegisteredPhysicanList()
        {

            return phyRepos.GetRegisteredPhysicanList();

        }

        public List<Payee> GetPayeeList(string idList)
        {
            return phyRepos.GetPayeeList(idList);
        }

    }
}
