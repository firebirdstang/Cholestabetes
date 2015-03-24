using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class AnsweredQuestion
    {
        public int UserID { get; set; }
        public int QID { get; set; }
        public int AID { get; set; }
        public string Answer { get; set; }

    }
}
