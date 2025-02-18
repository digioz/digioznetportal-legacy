using System.ComponentModel.DataAnnotations;

namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class PictureAlbum
    {
        public PictureAlbum()
        {
            this.Pictures = new HashSet<Picture>();
        }
    
        public long ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        [UIHint("tinymce_jquery_full"), AllowHtml]
        public string Description { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
        public Nullable<bool> Visible { get; set; }
    
        public virtual ICollection<Picture> Pictures { get; set; }
    }
}
