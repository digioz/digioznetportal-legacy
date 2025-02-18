using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IReportService
    {
        void MemberReport(Report report);
        void PostReport(Report report);
    }
}
