namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class MailingListCampaign
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MailingListCampaign()
        {
            MailingListCampaignRelations = new HashSet<MailingListCampaignRelation>();
        }

        public Guid ID { get; set; }

        [Required]
        [StringLength(255)]
        public string Name { get; set; }

        [Required]
        [StringLength(255)]
        public string Subject { get; set; }

        [Required]
        [StringLength(50)]
        public string FromName { get; set; }

        [Required]
        [StringLength(50)]
        public string FromEmail { get; set; }

        [Required]
        [StringLength(255)]
        public string Summary { get; set; }

        [StringLength(255)]
        public string Banner { get; set; }

        [Required]
        public string Body { get; set; }

        public int VisitorCount { get; set; }

        public DateTime DateCreated { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MailingListCampaignRelation> MailingListCampaignRelations { get; set; }
    }
}
