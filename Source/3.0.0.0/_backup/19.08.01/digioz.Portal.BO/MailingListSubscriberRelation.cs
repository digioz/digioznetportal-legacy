namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class MailingListSubscriberRelation
    {
        public Guid ID { get; set; }

        public Guid MailingListID { get; set; }

        public Guid MailingListSubscriberID { get; set; }

        public virtual MailingList MailingList { get; set; }

        public virtual MailingListSubscriber MailingListSubscriber { get; set; }
    }
}
