using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface ILoggingService
    {
        void Error(string message);
        void Error(Exception ex);
        void Initialise(int maxLogSize);
        IList<LogEntry> ListLogFile();
        void Recycle();
        void ClearLogFiles();
    }
}
