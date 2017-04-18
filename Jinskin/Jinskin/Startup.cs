using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Jinskin.Startup))]
namespace Jinskin
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
