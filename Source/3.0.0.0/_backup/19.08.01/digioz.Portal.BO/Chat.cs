namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Chat
    {
        public int ID { get; set; }

        [StringLength(128)]
        public string UserID { get; set; }

        public string Message { get; set; }

        public DateTime Timestamp { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}
