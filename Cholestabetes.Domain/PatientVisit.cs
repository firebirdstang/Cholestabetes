using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class PatientVisit
    {
        public string AutoNumber { get; set; }
        public string PatientName { get; set; }
        public string Telephone { get; set; }
        public int PatientID { get; set; }
        public int PhysicianID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public int? VisitStatus1 { get; set; }
        public DateTime? VisitDateTime1 { get; set; }
        public int? Visit1ScreenID { get; set; }

        public int? VisitStatus2 { get; set; }
        public DateTime? VisitDateTime2 { get; set; }
        public int? Visit2ScreenID { get; set; }

        public int? VisitStatus3 { get; set; }
        public DateTime? VisitDateTime3 { get; set; }
        public int? Visit3ScreenID { get; set; }


        public DateTime? Visit1StartDate{ get; set; }
        public DateTime? Visit1EndDate  { get; set; }

        public DateTime? Visit2StartDate { get; set; }
        public DateTime? Visit2EndDate { get; set; }

        public DateTime? Visit3StartDate { get; set; }
        public DateTime? Visit3EndDate { get; set; }


    }
}
