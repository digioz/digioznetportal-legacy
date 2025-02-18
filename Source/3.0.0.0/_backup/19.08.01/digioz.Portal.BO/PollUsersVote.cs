namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class PollUsersVote
    {
        public int Id { get; set; }

        public string UserId { get; set; }

        public string PollId { get; set; }

        public DateTime DateVoted { get; set; }
    }
}
