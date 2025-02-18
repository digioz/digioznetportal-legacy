using System;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class BannedEmail
    {
        public BannedEmail()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public string Email { get; set; }
        public DateTime DateAdded { get; set; }
    }
}
