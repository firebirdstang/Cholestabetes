using Cholestabetes.Web.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cholestabetes.Mobile.Helper
{
    public class UserUtility
    {

        private const string USER = "USER";


        public static void ReloadUser(System.Web.HttpSessionStateBase session,string userName)
        {
            LoadDataIntoSession(session,userName);
        }

        public static void SetLoggedInUser(Domain.User user, System.Web.HttpSessionStateBase session)
        {
            session[USER] = user;
        }

        public static Domain.User GetLoggedInUser(System.Web.HttpSessionStateBase session, string userName)
        {
            if (session[USER] == null)

                LoadDataIntoSession(session, userName);

            return session[USER] as Domain.User;

        }


        private static void LoadDataIntoSession(System.Web.HttpSessionStateBase session, string userName)
        {
            Repositories.UserRepository userRepo = new Repositories.UserRepository();

            Domain.User loggedUser = userRepo.GetUserDetails(userName);

            if (loggedUser != null)
            {
                loggedUser.Roles.AddRange(userRepo.GetRolesAsArray(loggedUser.Username));

                session[USER] = loggedUser;
            }

        }
    }
}
