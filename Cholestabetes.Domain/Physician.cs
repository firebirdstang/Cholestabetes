using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.Domain
{
    public class Physician
    {
        public string Firstname { get; set; }
        public string LastName { get; set; }
        public string Name
        {

            get
            {
                return Firstname + " " + LastName;
            }
        }
        public int UserID { get; set; }
    }
}
