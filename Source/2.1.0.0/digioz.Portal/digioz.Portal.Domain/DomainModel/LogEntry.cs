using System;

namespace digioz.Portal.Domain.DomainModel
{
    public class LogEntry
    {
        public DateTime Date { get; set; }
        public string Module { get; set;}
        public string Method { get; set; }
        public string ErrorMessage { get; set; }
    }
}
