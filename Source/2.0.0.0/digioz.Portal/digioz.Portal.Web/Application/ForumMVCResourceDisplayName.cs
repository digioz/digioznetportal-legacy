using System.ComponentModel;
using System.Web.Mvc;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Web.Application
{
    public class MvcResourceDisplayName: DisplayNameAttribute, IModelAttribute
    {
            private string _resourceValue = string.Empty;

            public MvcResourceDisplayName(string resourceKey)
                : base(resourceKey)
            {
                ResourceKey = resourceKey;
            }

            public string ResourceKey { get; set; }

            public override string DisplayName
            {
                get
                {
                    var localizationService = DependencyResolver.Current.GetService<ILocalizationService>();
                    _resourceValue = localizationService.GetResourceString(ResourceKey.Trim());
                    return _resourceValue;
                }
            }

            public string Name
            {
                get { return "FMVCResourceDisplayName"; }
            }

    }
}

