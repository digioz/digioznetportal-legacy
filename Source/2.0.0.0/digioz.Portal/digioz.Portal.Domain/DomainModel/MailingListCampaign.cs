using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class MailingListCampaign
    {
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
        [Display(Name = "From Name")]
        public string FromName { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "From Email")]
        [DataType(DataType.EmailAddress)]
        public string FromEmail { get; set; }

        [Required]
        [StringLength(255)]
        public string Summary { get; set; }

        [StringLength(255)]
        public string Banner { get; set; }

        [Required]
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Body { get; set; }

        [Display(Name = "Visitor Count")]
        public int VisitorCount { get; set; }

        [Display(Name = "Date Created")]
        public DateTime DateCreated { get; set; }

        public virtual ICollection<MailingListCampaignRelation> MailingListCampaignRelations { get; set; }
    }
}
