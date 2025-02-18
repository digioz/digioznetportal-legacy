namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Video
    {
        public long ID { get; set; }

        [StringLength(128)]
        public string UserID { get; set; }

        public long? AlbumID { get; set; }

        public string Filename { get; set; }

        public string Description { get; set; }

        public DateTime? Timestamp { get; set; }

        public bool? Approved { get; set; }

        public bool? Visible { get; set; }

        public string Thumbnail { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        public virtual VideoAlbum VideoAlbum { get; set; }
    }
}
