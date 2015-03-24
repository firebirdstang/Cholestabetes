using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class PhysicianRepository : BaseRepository
    {

        public void UpdateAssesmentSurveyScreenID(int PhysicianID, int screenID)
        {
            Entites.sp_UpdateAssesmentSurveyScreenID(PhysicianID, screenID);
        }

        public void UpdateMOU(string userName, int MOU)
        {
            Entites.sp_UpdateMOU(userName, MOU);
        }

        public void UpdatePayeeInformation(string userName, int payee)
        {
            Entites.sp_UpdatePayee(userName, payee);
        }

        public void UpdateAssesmentInformation(string userName, int assesmentDone)
        {
            Entites.sp_UpdateAssesmentSurvey(userName, assesmentDone);
        }

        public EnrollmentSummary GetEnrollmentSummary(int userID)
        {

            var result = Entites.sp_GetEnrollmentSummary(userID).SingleOrDefault();

            return new EnrollmentSummary
            {
                MOU = result.MOU.HasValue ? result.MOU.Value : 0,
                AssesmentSurvey = result.AssesmentSurvey.HasValue ? result.AssesmentSurvey.Value : 0,
                PayeeInfo = result.PayeeInformation.HasValue ? result.PayeeInformation.Value : 0,
                NumPatientsV1 = result.NumPatientV1,
                NumPatientsV2 = result.NumPatientV2,
                NumPatientsV3 = result.NumPatientV3,
                PaymentStatusV1 = result.PaymentStatusV1,
                PaymentStatusV2 = result.PaymentStatusV2,
                PaymentStatusV3 = result.PaymentStatusV3

            };
        }

        public void SetPaymentStatus(int userID, string pmtStatus1, string pmtStatus2, string pmtStatus3)
        {

            Entites.sp_SetPaymentStatus(userID, pmtStatus1, pmtStatus2, pmtStatus3);
        }

        public List<Physician> GetRegisteredPhysicanList()
        {

            List<Physician> lst = new List<Physician>();

            foreach (var item in Entites.sp_GetRegisteredPhysicanList())
            {
                lst.Add(
                            new Physician()
                            {
                                Firstname = item.Firstname,
                                LastName = item.LastName,
                                UserID = item.UserID.Value
                            }
                        );
            }

            return lst;

        }

        public List<Payee> GetPayeeList(string idList)
        {
            List<Payee> lst = new List<Payee>();

            foreach (var item in Entites.sp_GetPayeeList(idList))
            {
                lst.Add(

                    new Payee()
                           {
                               id = item.ID,
                               PhysicianFirstName = item.PhysicianFirstName,
                               PhysicianLastName = item.PhysicianLastName,
                               UserID = item.UserID,
                               PaymentMethod = item.PaymentMethod,
                               ChequePayableTo = item.ChequePayableTo,
                               InternalRefNum = item.InternalRefNum,
                               MailingAddr1 = item.MailingAddr1,
                               MailingAddr2 = item.MailingAddr2,
                               AttentionTo = item.AttentionTo,
                               City = item.City,
                               Province = item.Province,
                               PostalCode = item.PostalCode,
                               TaxNumber = item.TaxNumber,
                               AdditionalInstructions = item.AdditionalInstructions
                           }

                       );
            }

            return lst;
        }

    }
}
