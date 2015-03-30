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
    public class PatientController : ApiController
    {

        PatientRepository patRepos = new PatientRepository();
        
        public void AddPatient(int physicianID)
        {
            patRepos.AddPatient(physicianID);
        }

        public void SaveName(int patientID, string firstName, string lastName, string telephone)
        {

            patRepos.SaveName(patientID, firstName, lastName, telephone);

        }

        public bool ShowPatientAdherenceBox(int patientID)
        {

            return patRepos.ShowPatientAdherenceBox(patientID);
        }

        public string GetPatientAge(int patientID)
        {
            return patRepos.GetPatientAge(patientID);
        }

        public string GetPatientName(int patientID)
        {

            return patRepos.GetPatientName(patientID);
        }

        public List<PatientVisit> GetPatientsByPhysicians(int physicianID)
        {
            return patRepos.GetPatientsByPhysicians(physicianID);
        }

          
    }
}
