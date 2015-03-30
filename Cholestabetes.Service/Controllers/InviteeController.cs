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
    public class InviteeController : ApiController
    {

        InviteeRepository invRepos = new Repositories.InviteeRepository();

        public List<Invitee> GetAllInvitees()
        {
            return invRepos.GetAllInvitees();

        }

        public List<Invitee> GetAllInviteesByProvince(int provinceID)
        {
            return invRepos.GetAllInviteesByProvince(provinceID);
        }

        public Invitee GetInviteeData(string regCode)
        {

            return invRepos.GetInviteeData(regCode);
        }

        public Invitee GetInviteeData(int id)
        {

            return invRepos.GetInviteeData(id);
        }

        public List<Invitee> GetInviteeData(List<int> idLst)
        {

            return invRepos.GetInviteeData(idLst);
        }

        public bool IsRegistered(string regCode)
        {

            return invRepos.IsRegistered(regCode);

        }

        public List<RegistrationStatus> GetRegistartionStatus()
        {
            return invRepos.GetRegistartionStatus();

        }

        public void AddInvitee(Invitee updatedInvitee)
        {

            invRepos.AddInvitee(updatedInvitee);
        }

        public void UpdateInviteeDataAndRegister(Invitee updatedInvitee, string userName, string password)
        {

            invRepos.UpdateInviteeDataAndRegister(updatedInvitee, userName, password);
        }

        public void UpdateInvitee(Invitee updatedInvitee)
        {

            invRepos.UpdateInvitee(updatedInvitee);

        }

        public void UpdateInviteDate(int physicianID, bool dateEntered, bool isFrench, bool updateCHRC)
        {
            invRepos.UpdateInviteDate(physicianID, dateEntered, isFrench, updateCHRC);
        }

        public void UpdateInvitedValue(int physicianID, bool invited)
        {
            invRepos.UpdateInvitedValue(physicianID, invited);
        }

        public void UpdateRegistartionStatus(int physicianID, int statusID)
        {
            invRepos.UpdateRegistartionStatus(physicianID, statusID);
        }

        public bool PhysicianLimitReached(string regCode)
        {

            return invRepos.PhysicianLimitReached(regCode);
        }

    }
}
