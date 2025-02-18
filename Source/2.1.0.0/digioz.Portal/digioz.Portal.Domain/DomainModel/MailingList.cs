using digioz.Portal.Domain.DomainModel.Attributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class MailingList
    {
        public MailingList()
        {
            MailingListCampaignRelations = new HashSet<MailingListCampaignRelation>();
            MailingListSubscriberRelations = new HashSet<MailingListSubscriberRelation>();
        }

        public Guid ID { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "List Name")]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name="From Email")]
        public string DefaultEmailFrom { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "From Name")]
        public string DefaultFromName { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string Address { get; set; }

        public virtual ICollection<MailingListCampaignRelation> MailingListCampaignRelations { get; set; }

        public virtual ICollection<MailingListSubscriberRelation> MailingListSubscriberRelations { get; set; }
    }
}
