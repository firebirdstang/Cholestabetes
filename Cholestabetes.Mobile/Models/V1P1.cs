using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cholestabetes.Mobile.Models
{
    public class V1P1
    {


        [DisplayName("110-year risk of cardiovascular event ≥20% based on the Framingham Risk Score")]
        public bool? HighRisk_1 { get; set; }

        [DisplayName("Prior diagnosis of CAD <i>(PCI, CABG, MI, Stenosis > 50% on angiogram)</i>")]
        public bool? HighRisk_2 { get; set; }

        [DisplayName("Prior diagnosis of CeVD <i>(TIA, CVA, Carotid disease on ultrasound > 50%)</i>")]
        public bool? HighRisk_3 { get; set; }

        [DisplayName("Prior history of Abdominal Aortic Aneurysm surgery")]
        public bool? HighRisk_4 { get; set; }

        [DisplayName("Prior history of PAD <i>(AFB, Stent, or ABI < 0.7 with symptoms of intermittent claudication)</i>")]
        public bool? HighRisk_5 { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Date Of Consent")]
        //[DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "Date Of Consent Required")]
        public DateTime? DateOfConsent { get; set; }

        [DisplayName("Last Naam")]
        [Required]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Firstname Required")]
        public string FirstName { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "DOB")]
        //[DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "DOB Required")]
        public DateTime? DOB { get; set; }

        [Required(ErrorMessage = "Phone Required")]
        public string Phone { get; set; }

    }
}
