using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class Invitee
    {
        public int ID { get; set; }
        public string InvitationTier { get; set; }
        public string Salutation { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public int?   UserID { get; set; }
        public Province Province { get; set; }
        public string PostalCode { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public Nullable<int> Status { get; set; }
        public string Clinic { get; set; }
        public string RegistrationCode { get; set; }
        public DateTime? InvitationSentDate { get; set; }
        public DateTime? InvitationSentDateFrench { get; set; }
        public bool Invited
        {
            get;
            set;
        }
        public string CellPhone { get; set; }
        public string Comments { get; set; }
        public string UserName { get; set; }
        //User registarion

        public bool? MOU { get; set; }
        public DateTime? MOUDate { get; set; }
       
        public bool? AssesmentSurvey { get; set; }
        public DateTime? AssesmentSurveyDate { get; set; }
        
        public bool? PayeeInformation { get; set; }
        public DateTime? PayeeInformationDate { get; set; }
      
     
    }
}
