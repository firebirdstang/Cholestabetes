using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Data;

namespace Cholestabetes.Repositories
{
    public class EmailReminderRepository : BaseRepository
    {
        public void LoadPendingNotifications()
        {

            Entites.sp_LoadPendingNotifications();
        }

        public List<Domain.EmailReminder> GetPendingNotifications()
        {
            List<Domain.EmailReminder> lst = new List<Domain.EmailReminder>();
            foreach (sp_GetPendingNotifications_Result1 item in Entites.sp_GetPendingNotifications())
            {
                lst.Add(
                        new Domain.EmailReminder()
                        {
                            ID = item.ID,
                            PatientID = item.PatientID,
                            PhysicianID = item.PhysicianID,
                            VisitID = item.VisitID,
                            PhysicianEmail = item.PhysicianEmail,
                            Salutation = item.Salutation,
                            PhysicianFirstName = item.PhysicianFirstName,
                            PhysicianLastName = item.PhysicianLastName,
                            UserEmail = item.UserEmail,
                            PatientFirstName = item.PatientFirstName,
                            PatientLastName = item.PatientLastName,

                        }
                );

            }

            return lst;
        }

        public void ClosePendingNotifications(string idsCSV)
        {
            Entites.sp_ClosePendingNotifications(idsCSV);

        }

    }
}
