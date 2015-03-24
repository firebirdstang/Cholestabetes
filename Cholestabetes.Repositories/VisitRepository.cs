using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain;
using System.Data.Objects;
using Cholestabetes.Data;
using System.Globalization;

namespace Cholestabetes.Repositories
{
    public class VisitRepository : BaseRepository
    {
        public DateTime GetVisit1DateOfConsent(int patientID)
        {

            DateTime retVal = DateTime.MinValue;
            DateTime dummy;

            List<string> lst = Entites.sp_GetVisit1DateOfConsent(patientID).ToList();

            if (lst.Count > 0)
            {
                string resultStr = lst[0].ToString();

                retVal = Domain.Helper.GetCanadianDate(resultStr);
            }

            return retVal;

        }

        public DateTime GetVisitSubmissionDate(int patientID, int visitID)
        {

            DateTime retVal = DateTime.MinValue;
            DateTime dummy;

            List<DateTime?> lst = Entites.sp_GetVisitSubmissionDate(patientID, visitID).ToList();

            if (lst.Count > 0)
            {
                string resultStr = lst[0].ToString();

                if (DateTime.TryParse(resultStr, out dummy))
                {
                    retVal = DateTime.Parse(resultStr);
                }
            }

            return retVal;

        }

        public DateTime? GetVisit1Date(int patientID)
        {

            DateTime? retVal = null;
            DateTime dummy;

            List<string> lst = Entites.sp_GetVisit1Date(patientID).ToList();

            if (lst.Count > 0)
            {
                string resultStr = lst[0].ToString();

                retVal = Domain.Helper.GetCanadianDate(resultStr);

                //string canadianStr = DateTime.Parse(resultStr). ToString();

                //if (DateTime.TryParse(canadianStr , out dummy))
                //{
                //    retVal = DateTime.Parse(resultStr);
                //}
            }

            return retVal;
        }

        public void ChangeActiveVisit(int patientID, int oldVisitID, int newVisitID)
        {
            Entites.sp_ChangeActiveVisit(patientID, oldVisitID, newVisitID);

        }

        public void UpdateVisitScreen(int visitID, int screenID, int patientID)
        {
            Entites.sp_UpdateVisitScreen(visitID, screenID, patientID);

        }

        public void UpdateVisitDates(int visitID, int patientID, DateTime startDate, DateTime endDate)
        {
            Entites.sp_UpdateVisitDates(visitID, patientID, startDate, endDate);

        }

        public void SaveVisit1Screen1(int patientID, List<Domain.PatientQuestion> lst)
        {


            Entites.sp_SaveVisit1Screen1(

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,



                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[6] as Domain.PatientQuestion).ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[7] as Domain.PatientQuestion).ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[8] as Domain.PatientQuestion).ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[9] as Domain.PatientQuestion).ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[10] as Domain.PatientQuestion).ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[11] as Domain.PatientQuestion).ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].Value

                                );

        }

        public void SaveVisit1Screen2(int patientID, List<Domain.PatientQuestion> lst)
        {

            Entites.sp_SaveVisit1Screen2(

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,



                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[6] as Domain.PatientQuestion).ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[7] as Domain.PatientQuestion).ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[8] as Domain.PatientQuestion).ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[9] as Domain.PatientQuestion).ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[10] as Domain.PatientQuestion).ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[11] as Domain.PatientQuestion).ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[12] as Domain.PatientQuestion).ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[13] as Domain.PatientQuestion).ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[14] as Domain.PatientQuestion).ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[15] as Domain.PatientQuestion).ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[16] as Domain.PatientQuestion).ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[17] as Domain.PatientQuestion).ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[18] as Domain.PatientQuestion).ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[19] as Domain.PatientQuestion).ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[20] as Domain.PatientQuestion).ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[21] as Domain.PatientQuestion).ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[22] as Domain.PatientQuestion).ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[23] as Domain.PatientQuestion).ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[24] as Domain.PatientQuestion).ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[25] as Domain.PatientQuestion).ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[26] as Domain.PatientQuestion).ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[27] as Domain.PatientQuestion).ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[28] as Domain.PatientQuestion).ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[29] as Domain.PatientQuestion).ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].Value,

                                 (lst[30] as Domain.PatientQuestion).ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].Value,

                                 (lst[31] as Domain.PatientQuestion).ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].Value,

                                 (lst[32] as Domain.PatientQuestion).ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].Value

                                );

        }

        public void SaveVisit1Screen3(int patientID, List<Domain.PatientQuestion> lst)
        {
            Entites.sp_SaveVisit1Screen3
                (

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value

                                );


        }

        public void SaveVisit1Screen4(int patientID, List<Domain.PatientQuestion> lst)
        {
            Entites.sp_SaveVisit1Screen4
                (

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[6] as Domain.PatientQuestion).ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[7] as Domain.PatientQuestion).ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[8] as Domain.PatientQuestion).ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[9] as Domain.PatientQuestion).ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[10] as Domain.PatientQuestion).ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[11] as Domain.PatientQuestion).ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[12] as Domain.PatientQuestion).ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[13] as Domain.PatientQuestion).ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[14] as Domain.PatientQuestion).ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[15] as Domain.PatientQuestion).ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[16] as Domain.PatientQuestion).ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[17] as Domain.PatientQuestion).ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[18] as Domain.PatientQuestion).ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[19] as Domain.PatientQuestion).ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[20] as Domain.PatientQuestion).ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[21] as Domain.PatientQuestion).ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[22] as Domain.PatientQuestion).ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[23] as Domain.PatientQuestion).ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[24] as Domain.PatientQuestion).ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[25] as Domain.PatientQuestion).ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[26] as Domain.PatientQuestion).ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[27] as Domain.PatientQuestion).ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[28] as Domain.PatientQuestion).ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[29] as Domain.PatientQuestion).ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[30] as Domain.PatientQuestion).ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[31] as Domain.PatientQuestion).ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[32] as Domain.PatientQuestion).ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[33] as Domain.PatientQuestion).ID,
                                (lst[33] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[33] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[34] as Domain.PatientQuestion).ID,
                                (lst[34] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[34] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[35] as Domain.PatientQuestion).ID,
                                (lst[35] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[35] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[36] as Domain.PatientQuestion).ID,
                                (lst[36] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[36] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[37] as Domain.PatientQuestion).ID,
                                (lst[37] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[37] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[38] as Domain.PatientQuestion).ID,
                                (lst[38] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[38] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[39] as Domain.PatientQuestion).ID,
                                (lst[39] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[39] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[40] as Domain.PatientQuestion).ID,
                                (lst[40] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[40] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[41] as Domain.PatientQuestion).ID,
                                (lst[41] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[41] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[42] as Domain.PatientQuestion).ID,
                                (lst[42] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[42] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[43] as Domain.PatientQuestion).ID,
                                (lst[43] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[43] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[44] as Domain.PatientQuestion).ID,
                                (lst[44] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[44] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[45] as Domain.PatientQuestion).ID,
                                (lst[45] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[45] as Domain.PatientQuestion).Answer[0].Value,

                                 (lst[46] as Domain.PatientQuestion).ID,
                                (lst[46] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[46] as Domain.PatientQuestion).Answer[0].Value,

                                 (lst[47] as Domain.PatientQuestion).ID,
                                (lst[47] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[47] as Domain.PatientQuestion).Answer[0].Value

                                );
        }

        public void SaveVisit1Screen5(int patientID, List<Domain.PatientQuestion> lst)
        {
            Entites.sp_SaveVisit1Screen5
                (

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[6] as Domain.PatientQuestion).ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[7] as Domain.PatientQuestion).ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[8] as Domain.PatientQuestion).ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[9] as Domain.PatientQuestion).ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[10] as Domain.PatientQuestion).ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[11] as Domain.PatientQuestion).ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[12] as Domain.PatientQuestion).ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[13] as Domain.PatientQuestion).ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[14] as Domain.PatientQuestion).ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[15] as Domain.PatientQuestion).ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[16] as Domain.PatientQuestion).ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[17] as Domain.PatientQuestion).ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[18] as Domain.PatientQuestion).ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[19] as Domain.PatientQuestion).ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[20] as Domain.PatientQuestion).ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[21] as Domain.PatientQuestion).ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[22] as Domain.PatientQuestion).ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[23] as Domain.PatientQuestion).ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[24] as Domain.PatientQuestion).ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[25] as Domain.PatientQuestion).ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[26] as Domain.PatientQuestion).ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[27] as Domain.PatientQuestion).ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[27] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[28] as Domain.PatientQuestion).ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[28] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[29] as Domain.PatientQuestion).ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[29] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[30] as Domain.PatientQuestion).ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[30] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[31] as Domain.PatientQuestion).ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[31] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[32] as Domain.PatientQuestion).ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[32] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[33] as Domain.PatientQuestion).ID,
                                (lst[33] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[33] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[34] as Domain.PatientQuestion).ID,
                                (lst[34] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[34] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[35] as Domain.PatientQuestion).ID,
                                (lst[35] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[35] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[36] as Domain.PatientQuestion).ID,
                                (lst[36] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[36] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[37] as Domain.PatientQuestion).ID,
                                (lst[37] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[37] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[38] as Domain.PatientQuestion).ID,
                                (lst[38] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[38] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[39] as Domain.PatientQuestion).ID,
                                (lst[39] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[39] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[40] as Domain.PatientQuestion).ID,
                                (lst[40] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[40] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[41] as Domain.PatientQuestion).ID,
                                (lst[41] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[41] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[42] as Domain.PatientQuestion).ID,
                                (lst[42] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[42] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[43] as Domain.PatientQuestion).ID,
                                (lst[43] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[43] as Domain.PatientQuestion).Answer[0].Value


                                );
        }

        public void SaveVisit1Screen6(int patientID, List<Domain.PatientQuestion> lst)
        {
            Entites.sp_SaveVisit1Screen6
                (

                                patientID,

                                (lst[0] as Domain.PatientQuestion).ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[0] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[1] as Domain.PatientQuestion).ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[1] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[2] as Domain.PatientQuestion).ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[2] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[3] as Domain.PatientQuestion).ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[3] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[4] as Domain.PatientQuestion).ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[4] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[5] as Domain.PatientQuestion).ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[5] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[6] as Domain.PatientQuestion).ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[6] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[7] as Domain.PatientQuestion).ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[7] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[8] as Domain.PatientQuestion).ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[8] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[9] as Domain.PatientQuestion).ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[9] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[10] as Domain.PatientQuestion).ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[10] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[11] as Domain.PatientQuestion).ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[11] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[12] as Domain.PatientQuestion).ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[12] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[13] as Domain.PatientQuestion).ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[13] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[14] as Domain.PatientQuestion).ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[14] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[15] as Domain.PatientQuestion).ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[15] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[16] as Domain.PatientQuestion).ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[16] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[17] as Domain.PatientQuestion).ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[17] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[18] as Domain.PatientQuestion).ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[18] as Domain.PatientQuestion).Answer[0].Value,


                                (lst[19] as Domain.PatientQuestion).ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[19] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[20] as Domain.PatientQuestion).ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[20] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[21] as Domain.PatientQuestion).ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[21] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[22] as Domain.PatientQuestion).ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[22] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[23] as Domain.PatientQuestion).ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[23] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[24] as Domain.PatientQuestion).ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[24] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[25] as Domain.PatientQuestion).ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[25] as Domain.PatientQuestion).Answer[0].Value,

                                (lst[26] as Domain.PatientQuestion).ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].ID,
                                (lst[26] as Domain.PatientQuestion).Answer[0].Value


                                );
        }

        public List<Domain.PatientQuestion> GetVisit1Screen1(int patientID)
        {
            //Entites.sp_SaveVisit1(patientID);
            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen1_Result item in Entites.sp_GetVisit1Screen1(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();

                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public List<Domain.PatientQuestion> GetVisit1Screen2(int patientID)
        {
            //Entites.sp_SaveVisit1(patientID);
            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen2_Result item in Entites.sp_GetVisit1Screen2(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();

                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public List<Domain.PatientQuestion> GetVisit1Screen3(int patientID)
        {
            //Entites.sp_SaveVisit1(patientID);
            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen3_Result item in Entites.sp_GetVisit1Screen3(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();

                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public List<Domain.PatientQuestion> GetVisit1Screen4(int patientID)
        {

            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen4_Result item in Entites.sp_GetVisit1Screen4(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();

                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public List<Domain.PatientQuestion> GetVisit1Screen5(int patientID)
        {

            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen5_Result item in Entites.sp_GetVisit1Screen5(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();
                
                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public List<Domain.PatientQuestion> GetVisit1Screen6(int patientID)
        {

            List<Domain.PatientQuestion> retLst = new List<Domain.PatientQuestion>();

            foreach (sp_GetVisit1Screen6_Result item in Entites.sp_GetVisit1Screen6(patientID).ToList())
            {
                Domain.PatientQuestion q = new Domain.PatientQuestion();

                q.ID = item.QID.Value;

                q.Answer.Add(new Domain.PatientAnswer() { ID = item.AID.Value, Value = item.AnswerValue });

                retLst.Add(q);
            }

            return retLst;

        }

        public Page4Values GetPage4Values(int patientID)
        {

            var result = Entites.sp_GetPage4Values(patientID).Single();

            return new Page4Values
            {

                AddColesevelam = result.AddColesevelam == 1,
                AddEzetimibe = result.AddEzetimibe == 1,
                AddFibrate = result.AddFibrate == 1,
                AddNiacin = result.AddNiacin == 1
            };

        }

        public Page4ValuesSec GetPage4ValuesSec(int patientID)
        {

            var result = Entites.sp_GetPage4ValuesSec(patientID).Single();

            return new Page4ValuesSec
            {

                AddGlucosidase = result.AddGlucosidase == 1,
                AddDPP4 = result.AddDPP4 == 1,
                AddGLP1 = result.AddGLP1 == 1,
                AddInsulin = result.AddInsulin == 1,
                AddMeglitinide = result.AddMeglitinide == 1,
                AddSGLT2 = result.AddSGLT2 == 1,
                AddSulfonylurear = result.AddSulfonylurear == 1,
                AddThiazolidinedione = result.AddThiazolidinedione == 1

            };

        }

    }
}
