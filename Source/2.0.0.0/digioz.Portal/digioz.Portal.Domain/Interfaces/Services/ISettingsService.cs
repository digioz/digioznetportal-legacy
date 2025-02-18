using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.UnitOfWork;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface ISettingsService
    {
        Settings GetSettings(bool useCache = true);
        void Save(Settings settings);
        Settings Add(Settings settings);
    }
}
