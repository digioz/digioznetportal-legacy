namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class LogVisitor
    {
        public long ID { get; set; }

        public string IPAddress { get; set; }

        public string BrowserType { get; set; }

        public string Language { get; set; }

        public bool? IsBot { get; set; }

        public string Country { get; set; }

        public string ReferringURL { get; set; }

        public string SearchString { get; set; }

        public DateTime? Timestamp { get; set; }
    }
}
