using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;

namespace Cholestabetes.Service.Controllers
{
    public class EmailController : ApiController
    {

        EmailReminderRepository emailRepos = new EmailReminderRepository();

        public void LoadPendingNotifications()
        {

            emailRepos.LoadPendingNotifications();
        }

        public List<Domain.EmailReminder> GetPendingNotifications()
        {
            return emailRepos.GetPendingNotifications();
        }

        public void ClosePendingNotifications(string idsCSV)
        {
            emailRepos.ClosePendingNotifications(idsCSV);

        }
    }
}
