namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Comment
    {
        public string Id { get; set; }

        public string ParentId { get; set; }

        public string UserId { get; set; }

        public string Username { get; set; }

        public string ReferenceId { get; set; }

        public string ReferenceType { get; set; }

        public string Body { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int Likes { get; set; }
    }
}
