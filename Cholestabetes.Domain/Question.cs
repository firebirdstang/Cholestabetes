using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class Question
    {

        public Question()
        {
            Answers = new List<Answer>();
        }

        public int ID { get; set; }
        public string Text { get; set; }
        public string Type { get; set; }
        public int? Required { get; set; }
        public int? Sequence { get; set; }
        public int  Screen { get; set; }
        public int LeftToRight { get; set; }

        public List<Answer> Answers { get; set; }
    }
}
