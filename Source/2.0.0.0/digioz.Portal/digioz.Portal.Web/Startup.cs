using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(digioz.Portal.Web.Startup))]
namespace digioz.Portal.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            // SignalR: Any connection or hub wire 
            // up and configuration should go here
            app.MapSignalR();
        }
    }
}
