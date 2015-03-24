using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace Cholestabetes.Domain
{
    public class Helper
    {

        //public static DateTime GetCanadianDateFormatInDate(string dt)
        //{
        //    return DateTime.Parse(DateTime.Parse(dt).ToString("dd/MM/yyyy"));
        //}

        //public static string GetCanadianDateFormat(string dt)
        //{
        //    return DateTime.Parse(dt).ToString("dd/MM/yyyy");
        //}


        public static bool IsCanadianDateValid(string dt)
        {
             
            DateTime dateout;

            return DateTime.TryParse(dt, out dateout);
 
        }


        public static DateTime GetCanadianDate (string dt)
        {
            var caCulture = "en-CA";
            var dateValue = DateTime.Parse(dt, new CultureInfo(caCulture, false));

            return dateValue;
        }

        public static string GetCanadianDateStr (string dt)
        {
            var caCulture = "en-CA";
            var dateValue = DateTime.Parse(dt, new CultureInfo(caCulture, false));

            return dateValue.ToString();
        }
    
    }
}
