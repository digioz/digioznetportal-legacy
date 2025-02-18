using digioz.Portal.Domain;

namespace digioz.Portal.Web.Application.Localization
{
    public delegate LocalizedString Localizer(string text, params object[] args);
}