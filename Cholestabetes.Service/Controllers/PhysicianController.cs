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
    [RoutePrefix("Physician")]
    public class PhysicianController : ApiController
    {
        PhysicianRepository phyRepos = new Repositories.PhysicianRepository();

        [Route("UpdateAssesmentSurveyScreenID")]
        public void UpdateAssesmentSurveyScreenID(int PhysicianID, int screenID)
        {
            phyRepos.UpdateAssesmentSurveyScreenID(PhysicianID, screenID);
        }

        [Route("UpdateMOU")]
        public void UpdateMOU(string userName, int MOU)
        {
            phyRepos.UpdateMOU(userName, MOU);
        }

        [Route("UpdatePayeeInformation")]
        public void UpdatePayeeInformation(string userName, int payee)
        {
            phyRepos.UpdatePayeeInformation(userName, payee);
        }

        [Route("UpdateAssesmentInformation")]
        public void UpdateAssesmentInformation(string userName, int assesmentDone)
        {
            phyRepos.UpdateAssesmentInformation(userName, assesmentDone);
        }

        [Route("EnrollmentSummary")]
        public EnrollmentSummary GetEnrollmentSummary(int userID)
        {

            return phyRepos.GetEnrollmentSummary(userID);
        }

        [Route("SetPaymentStatus")]
        public void SetPaymentStatus(int userID, string pmtStatus1, string pmtStatus2, string pmtStatus3)
        {

            phyRepos.SetPaymentStatus(userID, pmtStatus1, pmtStatus2, pmtStatus3);
        }

        [Route("RegisteredPhysicanList")]
        public List<Physician> GetRegisteredPhysicanList()
        {

            return phyRepos.GetRegisteredPhysicanList();

        }

        [Route("PayeeList")]
        public List<Payee> GetPayeeList(string idList)
        {
            return phyRepos.GetPayeeList(idList);
        }

    }
}
