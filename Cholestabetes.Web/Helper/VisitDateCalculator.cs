using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cholestabetes.Web.Helper
{
    public class VisitDateCalculator
    {

        public static DateTime GetVisit2StartDate(DateTime? now)
        {
            //8 weeks
           return now.Value.AddDays(7 * 8); 
        }

        public static DateTime GetVisit2EndDate(DateTime? now)
        {
            //20 weeks
            return now.Value.AddDays(7 * 20);
        }


        public static DateTime GetVisit3StartDate(DateTime now)
        {

            //6 weeks
            return now.AddDays(7 * 6); 
        }

        public static DateTime GetVisit3EndDate(DateTime? now)
        {
            //30 weeks
            return now.Value.AddDays(7 * 30); 

        }
    }
}