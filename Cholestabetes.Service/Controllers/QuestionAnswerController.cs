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
    [RoutePrefix("QuestionAnswer")]
    public class QuestionAnswerController : ApiController
    {

        QuestionAnswerRepository qaRepos = new Repositories.QuestionAnswerRepository();

        [Route("LastScreenInSurvey")]
        public int? GetLastScreenInSurvey(int physicianID)
        {
            return qaRepos.GetLastScreenInSurvey(physicianID);

        }

        [Route("QuestionList")]
        public List<Cholestabetes.Domain.Question> GetQuestionList()
        {
            return qaRepos.GetQuestionList();
        }

        [Route("QuestionList")]
        public List<Cholestabetes.Domain.Question> GetQuestionList(int screenID)
        {
            return qaRepos.GetQuestionList(screenID);

        }

        [Route("ClearAnswers")]
        public void ClearAnswers(int userID, int screenID)
        {

            qaRepos.ClearAnswers(userID, screenID); //clear existing answers
        }

        [Route("Save")]
        public void Save(List<AnsweredQuestion> lst)
        {

            qaRepos.Save(lst);

        }

        [Route("UserAnswers")]
        public List<AnsweredQuestion> GetUserAnswers(int userID, int screenID)
        {

            return qaRepos.GetUserAnswers(userID, screenID);
        }
    }
}
