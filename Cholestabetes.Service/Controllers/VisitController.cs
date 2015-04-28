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
    [RoutePrefix("Visit")]
    public class VisitController : ApiController
    {
        VisitRepository visRepos = new Repositories.VisitRepository();

        [Route("Visit1DateOfConsent")]
        public DateTime GetVisit1DateOfConsent(int patientID)
        {
            return visRepos.GetVisit1DateOfConsent(patientID);
        }

        [Route("VisitSubmissionDate")]
        public DateTime GetVisitSubmissionDate(int patientID, int visitID)
        {
            return visRepos.GetVisitSubmissionDate(patientID, visitID);
        }

        [Route("Visit1Date")]
        public DateTime? GetVisit1Date(int patientID)
        {

            return visRepos.GetVisit1Date(patientID);
        }

        [Route("ChangeActiveVisit")]
        public void ChangeActiveVisit(int patientID, int oldVisitID, int newVisitID)
        {
            visRepos.ChangeActiveVisit(patientID, oldVisitID, newVisitID);

        }

        [Route("UpdateVisitScreen")]
        public void UpdateVisitScreen(int visitID, int screenID, int patientID)
        {
            visRepos.UpdateVisitScreen(visitID, screenID, patientID);

        }

        [Route("UpdateVisitDates")]
        public void UpdateVisitDates(int visitID, int patientID, DateTime startDate, DateTime endDate)
        {
            visRepos.UpdateVisitDates(visitID, patientID, startDate, endDate);

        }

        [Route("SaveVisit1Screen1")]
        public void SaveVisit1Screen1(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen1(patientID, lst);
        }

        [Route("SaveVisit1Screen2")]
        public void SaveVisit1Screen2(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen2(patientID, lst);
        }

        [Route("SaveVisit1Screen3")]
        public void SaveVisit1Screen3(int patientID, List<Domain.PatientQuestion> lst)
        {
            visRepos.SaveVisit1Screen3(patientID, lst);

        }

        [Route("SaveVisit1Screen4")]
        public void SaveVisit1Screen4(int patientID, List<Domain.PatientQuestion> lst)
        {
            visRepos.SaveVisit1Screen4(patientID, lst);
        }

        [Route("SaveVisit1Screen5")]
        public void SaveVisit1Screen5(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen5(patientID, lst);

        }

        [Route("SaveVisit1Screen6")]
        public void SaveVisit1Screen6(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen6(patientID, lst);

        }

        [Route("Visit1Screen1")]
        public List<Domain.PatientQuestion> GetVisit1Screen1(int patientID)
        {
            return visRepos.GetVisit1Screen1(patientID);
        }

        [Route("Visit1Screen2")]
        public List<Domain.PatientQuestion> GetVisit1Screen2(int patientID)
        {
            return visRepos.GetVisit1Screen2(patientID);

        }

        [Route("Visit1Screen3")]
        public List<Domain.PatientQuestion> GetVisit1Screen3(int patientID)
        {
            return visRepos.GetVisit1Screen3(patientID);
        }

        [Route("Visit1Screen4")]
        public List<Domain.PatientQuestion> GetVisit1Screen4(int patientID)
        {

            return visRepos.GetVisit1Screen4(patientID);

        }

        [Route("Visit1Screen5")]
        public List<Domain.PatientQuestion> GetVisit1Screen5(int patientID)
        {

            return visRepos.GetVisit1Screen5(patientID);

        }

        [Route("Visit1Screen6")]
        public List<Domain.PatientQuestion> GetVisit1Screen6(int patientID)
        {

            return visRepos.GetVisit1Screen6(patientID);

        }

        [Route("Page4Values")]
        public Page4Values GetPage4Values(int patientID)
        {

            return visRepos.GetPage4Values(patientID);

        }

        [Route("Page4ValuesSec")]
        public Page4ValuesSec GetPage4ValuesSec(int patientID)
        {

            return visRepos.GetPage4ValuesSec(patientID);

        }
    }
}
