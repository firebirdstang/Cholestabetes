using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class PatientQuestion
    {

        public PatientQuestion()
        {

            Answer = new List<PatientAnswer>();
        }

        public int ID { get; set; }
        public List<PatientAnswer> Answer { get; set; }
    }
}
