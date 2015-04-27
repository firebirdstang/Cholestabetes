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
    [RoutePrefix("Patient")]
    public class PatientController : ApiController
    {

        PatientRepository patRepos = new PatientRepository();

        [Route("AddPatient")]
        public void AddPatient(int physicianID)
        {
            patRepos.AddPatient(physicianID);
        }

        [Route("SaveName")]
        public void SaveName(int patientID, string firstName, string lastName, string telephone)
        {

            patRepos.SaveName(patientID, firstName, lastName, telephone);

        }

        [Route("ShowPatientAdherenceBox")]
        public bool ShowPatientAdherenceBox(int patientID)
        {

            return patRepos.ShowPatientAdherenceBox(patientID);
        }

        [Route("Age")]
        public string GetPatientAge(int patientID)
        {
            return patRepos.GetPatientAge(patientID);
        }

        [Route("Name")]
        public string GetPatientName(int patientID)
        {

            return patRepos.GetPatientName(patientID);
        }

        [Route("PatientsByPhysicians")]
        public List<PatientVisit> GetPatientsByPhysicians(int physicianID)
        {
            return patRepos.GetPatientsByPhysicians(physicianID);
        }


    }
}
