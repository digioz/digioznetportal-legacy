namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class LogVisitor
    {
        public long ID { get; set; }
        public string IPAddress { get; set; }
        public string BrowserType { get; set; }
        public string Language { get; set; }
        public Nullable<bool> IsBot { get; set; }
        public string Country { get; set; }
        public string ReferringURL { get; set; }
        public string SearchString { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
    }
}
