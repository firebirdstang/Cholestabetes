using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class PatientRepository : BaseRepository
    {

        public void AddPatient(int physicianID)
        {
            Entites.sp_AddPatient(physicianID);
        }

        public void SaveName(int patientID , string firstName, string lastName, string telephone)
        {
            //Entites.sp_SavePatientName(patientID, firstName, lastName, telephone);

            Entites.sp_SavePatientName(
                
                                        patientID, 
                                        Cholestabetes.Encryption.Encryptor.Encrypt(firstName),
                                        Cholestabetes.Encryption.Encryptor.Encrypt(lastName),
                                        Cholestabetes.Encryption.Encryptor.Encrypt(telephone)
                                    );

        }

        public bool ShowPatientAdherenceBox(int patientID)
        {

            return Entites.sp_ShowPatientAdherenceBox(patientID).Single().Value == 1;
        }

        public string GetPatientAge(int patientID)
        {
            string retVal = string.Empty;
            
            DateTime today = DateTime.Today;
            
            List<string> result = Entites.sp_GetPatientAge(patientID).ToList();

            if (result.Count > 0)
            {
                string dobStr = result[0].ToString();

                //DateTime dob = Domain.Helper.GetCanadianDate(dobStr);
                //DateTime dob = DateTime.Parse(DateTime.Parse(dobStr).ToString("dd/MM/yyyy"));
                DateTime dob =  DateTime.Parse(dobStr);

                int age = today.Year - dob.Year;
                if (dob > today.AddYears(-age)) age--;

                retVal = age.ToString();
            }
            
            return retVal;
        }

        public string GetPatientName(int patientID)
        {
            string retStr = string.Empty;

            foreach (var item in Entites.sp_GetPatientName(patientID))
            {
                retStr += item.AnswerValue + " ";
            }
            return retStr.TrimEnd(" ".ToCharArray());
        }
      
        public List<PatientVisit> GetPatientsByPhysicians(int physicianID)
        {
            int itemNum = 0;
            List<PatientVisit> retLst = new List<PatientVisit>();
            foreach (var item in Entites.sp_GetPatientStatusByPhysican(physicianID).ToList())
            {

                PatientVisit patVisit = new PatientVisit();

                patVisit.PatientID = item.ID.Value;
                patVisit.FirstName = Cholestabetes.Encryption.Encryptor.Decrypt( item.FirstName);
                patVisit.LastName =  Cholestabetes.Encryption.Encryptor.Decrypt(item.LastName);
                patVisit.Telephone = Cholestabetes.Encryption.Encryptor.Decrypt(item.Telephone);
               
                patVisit.PhysicianID = item.UserID.Value;

                patVisit.VisitStatus1 = item.VisitStatus1.Value;
                if (item.VisitDateTime1 != null)
                    patVisit.VisitDateTime1 = item.VisitDateTime1.Value;
                patVisit.Visit1ScreenID = item.Visit1ScreenID.Value;

                patVisit.VisitStatus2 = item.VisitStatus2.Value;
                if (item.VisitDateTime2 != null)
                    patVisit.VisitDateTime2 = item.VisitDateTime2.Value;
                patVisit.Visit2ScreenID = item.Visit2ScreenID.Value;

                patVisit.VisitStatus3 = item.VisitStatus3.Value;
                if (item.VisitDateTime3 != null)
                    patVisit.VisitDateTime3 = item.VisitDateTime3.Value;
                patVisit.Visit3ScreenID = item.Visit3ScreenID.Value;
 
                patVisit.Visit1StartDate = item.Visit1StartDate;
                patVisit.Visit1EndDate = item.Visit1EndDate;

                patVisit.Visit2StartDate = item.Visit2StartDate;
                patVisit.Visit2EndDate = item.Visit2EndDate;

                patVisit.Visit3StartDate = item.Visit3StartDate;
                patVisit.Visit3EndDate = item.Visit3EndDate;

                patVisit.PatientName = item.PatientName;

              

                patVisit.AutoNumber = (++itemNum).ToString("D2");
 
                retLst.Add(patVisit);
            }

            return retLst;

        }

        
        //public List<PatientVisit> GetPatientsByPhysicians(int physicianID)
        //{
        //    List<PatientVisit> retLst = new List<PatientVisit>();
        //    foreach (var item in Entites.sp_GetPatientsByPhysican(physicianID).ToList())
        //    {

        //        PatientVisit patVisit = new PatientVisit();

        //        patVisit.PatientID = item.PatientID;
        //        patVisit.PatientFirstName = item.PatientFirstName;
        //        patVisit.PatientLastName = item.PatientLastName;

        //        patVisit.VisitID = item.VisitID;
        //        patVisit.PatientVisitID = item.PatientVisitID;
        //        patVisit.PhysicianID = item.PhysicianID.Value;

        //        retLst.Add(patVisit);
        //    }

        //    return retLst;

        //}
 
    }
}
