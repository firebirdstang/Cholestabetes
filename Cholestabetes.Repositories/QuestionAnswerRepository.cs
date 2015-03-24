using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Data;
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class QuestionAnswerRepository : BaseRepository
    {

        public int? GetLastScreenInSurvey(int physicianID)
        {
          return Entites.sp_GetLastScreenInSurvey(  physicianID).ToList()[0];

        }

        public List<Cholestabetes.Domain.Question> GetQuestionList()
        {
            int lastQID = -1;

            bool addQuestion = false;

            List<Cholestabetes.Domain.Question> questionLst = new List<Domain.Question>();

            foreach (sp_GetQuestionsAnswers_Result item in Entites.sp_GetQuestionsAnswers().ToList())
            {
                Domain.Question question = null;

                if (lastQID != item.QuestionID)
                {

                    question = new Domain.Question();

                    question.ID = item.QuestionID;
                    question.Required = item.QuestionRequired;
                    question.Sequence = item.QuestionSequence;
                    question.Text = item.QuestionText;
                    question.Type = item.QuestionType;


                    addQuestion = true;

                }
                else
                {
                    question = questionLst[questionLst.Count - 1] as Domain.Question;

                    addQuestion = false;
                }

                //getting answers
                Domain.Answer ans = new Domain.Answer();
                ans.ID = item.AnswerID;
                ans.QID = item.AnswerQuestionID;
                ans.Text = item.AnswerText;

                question.Answers.Add(ans);

                if (addQuestion)
                    questionLst.Add(question);

                lastQID = item.QuestionID;

            }

            return questionLst;

        }

        public List<Cholestabetes.Domain.Question> GetQuestionList(int screenID)
        {
            int lastQID = -1;

            bool addQuestion = false;

            List<Cholestabetes.Domain.Question> questionLst = new List<Domain.Question>();

            foreach (sp_GetQuestionsAnswersByScreen_Result item in Entites.sp_GetQuestionsAnswersByScreen(screenID).ToList())
            {
                Domain.Question question = null;

                if (lastQID != item.QuestionID)
                {

                    question = new Domain.Question();

                    question.ID = item.QuestionID;
                    question.Required = item.QuestionRequired;
                    question.Sequence = item.QuestionSequence;
                    question.Text = item.QuestionText;
                    question.Type = item.QuestionType;
                    question.Screen = item.Screen.Value;

                    addQuestion = true;

                }
                else
                {
                    question = questionLst[questionLst.Count - 1] as Domain.Question;

                    addQuestion = false;
                }

                //getting answers
                Domain.Answer ans = new Domain.Answer();
                ans.ID = item.AnswerID;
                ans.QID = item.AnswerQuestionID;
                ans.Text = item.AnswerText;

                question.Answers.Add(ans);

                if (addQuestion)
                    questionLst.Add(question);

                lastQID = item.QuestionID;

            }

            return questionLst;

        }

        //public void ClearAnswers(int userID)
        //{

        //    Entites.sp_ClearAnswers(userID); //clear existing answers
        //}

        public void ClearAnswers(int userID, int screenID)
        {

            Entites.sp_ClearAnswersByScreen(userID, screenID); //clear existing answers
        }

        public void Save(List<AnsweredQuestion> lst)
        {

            foreach (AnsweredQuestion item in lst)
            {
                Entites.sp_SaveAnswer
                                     (
                                        item.UserID,
                                        item.QID,
                                        item.AID,
                                        item.Answer
                                    );
            }

        }

        //public List<AnsweredQuestion> GetUserAnswers(int userID)
        //{
        //    return Entites.UserAnswers.Where(ua => ua.UserID == userID).Select(ua => new AnsweredQuestion() { QID = ua.QID.Value, AID = ua.AID.Value }).ToList();

        //}

        public List<AnsweredQuestion> GetUserAnswers(int userID, int screenID)
        {

            var query = from ua in Entites.UserAnswers.Where(ua => ua.UserID == userID)
                        from q in Entites.Questions.Where(q => q.Screen == screenID).DefaultIfEmpty()
                        select new AnsweredQuestion() { QID = ua.QID.Value, AID = ua.AID.Value , Answer=ua.Answer};

            return query.ToList();
        }

    }
}
