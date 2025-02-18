using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class Comment
    {
        public string Id { get; set; }
        [DisplayName("Parent")]
        public string ParentId { get; set; }
        [DisplayName("User")]
        public string UserId { get; set; }
        public string Username { get; set; }
        [DisplayName("Reference Id")]
        public string ReferenceId { get; set; }
        [DisplayName("Reference Type")]
        public string ReferenceType { get; set; }
        [DisplayName("Message")]
        public string Body { get; set; }
        [DisplayName("Created Date")]
        public DateTime CreatedDate { get; set; }
        [DisplayName("Modified Date")]
        public DateTime ModifiedDate { get; set; }
        public int Likes { get; set; }

    }
}
