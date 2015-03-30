using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class UserRepository : BaseRepository
    {
        
 
        public void ChangePassword(string userName, string oldPassword, string newPassword)
        {

            Entites.sp_ChangePassword(userName, newPassword);

        }

        public User GetUserDetails(string userName)
        {
            User userDetails = (from u in Entites.Users
                                join ur in Entites.UserRegistrations on u.UserID equals ur.UserID into compos
                                from u_ur in compos.DefaultIfEmpty()
                                where u.Username == userName
                                join i in Entites.InviteesMasters on u.UserID equals i.UserID into compos2
                                from x in compos2.DefaultIfEmpty()
                                
                                select new User()
                                {
                                    
                                    
                                    UserID                  = u.UserID,
                                    Username                = u.Username,
                                    Password                = u.Password,
                                    Email                   = u.Email,

                                    MOU                     = u_ur.MOU.Value,
                                    MOUDate                 = u_ur.MOUDate,
                                    AssesmentSurvey         = u_ur.AssesmentSurvey,
                                    PayeeInformation        = u_ur.PayeeInformation,
                                    PayeeInformationDate    = u_ur.PayeeInformationDate,
                                    AssesmentSurveyDate     = u_ur.AssesmentSurveyDate,

                                    Salutation              = x.Salutation,
                                    FirstName               = x.FirstName,
                                    LastName                = x.LastName

                                }).SingleOrDefault();

            try
            {
                userDetails.Password = Cholestabetes.Encryption.Encryptor.Decrypt(userDetails.Password);
            }
            catch (Exception)
            {

                //userDetails.Password = string.Empty;
            }

          

            return userDetails;

        }

        public bool IsValidRegistrationCode(string regCode)
        {
            return Entites.InviteesMasters.Count(i => i.RegistrationCode == regCode) > 0;

            // return Entites.RegistrationCodes.Count(i => i.Code  == regCode && i.Used == false ) > 0;
        }

        public bool AutheticateUser(string userName, string password)
        {
            password = Cholestabetes.Encryption.Encryptor.Encrypt(password);
            return Entites.Users.Count(u => u.Username == userName && u.Password == password) > 0;
        }

        public string GetRoles(string userName)
        {
            string retStr = string.Empty;

            StringBuilder sb = new StringBuilder();

            foreach (string str in Entites.Users.First(u => u.Username == userName).Roles.Select(r => r.Name).ToList())
            {
                sb.Append(str).Append("|");

            }

            if (sb.Length > 0)
                retStr = sb.ToString().TrimEnd("|".ToCharArray());

            return retStr;
        }

        public string[] GetRolesAsArray(string userName)
        {
            return Entites.Users.First(u => u.Username == userName).Roles.Select(r => r.Name).ToArray();

        }

         

    }
}
