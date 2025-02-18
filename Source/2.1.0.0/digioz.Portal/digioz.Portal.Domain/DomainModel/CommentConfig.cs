using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class CommentConfig
    {
        public string Id { get; set; }
        public string ReferenceId { get; set; }
        public string ReferenceType { get; set; }
        public string ReferenceTitle { get; set; }
        public bool Visible { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
