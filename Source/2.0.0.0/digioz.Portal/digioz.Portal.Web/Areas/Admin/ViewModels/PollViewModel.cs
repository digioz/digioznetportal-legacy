using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class PollViewModel
    {
        public Poll Poll { get; set; }
        public List<PollAnswer> PollAnswers { get; set; }
    }
}
