using System;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ISettingsRepository
    {
        Settings GetSettings();

        Settings Add(Settings item);
        Settings Get(Guid id);
        void Update(Settings item);
    }
}
