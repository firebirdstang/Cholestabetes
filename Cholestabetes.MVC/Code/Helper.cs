﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cholestabetes.MVC.Code
{
    public class Helper
    {
        public static string SERVICE_URL
        {
            get { return "http://localhost/ser/"; }
        }

        public static string API_NAME
        {
            get;
            set;
        }

        public static string GetServiceURL(string path)
        {
            return SERVICE_URL + path;

        }
    }
}
