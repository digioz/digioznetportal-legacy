namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Log
    {
        public long ID { get; set; }
        public string Message { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
    }
}
