using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cholestabetes.Mobile.Models
{
    public class Enums
    {
        public enum Gender
        {
            [Description("Is Male")]
            Male,
            [Description("Is Female")]
            Female
        }

        public enum Ethinicity
        {
            None = -1,
            Aboriginal = 18,
            Arabic = 19,
            Black = 20,
            Caucasian = 21,
            Hispanic = 22,
            EastAsian = 23,
            MultiRaciall = 24,
            SouthAsian = 25,
            Other = 26
        }

        public enum MedicationCoverage
        {
            None = -1,
            Provincial = 28,
            Private = 29,
            Both = 30,
        }


        public enum WeightUnit
        {
            Kg =1, 
            Lb =2
        }

        public enum HeightUnit
        {
            In = 1,
            Cm = 2
        }

        public enum SmokingHistory
        {
            Never = 37,
            Past = 38 ,
            Current = 39
        }

        public enum Diabetes
        {
            Depression ,
            Erectile,
            Hypoglycemia ,
            Macroalbuminuria ,
            Microalbuminuria  ,
            Retinopathy ,
            None 
        }

        
        public enum PatientAdherence
        {
             Percent_50=53 ,
                 Percent_70= 54,
                 Percent_over_70=54
        }

         
     
    }
}
