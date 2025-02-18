using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.Interfaces;

namespace digioz.Portal.Domain.DomainModel
{
    public class RssItem
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Link { get; set; }
        public string RssImage { get; set; }
        public DateTime PublishedDate { get; set; }
    }
}
