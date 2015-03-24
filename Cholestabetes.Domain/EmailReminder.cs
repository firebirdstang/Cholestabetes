using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class EmailReminder
    {

        public int? ID { get; set; }
        public int? PatientID { get; set; }
        public int? PhysicianID { get; set; }
        public int? VisitID { get; set; }

        public string PhysicianEmail { get; set; }
        public string Salutation { get; set; }
        public string PhysicianFirstName { get; set; }
        public string PhysicianLastName { get; set; }
        public string UserEmail { get; set; }
        public string PatientFirstName { get; set; }
        public string PatientLastName { get; set; }

    }
}
