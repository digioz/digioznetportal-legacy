namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class CommentLike
    {
        public string Id { get; set; }

        public string UserId { get; set; }

        public string CommentId { get; set; }
    }
}
