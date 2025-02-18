namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class VisitorSession
    {
        public int Id { get; set; }

        [Required]
        [StringLength(25)]
        public string IpAddress { get; set; }

        public string PageUrl { get; set; }

        public string SessionId { get; set; }

        public string UserName { get; set; }

        public DateTime DateCreated { get; set; }

        public DateTime DateModified { get; set; }
    }
}
