namespace digioz.Portal.Domain.DomainModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
   
    public partial class Video
    {
        public long ID { get; set; }
        public string UserID { get; set; }
        public Nullable<long> AlbumID { get; set; }
        public string Filename { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> Timestamp { get; set; }
        public Nullable<bool> Approved { get; set; }
        public Nullable<bool> Visible { get; set; }
        public string Thumbnail { get; set; }

        [ForeignKey("UserID")]
        [InverseProperty("Videos")]
        public virtual MembershipUser AspNetUser { get; set; }

        [ForeignKey("AlbumID")]
        [InverseProperty("Videos")]
        public virtual VideoAlbum VideoAlbum { get; set; }
    }
}
