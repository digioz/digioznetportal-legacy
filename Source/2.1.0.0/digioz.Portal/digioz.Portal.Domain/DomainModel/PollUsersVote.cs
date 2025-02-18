using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class PollUsersVote : Entity
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string PollId { get; set; }
        public DateTime DateVoted { get; set; }
    }
}
