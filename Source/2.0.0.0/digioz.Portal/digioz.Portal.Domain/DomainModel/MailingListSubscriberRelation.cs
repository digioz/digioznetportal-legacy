using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class MailingListSubscriberRelation
    {
        public Guid ID { get; set; }

        public Guid MailingListID { get; set; }

        public Guid MailingListSubscriberID { get; set; }

        public virtual MailingList MailingList { get; set; }

        public virtual MailingListSubscriber MailingListSubscriber { get; set; }
    }
}
