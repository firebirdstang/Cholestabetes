using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Repositories;

using Cholestabetes.EmailReminder;
using System.Configuration;
using System.Diagnostics;

namespace Cholestabetes.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            bool errored = false;
            string mssg = string.Empty;
        
            try
            {

                //throw new Exception("test exception");

                Emailer emailer = new Emailer(
                                                ConfigurationSettings.AppSettings["smtpServer"].ToString(),
                                                ConfigurationSettings.AppSettings["smtpUser"].ToString(),
                                                ConfigurationSettings.AppSettings["smtpPassword"].ToString(),
                                                ConfigurationSettings.AppSettings["emailGeneral"].ToString(),
                                                Int32.Parse(ConfigurationSettings.AppSettings["smtpPort"].ToString())
                                             );

                emailer.SendNotifications();

            }
            catch (Exception exc)
            {
                errored = true;
                mssg    = exc.ToString() ;
               
            }
            finally
            {
                if ( ! errored) 
                    
                    mssg = "Successfully completed";
                
                string log = "-------------------------------------";
                log = Environment.NewLine + DateTime.Now.ToString("F") + Environment.NewLine + mssg + Environment.NewLine;
                log += "-------------------------------------";

                TextWriterTraceListener logListener = new TextWriterTraceListener("EmailReminderLog.txt", "EmailReminderLog");

                Trace.Listeners.Add(logListener);

                Trace.WriteLine(log);

                Trace.Flush();

            }

        }
    }
}
