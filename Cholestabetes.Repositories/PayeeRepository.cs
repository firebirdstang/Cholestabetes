using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Repositories
{
    public class PayeeRepository : BaseRepository
    {

        public void AddPayee(Domain.Payee payee)
        {

            Entites.sp_AddPayee(
                                    payee.UserID,
                                    payee.PaymentMethod,
                                    payee.ChequePayableTo,
                                    payee.InternalRefNum,
                                    payee.MailingAddr1,
                                    payee.MailingAddr2,
                                    payee.AttentionTo,
                                    payee.City,
                                    payee.ProvinceID,
                                    payee.PostalCode,
                                    payee.TaxNumber,
                                    payee.AdditionalInstructions

                                );

        }

        public Domain.Payee GetPayee(int userID)
        {

            Domain.Payee payee = (from p in Entites.PayeeInfoes
                                  where p.UserID == userID
                                  select new Domain.Payee()
                                  {

                                      UserID = p.UserID,
                                      PaymentMethod = p.PaymentMethod,
                                      ChequePayableTo = p.ChequePayableTo,
                                      InternalRefNum = p.InternalRefNum,
                                      MailingAddr1 = p.MailingAddr1,
                                      MailingAddr2 = p.MailingAddr2,
                                      AttentionTo = p.AttentionTo,
                                      City = p.City,
                                      ProvinceID = p.ProvinceID,
                                      PostalCode = p.PostalCode,
                                      TaxNumber = p.TaxNumber,
                                      AdditionalInstructions = p.AdditionalInstructions


                                  }).SingleOrDefault();

            return payee;

        }
    }
}
