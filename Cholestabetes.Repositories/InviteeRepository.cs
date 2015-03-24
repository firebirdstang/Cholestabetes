using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class InviteeRepository : BaseRepository
    {

        public List<Invitee> GetAllInvitees()
        {

            return (from i in Entites.InviteesMasters
                    join ur in Entites.UserRegistrations
                      on i.UserID equals ur.UserID into tableJoin
                    from u in tableJoin.DefaultIfEmpty()
                    select new Invitee()
                    {
                        ID = i.ID,
                        LastName = i.LastName,
                        FirstName = i.FirstName,
                        Clinic = i.Clinic,
                        Address = i.Address,
                        City = i.City,
                        PostalCode = i.PostalCode,
                        Phone = i.Phone,
                        Fax = i.Fax,
                        Salutation = i.Salutation,
                        InvitationTier = i.InvitationTier,
                        Province = new Province()
                        {
                            ID = i.Province.ID,
                            Name = i.Province.name
                        },
                        InvitationSentDate = i.InvitationSentDate,
                        InvitationSentDateFrench = i.InvitationSentDateFrench,
                        CellPhone = i.CellPhone,
                        Status = i.Status,
                        Email = i.Email,
                        RegistrationCode = i.RegistrationCode,

                        MOU = u.MOU.Value,
                        MOUDate = u.MOUDate.Value,
                        AssesmentSurvey = u.AssesmentSurvey.Value,
                        AssesmentSurveyDate = u.AssesmentSurveyDate.Value,
                        PayeeInformation = u.PayeeInformation.Value,
                        PayeeInformationDate = u.PayeeInformationDate.Value,
                        Comments = i.Comments,
                        Invited = i.InvitedCHRC.Value,
                        UserID = i.UserID

                    }

           ).ToList();

        }

        public List<Invitee> GetAllInviteesByProvince(int provinceID)
        {

            return (from i in Entites.InviteesMasters
                    join ur in Entites.UserRegistrations
                      on i.UserID equals ur.UserID into tableJoin
                    from u in tableJoin.DefaultIfEmpty()
                    where i.ProvinceID == provinceID
                    select new Invitee()
                    {
                        ID = i.ID,
                        LastName = i.LastName,
                        FirstName = i.FirstName,
                        Clinic = i.Clinic,
                        Address = i.Address,
                        City = i.City,
                        PostalCode = i.PostalCode,
                        Phone = i.Phone,
                        Fax = i.Fax,
                        Salutation = i.Salutation,
                        InvitationTier = i.InvitationTier,
                        Province = new Province()
                        {
                            ID = i.Province.ID,
                            Name = i.Province.name
                        },
                        InvitationSentDate = i.InvitationSentDate,
                        InvitationSentDateFrench = i.InvitationSentDateFrench,
                        CellPhone = i.CellPhone,
                        Status = i.Status,
                        Email = i.Email,
                        RegistrationCode = i.RegistrationCode,

                        MOU = u.MOU.Value,
                        MOUDate = u.MOUDate.Value,
                        AssesmentSurvey = u.AssesmentSurvey.Value,
                        AssesmentSurveyDate = u.AssesmentSurveyDate.Value,
                        PayeeInformation = u.PayeeInformation.Value,
                        PayeeInformationDate = u.PayeeInformationDate.Value,
                        Comments = i.Comments,
                        Invited = i.InvitedCHRC.Value ,
                        UserID = i.UserID
                    }

           ).ToList();

        }

        public Invitee GetInviteeData(string regCode)
        {

            return (from i in Entites.InviteesMasters
                    where i.RegistrationCode == regCode
                    select new Invitee()
                    {
                        ID = i.ID,
                        LastName = i.LastName,
                        FirstName = i.FirstName,
                        Clinic = i.Clinic,
                        Address = i.Address,
                        City = i.City,
                        PostalCode = i.PostalCode,
                        Phone = i.Phone,
                        Fax = i.Fax,
                        Province = new Province()
                        {
                            ID = i.Province.ID,
                            Name = i.Province.name
                        },
                        InvitationSentDate = i.InvitationSentDate,
                        InvitationSentDateFrench = i.InvitationSentDateFrench,
                        CellPhone = i.CellPhone,
                        Status = i.Status,
                        Email = i.Email,
                        RegistrationCode = i.RegistrationCode,
                        Salutation = i.Salutation,
                        InvitationTier = i.InvitationTier,
                        Comments = i.Comments,
                        Invited = i.InvitedCHRC.Value
                    }

            ).SingleOrDefault();
        }

        public Invitee GetInviteeData(int id)
        {

            return (from i in Entites.InviteesMasters
                    where i.ID == id
                    select new Invitee()
                    {
                        ID = i.ID,
                        LastName = i.LastName,
                        FirstName = i.FirstName,
                        Clinic = i.Clinic,
                        Address = i.Address,
                        City = i.City,
                        PostalCode = i.PostalCode,
                        Phone = i.Phone,
                        Fax = i.Fax,
                        Province = new Province()
                        {
                            ID = i.Province.ID,
                            Name = i.Province.name
                        },
                        InvitationSentDate = i.InvitationSentDate,
                        InvitationSentDateFrench = i.InvitationSentDateFrench,
                        CellPhone = i.CellPhone,
                        Status = i.Status,
                        Email = i.Email,
                        RegistrationCode = i.RegistrationCode,
                        Salutation = i.Salutation,
                        InvitationTier = i.InvitationTier,
                        Comments = i.Comments,
                        Invited = i.InvitedCHRC.Value ,
                        UserName = i.User.Username
                       
                    }

            ).SingleOrDefault();
        }

        public List<Invitee> GetInviteeData(List<int> idLst)
        {

            return (from i in Entites.InviteesMasters
                    where idLst.Contains(i.ID)
                    select new Invitee()
                    {
                        ID = i.ID,
                        LastName = i.LastName,
                        FirstName = i.FirstName,
                        Clinic = i.Clinic,
                        Address = i.Address,
                        City = i.City,
                        PostalCode = i.PostalCode,
                        Phone = i.Phone,
                        Fax = i.Fax,
                        Province = new Province()
                        {
                            ID = i.Province.ID,
                            Name = i.Province.name
                        },
                        InvitationSentDate = i.InvitationSentDate,
                        InvitationSentDateFrench = i.InvitationSentDateFrench,
                        CellPhone = i.CellPhone,
                        Status = i.Status,
                        Email = i.Email,
                        RegistrationCode = i.RegistrationCode,
                        Salutation = i.Salutation,
                        InvitationTier = i.InvitationTier,
                        Comments = i.Comments,
                        Invited = i.InvitedCHRC.Value
                    }

            ).ToList();
        }

        public bool IsRegistered(string regCode)
        {

            return Entites.sp_IsInviteeRegistered(regCode).ToList()[0] == 1;

        }

        public List<RegistrationStatus> GetRegistartionStatus()
        {
            return (from r in Entites.RegistrationStatus
                    select new RegistrationStatus()
                     {
                         ID = r.ID,
                         Name = r.Status
                     }).ToList();

        }

        public void AddInvitee(Invitee updatedInvitee)
        {

            Entites.sp_AddInvitee(
                                        updatedInvitee.FirstName,
                                        updatedInvitee.LastName,
                                        updatedInvitee.Clinic,
                                        updatedInvitee.Address,
                                        updatedInvitee.City,
                                        updatedInvitee.Province.ID.Value  ,
                                        updatedInvitee.PostalCode,
                                        updatedInvitee.Fax,
                                        updatedInvitee.RegistrationCode,
                                        updatedInvitee.Phone,
                                        updatedInvitee.CellPhone,
                                        updatedInvitee.Email,
                                        updatedInvitee.InvitationTier,
                                        updatedInvitee.Comments
                                    );


        }

        public void UpdateInviteeDataAndRegister(Invitee updatedInvitee, string userName, string password)
        {

            Entites.sp_RegsiterUser(
                                    updatedInvitee.FirstName,
                                    updatedInvitee.LastName,
                                    updatedInvitee.Clinic,
                                    updatedInvitee.Address,
                                    updatedInvitee.City,
                                    updatedInvitee.Province.ID.Value,
                                    updatedInvitee.PostalCode,
                                    updatedInvitee.Fax,
                                    updatedInvitee.RegistrationCode,
                                    userName,
                                    Cholestabetes.Encryption.Encryptor.Encrypt(password),
                                    updatedInvitee.Phone,
                                    updatedInvitee.CellPhone);
        }

        public void UpdateInvitee(Invitee updatedInvitee)
        {

            Entites.sp_UpdateInvitee(
                                        updatedInvitee.FirstName,
                                        updatedInvitee.LastName,
                                        updatedInvitee.Clinic,
                                        updatedInvitee.Address,
                                        updatedInvitee.City,
                                        updatedInvitee.Province.ID.Value,
                                        updatedInvitee.PostalCode,
                                        updatedInvitee.Fax,
                                        updatedInvitee.RegistrationCode,
                                        updatedInvitee.Phone,
                                        updatedInvitee.CellPhone,
                                        updatedInvitee.Email,
                                        updatedInvitee.InvitationTier,
                                        updatedInvitee.Comments,
                                        updatedInvitee.ID
                                    );


        }

        public void UpdateInviteDate(int physicianID, bool dateEntered, bool isFrench, bool updateCHRC)
        {
            Entites.sp_UpdateInvitationDate(physicianID, dateEntered ? 1 : 0, isFrench ? 1 : 0, updateCHRC ? 1 : 0);
        }

        public void UpdateInvitedValue(int physicianID, bool invited)
        {
            Entites.sp_UpdateInvitedValue(physicianID, invited);
        }

        public void UpdateRegistartionStatus(int physicianID, int statusID)
        {
            Entites.sp_UpdateRegistrationStatus(physicianID, statusID);
        }

        public bool PhysicianLimitReached(string regCode)
        {

            return Entites.sp_PhysicianLimitReached(regCode).Single().Value == 1;
        }

    }
}
