﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace digioz.Portal.Web.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class digiozPortalEntities : DbContext
    {
        public digiozPortalEntities()
            : base("name=digiozPortalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Announcement> Announcements { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<UserClaim> UserClaims { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<Link> Links { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
        public virtual DbSet<LogVisitor> LogVisitors { get; set; }
        public virtual DbSet<Config> Configs { get; set; }
        public virtual DbSet<Picture> Pictures { get; set; }
        public virtual DbSet<PictureAlbum> PictureAlbums { get; set; }
        public virtual DbSet<Video> Videos { get; set; }
        public virtual DbSet<VideoAlbum> VideoAlbums { get; set; }
    }
}
