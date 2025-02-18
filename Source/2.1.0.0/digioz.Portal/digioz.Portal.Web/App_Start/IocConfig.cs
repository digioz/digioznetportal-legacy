using System.Web.Mvc;
using digioz.Portal.Domain;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.IOC;

//[assembly: WebActivator.PreApplicationStartMethod(typeof(IocConfig), "RegisterComponents")]
//[assembly: WebActivator.ApplicationShutdownMethodAttribute(typeof(AppStartUp), "Stop")]


namespace digioz.Portal.Web
{
    public static class IocConfig
    {
        /// <summary>
        /// Starts the application
        /// </summary>
        public static void RegisterComponents()
        {
            UnityMVC5.RegisterComponents();
        }


    }
}
