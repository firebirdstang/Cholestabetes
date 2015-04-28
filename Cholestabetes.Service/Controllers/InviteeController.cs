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
    [RoutePrefix("Invitee")]
    public class InviteeController : ApiController
    {

        InviteeRepository invRepos = new Repositories.InviteeRepository();

        [Route("AllInvitees")]
        public List<Invitee> GetAllInvitees()
        {
            return invRepos.GetAllInvitees();

        }

        [Route("AllInviteesByProvince")]
        public List<Invitee> GetAllInviteesByProvince(int provinceID)
        {
            return invRepos.GetAllInviteesByProvince(provinceID);
        }

        [Route("InviteeData")]
        public Invitee GetInviteeData(string regCode)
        {

            return invRepos.GetInviteeData(regCode);
        }

        [Route("InviteeData")]
        public Invitee GetInviteeData(int id)
        {

            return invRepos.GetInviteeData(id);
        }

        [Route("InviteeData")]
        public List<Invitee> GetInviteeData(List<int> idLst)
        {

            return invRepos.GetInviteeData(idLst);
        }

        [Route("IsRegistered")]
        public bool IsRegistered(string regCode)
        {

            return invRepos.IsRegistered(regCode);

        }

        [Route("RegistrationStatus")]
        public List<RegistrationStatus> GetRegistartionStatus()
        {
            return invRepos.GetRegistartionStatus();

        }

        [Route("AddInvitee")]
        public void AddInvitee(Invitee updatedInvitee)
        {

            invRepos.AddInvitee(updatedInvitee);
        }

        [Route("UpdateInviteeDataAndRegister")]
        public void UpdateInviteeDataAndRegister(Invitee updatedInvitee, string userName, string password)
        {

            invRepos.UpdateInviteeDataAndRegister(updatedInvitee, userName, password);
        }

        [Route("UpdateInvitee")]
        public void UpdateInvitee(Invitee updatedInvitee)
        {

            invRepos.UpdateInvitee(updatedInvitee);

        }

        [Route("UpdateInviteDate")]
        public void UpdateInviteDate(int physicianID, bool dateEntered, bool isFrench, bool updateCHRC)
        {
            invRepos.UpdateInviteDate(physicianID, dateEntered, isFrench, updateCHRC);
        }

        [Route("UpdateInvitedValue")]
        public void UpdateInvitedValue(int physicianID, bool invited)
        {
            invRepos.UpdateInvitedValue(physicianID, invited);
        }

        [Route("UpdateRegistartionStatus")]
        public void UpdateRegistartionStatus(int physicianID, int statusID)
        {
            invRepos.UpdateRegistartionStatus(physicianID, statusID);
        }

        [Route("PhysicianLimitReached")]
        public bool PhysicianLimitReached(string regCode)
        {

            return invRepos.PhysicianLimitReached(regCode);
        }

    }
}
