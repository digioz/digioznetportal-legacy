namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Log
    {
        public long ID { get; set; }

        public string Message { get; set; }

        public DateTime? Timestamp { get; set; }
    }
}
