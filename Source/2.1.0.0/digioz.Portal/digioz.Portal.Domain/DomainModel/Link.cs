using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;
    
    public partial class Link
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Description { get; set; }
        [DisplayName("Category")]
        public int LinkCategoryID { get; set; }
        public bool? Visible { get; set; }
        public DateTime? Timestamp { get; set; }

        [ForeignKey("LinkCategoryID")]
        public virtual LinkCategory LinkCategory { get; set; }
    }

    public class Group<K, T>
    {
        public K Key;
        public IEnumerable<T> Values;
    }
}
