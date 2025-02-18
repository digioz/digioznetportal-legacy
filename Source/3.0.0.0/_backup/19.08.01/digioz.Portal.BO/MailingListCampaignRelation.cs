namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class MailingListCampaignRelation
    {
        public Guid ID { get; set; }

        public Guid MailingListID { get; set; }

        public Guid MailingListCampaignID { get; set; }

        public virtual MailingList MailingList { get; set; }

        public virtual MailingListCampaign MailingListCampaign { get; set; }
    }
}
