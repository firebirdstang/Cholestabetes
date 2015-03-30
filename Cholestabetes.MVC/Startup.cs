using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cholestabetes.MVC.Startup))]
namespace Cholestabetes.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
