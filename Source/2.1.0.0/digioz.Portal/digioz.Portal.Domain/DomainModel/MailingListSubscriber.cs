using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public partial class MailingListSubscriber
    {
        public MailingListSubscriber()
        {
            MailingListSubscriberRelations = new HashSet<MailingListSubscriberRelation>();
        }

        public Guid ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [StringLength(50)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Enabled")]
        public bool Status { get; set; }

        [Display(Name = "Date Created")]
        public DateTime DateCreated { get; set; }

        [Display(Name = "Date Modified")]
        public DateTime DateModified { get; set; }

        public virtual ICollection<MailingListSubscriberRelation> MailingListSubscriberRelations { get; set; }
    }
}
