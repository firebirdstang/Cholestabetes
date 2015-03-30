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
    public class VisitController : ApiController
    {
        VisitRepository visRepos = new Repositories.VisitRepository();
        
        public DateTime GetVisit1DateOfConsent(int patientID)
        {
            return visRepos.GetVisit1DateOfConsent(patientID);
        }

        public DateTime GetVisitSubmissionDate(int patientID, int visitID)
        {
            return visRepos.GetVisitSubmissionDate(  patientID, visitID);
        }

        public DateTime? GetVisit1Date(int patientID)
        {

            return visRepos.GetVisit1Date(   patientID );
        }

        public void ChangeActiveVisit(int patientID, int oldVisitID, int newVisitID)
        {
            visRepos.ChangeActiveVisit(patientID, oldVisitID, newVisitID);

        }

        public void UpdateVisitScreen(int visitID, int screenID, int patientID)
        {
            visRepos.UpdateVisitScreen(visitID, screenID, patientID);

        }

        public void UpdateVisitDates(int visitID, int patientID, DateTime startDate, DateTime endDate)
        {
            visRepos.UpdateVisitDates(visitID, patientID, startDate, endDate);

        }

        public void SaveVisit1Screen1(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen1(patientID, lst);
        }

        public void SaveVisit1Screen2(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen2(patientID, lst);
        }

        public void SaveVisit1Screen3(int patientID, List<Domain.PatientQuestion> lst)
        {
            visRepos.SaveVisit1Screen3(patientID, lst);

        }

        public void SaveVisit1Screen4(int patientID, List<Domain.PatientQuestion> lst)
        {
            visRepos.SaveVisit1Screen4(patientID, lst);
        }

        public void SaveVisit1Screen5(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen5(patientID, lst);

        }

        public void SaveVisit1Screen6(int patientID, List<Domain.PatientQuestion> lst)
        {

            visRepos.SaveVisit1Screen6(patientID, lst);
            
        }

        public List<Domain.PatientQuestion> GetVisit1Screen1(int patientID)
        {
            return visRepos.GetVisit1Screen1(patientID);
        }

        public List<Domain.PatientQuestion> GetVisit1Screen2(int patientID)
        {
            return visRepos.GetVisit1Screen2(patientID);

        }

        public List<Domain.PatientQuestion> GetVisit1Screen3(int patientID)
        {
            return visRepos.GetVisit1Screen3(patientID);
        }

        public List<Domain.PatientQuestion> GetVisit1Screen4(int patientID)
        {

            return visRepos.GetVisit1Screen4(patientID);

        }

        public List<Domain.PatientQuestion> GetVisit1Screen5(int patientID)
        {

            return visRepos.GetVisit1Screen5(patientID);

        }

        public List<Domain.PatientQuestion> GetVisit1Screen6(int patientID)
        {

            return visRepos.GetVisit1Screen6(patientID);

        }

        public Page4Values GetPage4Values(int patientID)
        {

            return visRepos.GetPage4Values(patientID);

        }

        public Page4ValuesSec GetPage4ValuesSec(int patientID)
        {

            return visRepos.GetPage4ValuesSec(patientID);

        }
    }
}
