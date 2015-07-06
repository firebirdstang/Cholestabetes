using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Cholestabetes.Mobile.Models
{
    public class V1P2
    {

  
        [Required]
        [Display( Name="Visit 1 Date")]
        [DataType(DataType.DateTime)]
        public DateTime? V1Date { get; set; }

        [Required]
        [Display( Name="Age")]
        [DataType(DataType.Text)]
        public int Age { get; set; }

        [Required]
        [Display(Name = "Gender")]
        public Enums.Gender? gender { get; set; }

        [Required]
        [Display(Name = "Ethinicty")]
        public Enums.Ethinicity? Ethinicty { get; set; }


        [Required]
        [Display(Name = "Medication Coverage")]
        public Enums.MedicationCoverage? MedicationCovergae { get; set; }

        [Required]
        [Display(Name = "Systolic")]
        [Range(60, 250)]
        public int Systolic { get; set; }

        [Required]
        [Display(Name = "Dystolic")]
        [Range(30,150)]
        public int Dystolic { get; set; }

        [Required]
        [Display(Name = "Weight")]
        public int Weight { get; set; }

        [Required]
        [Display(Name = "Height")]
        public int Height { get; set; }

        [Required]
        public Enums.WeightUnit WeightIsKg { get; set; }

        [Required]
        public Enums.HeightUnit HeightIsCM { get; set; }

        [Required]
        public Enums.SmokingHistory SmokingHistory { get; set; }

        

        public bool Diabetes_Depression { get; set; }

        public bool Diabetes_Erectile { get; set; }

        public bool Diabetes_Hypoglycemia { get; set; }

        public bool Diabetes_Macroalbuminuria { get; set; }

        public bool Diabetes_Microalbuminuria { get; set; }

        public bool Diabetes_Retinopathy { get; set; }

        public bool Diabetes_None { get; set; }


        public bool CurrMed_ASA { get; set; }

        public bool CurrMed_Antiplatelet { get; set; }

        public bool CurrMed_ACE { get; set; }

        public bool CurrMed_ARB { get; set; }

        public bool CurrMed_BB { get; set; }

        public bool CurrMed_CCB { get; set; }

        public bool CurrMed_Diuretic { get; set; }

        public bool CurrMed_None { get; set; }


        public Enums.PatientAdherence CurrMed_PatientAdherence { get; set; }

        
        public bool MedAdherence_CareGiver { get; set; }

        public bool MedAdherence_Pharmacy  { get; set; }

        public bool MedAdherence_MedCount { get; set; }

        public bool MedAdherence_Guessed { get; set; }

        public bool MedAdherence_DidNotEvaluate { get; set; }
    
    }
}
