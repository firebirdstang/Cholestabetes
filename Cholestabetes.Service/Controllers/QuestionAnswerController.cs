using Cholestabetes.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Cholestabetes.Repositories;

namespace Cholestabetes.Service.Controllers
{
    public class QuestionAnswerController : ApiController
    {

        QuestionAnswerRepository qaRepos = new Repositories.QuestionAnswerRepository();
        
        public int? GetLastScreenInSurvey(int physicianID)
        {
            return qaRepos.GetLastScreenInSurvey(physicianID);

        }

        public List<Cholestabetes.Domain.Question> GetQuestionList()
        {
            return qaRepos.GetQuestionList();
        }

        public List<Cholestabetes.Domain.Question> GetQuestionList(int screenID)
        {
            return qaRepos.GetQuestionList(screenID);

        }

        public void ClearAnswers(int userID, int screenID)
        {

            qaRepos.ClearAnswers(userID, screenID); //clear existing answers
        }

        public void Save(List<AnsweredQuestion> lst)
        {

            qaRepos.Save(lst);

        }

        public List<AnsweredQuestion> GetUserAnswers(int userID, int screenID)
        {

            return qaRepos.GetUserAnswers(userID, screenID);
        }
    }
}
