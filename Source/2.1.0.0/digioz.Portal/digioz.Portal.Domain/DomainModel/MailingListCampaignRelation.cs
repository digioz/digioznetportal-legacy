using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class MailingListCampaignRelation
    {
        public Guid ID { get; set; }

        public Guid MailingListID { get; set; }

        public Guid MailingListCampaignID { get; set; }

        public virtual MailingList MailingList { get; set; }

        public virtual MailingListCampaign MailingListCampaign { get; set; }
    }
}
