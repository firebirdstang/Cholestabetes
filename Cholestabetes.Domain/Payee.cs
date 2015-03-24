using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain.CSV;

namespace Cholestabetes.Domain
{
    public class Payee
    {

        public int id { get; set; }

        [CsvColumnName(Name = "UserID", Order = 1)]
        public int UserID { get; set; }


        [CsvColumnName(Name = "FirstName", Order = 2)]
        public string PhysicianFirstName { get; set; }

        [CsvColumnName(Name = "LastName", Order = 3)]
        public string PhysicianLastName { get; set; }

        public int? ProvinceID { get; set; }

        [CsvColumnName(Name = "PaymentMethod", Order = 4)]
        public string PaymentMethod { get; set; }

        [CsvColumnName(Name = "ChequePayableTo", Order = 5)]
        public string ChequePayableTo { get; set; }

        [CsvColumnName(Name = "InternalRefNum", Order = 6)]
        public string InternalRefNum { get; set; }

        [CsvColumnName(Name = "MailingAddr1", Order = 7)]
        public string MailingAddr1 { get; set; }

        [CsvColumnName(Name = "MailingAddr2", Order = 8)]
        public string MailingAddr2 { get; set; }

        [CsvColumnName(Name = "AttentionTo", Order = 9)]
        public string AttentionTo { get; set; }

        [CsvColumnName(Name = "City", Order = 10)]
        public string City { get; set; }

        [CsvColumnName(Name = "Province", Order = 11)]
        public string Province { get; set; }

        [CsvColumnName(Name = "PostalCode", Order = 12)]
        public string PostalCode { get; set; }

        [CsvColumnName(Name = "TaxNumber", Order = 13)]
        public string TaxNumber { get; set; }

        [CsvColumnName(Name = "AdditionalInstructions", Order = 14)]
        public string AdditionalInstructions { get; set; }


    }
}
