using System;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class BannedWord
    {
        public BannedWord()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public string Word { get; set; }
        public DateTime DateAdded { get; set; }
    }
}
