namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class VisitorInfo
    {
        public int ID { get; set; }

        [Required]
        [StringLength(25)]
        public string IPAddress { get; set; }

        public string PageURL { get; set; }

        public string ReferringURL { get; set; }

        [StringLength(100)]
        public string BrowserName { get; set; }

        [StringLength(100)]
        public string BrowserType { get; set; }

        public string BrowserUserAgent { get; set; }

        [StringLength(20)]
        public string BrowserVersion { get; set; }

        public bool IsCrawler { get; set; }

        public string JSVersion { get; set; }

        [StringLength(20)]
        public string OperatingSystem { get; set; }

        public string Keywords { get; set; }

        [StringLength(20)]
        public string SearchEngine { get; set; }

        [StringLength(30)]
        public string Country { get; set; }

        [StringLength(100)]
        public string Language { get; set; }

        public DateTime Timestamp { get; set; }
    }
}
