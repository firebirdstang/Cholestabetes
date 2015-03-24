using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class EnrollmentSummary
    {
    
        public int?     MOU		            { get; set; }
        public int?     AssesmentSurvey     { get; set; }
        public int?     PayeeInfo           { get; set; }
        public int?     NumPatientsV1       { get; set; }
        public int?     NumPatientsV2       { get; set; }
        public int?     NumPatientsV3       { get; set; }
        public string   PaymentStatusV1     { get; set; }
        public string   PaymentStatusV2     { get; set; }
        public string   PaymentStatusV3     { get; set; }

    }
}
