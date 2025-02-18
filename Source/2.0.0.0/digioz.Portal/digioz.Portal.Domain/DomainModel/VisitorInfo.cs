using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.DomainModel
{
    public class VisitorInfo
    {
        public int ID { get; set; }
        [Required]
        [StringLength(25)]
        [DisplayName("IP Address")]
        public string IPAddress { get; set; }
        [DisplayName("Page URL")]
        public string PageURL { get; set; }
        [DisplayName("Referring URL")]
        public string ReferringURL { get; set; }
        [StringLength(100)]
        public string BrowserName { get; set; }
        [StringLength(100)]
        public string BrowserType { get; set; }
        public string BrowserUserAgent { get; set; }
        [StringLength(20)]
        public string BrowserVersion { get; set; }
        [DisplayName("Is Crawler")]
        public bool IsCrawler { get; set; }
        public string JSVersion { get; set; }
        [StringLength(20)]
        [DisplayName("Operating System")]
        public string OperatingSystem { get; set; }
        public string Keywords { get; set; }
        [StringLength(20)]
        [DisplayName("Search Engine")]
        public string SearchEngine { get; set; }
        [StringLength(30)]
        public string Country { get; set; }
        [StringLength(100)]
        [DisplayName("Language")]
        public string Language { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
