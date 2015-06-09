using Cholestabetes.Domain;
using Cholestabetes.Mobile.Models;
using Cholestabetes.Repositories;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cholestabetes.Mobile.Controllers
{
    public class VisitController : Controller
    {
        int patientID = 60;
        VisitRepository visRepos = new VisitRepository();

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult V1P1()
        {

            List<Domain.PatientQuestion> lst = visRepos.GetVisit1Screen1(patientID);

            V1P1 data = new V1P1();

            if (lst != null && lst.Count > 0)
            {
                data.HighRisk_1 = lst[0].Answer[0].Value == "1";
                data.HighRisk_2 = lst[1].Answer[0].Value == "1";
                data.HighRisk_3 = lst[2].Answer[0].Value == "1";
                data.HighRisk_4 = lst[3].Answer[0].Value == "1";
                data.HighRisk_5 = lst[4].Answer[0].Value == "1";

                data.DateOfConsent = Helper.GetCanadianDate(lst[5].Answer[0].Value);

                data.LastName = lst[6].Answer[0].Value;
                data.FirstName = lst[7].Answer[0].Value;
                data.DOB = Helper.GetCanadianDate(lst[8].Answer[0].Value);
                data.Phone = lst[9].Answer[0].Value;
            }

            return View(data);
        }

        [HttpPost]
        public ActionResult V1P1
                                (
                                    V1P1 data,
                                    bool chkHighRisk1 = false,
                                    bool chkHighRisk2 = false,
                                    bool chkHighRisk3 = false,
                                    bool chkHighRisk4 = false,
                                    bool chkHighRisk5 = false
                                )
        {

            data.HighRisk_1 = chkHighRisk1;
            data.HighRisk_2 = chkHighRisk2;
            data.HighRisk_3 = chkHighRisk3;
            data.HighRisk_4 = chkHighRisk4;
            data.HighRisk_5 = chkHighRisk5;


            if (
                !chkHighRisk1 &&
                !chkHighRisk2 &&
                !chkHighRisk3 &&
                !chkHighRisk4 &&
                !chkHighRisk5
              )
            {
                ModelState.AddModelError(string.Empty, "Please select at least one Highrisk option");
            }

            if (ModelState.IsValid)
            {
                string dateOFConsent = data.DateOfConsent.Value.ToShortDateString();
                string lastName = data.LastName;
                string firstName = data.FirstName;
                string dob = data.DOB.Value.ToShortDateString();
                string phone = data.Phone;

                bool inclCriteria = true;
                bool excCriteria = true;

                List<PatientQuestion> lstAnswers = new List<PatientQuestion>();

                PatientQuestion q1 = new PatientQuestion();
                q1.ID = 1;
                q1.Answer.Add(new PatientAnswer() { ID = 1, Value = chkHighRisk1 ? "1" : "0" });

                PatientQuestion q2 = new PatientQuestion();
                q2.ID = 1;
                q2.Answer.Add(new PatientAnswer() { ID = 4, Value = chkHighRisk2 ? "1" : "0" });

                PatientQuestion q3 = new PatientQuestion();
                q3.ID = 1;
                q3.Answer.Add(new PatientAnswer() { ID = 5, Value = chkHighRisk3 ? "1" : "0" });

                PatientQuestion q4 = new PatientQuestion();
                q4.ID = 1;
                q4.Answer.Add(new PatientAnswer() { ID = 6, Value = chkHighRisk4 ? "1" : "0" });

                PatientQuestion q5 = new PatientQuestion();
                q5.ID = 1;
                q5.Answer.Add(new PatientAnswer() { ID = 7, Value = chkHighRisk5 ? "1" : "0" });

                /////////////////////////////

                PatientQuestion q6 = new PatientQuestion();
                q6.ID = 2;
                q6.Answer.Add(new PatientAnswer() { ID = 8, Value = dateOFConsent });

                PatientQuestion q7 = new PatientQuestion();
                q7.ID = 3;
                q7.Answer.Add(new PatientAnswer() { ID = 9, Value = lastName });

                PatientQuestion q8 = new PatientQuestion();
                q8.ID = 4;
                q8.Answer.Add(new PatientAnswer() { ID = 10, Value = firstName });

                PatientQuestion q9 = new PatientQuestion();
                q9.ID = 5;
                q9.Answer.Add(new PatientAnswer() { ID = 11, Value = dob });

                PatientQuestion q10 = new PatientQuestion();
                q10.ID = 6;
                q10.Answer.Add(new PatientAnswer() { ID = 12, Value = phone });

                PatientQuestion q11 = new PatientQuestion();
                q11.ID = 7;
                q11.Answer.Add(new PatientAnswer() { ID = 13, Value = inclCriteria ? "1" : "0" });

                PatientQuestion q12 = new PatientQuestion();
                q12.ID = 8;
                q12.Answer.Add(new PatientAnswer() { ID = 14, Value = excCriteria ? "1" : "0" });


                lstAnswers.Add(q1);
                lstAnswers.Add(q2);
                lstAnswers.Add(q3);
                lstAnswers.Add(q4);
                lstAnswers.Add(q5);
                lstAnswers.Add(q6);
                lstAnswers.Add(q7);
                lstAnswers.Add(q8);
                lstAnswers.Add(q9);
                lstAnswers.Add(q10);
                lstAnswers.Add(q11);
                lstAnswers.Add(q12);

                visRepos.SaveVisit1Screen1(patientID, lstAnswers);

            }

            return View(data);
        }

        
    }
}
