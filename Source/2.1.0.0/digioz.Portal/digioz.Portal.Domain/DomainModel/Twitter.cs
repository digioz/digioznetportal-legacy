using digioz.Portal.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class Twitter : Entity
    {
        public Twitter(string twitterHandle, bool enabled)
        {
            Id = GuidComb.GenerateComb();
            TwitterHandle = twitterHandle;
            TwitterUser = TwitterHandle.Replace("@", "");
            Enabled = enabled;
        }
        public Guid Id { get; set; }
        public string TwitterHandle { get; set; }
        public string TwitterUser { get; set; }
        public bool Enabled { get; set; }
    }
}
