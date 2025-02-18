using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;

namespace digioz.Portal.Web.Areas.Admin.Models.FileManager
{
    public static class Configuration
    {
        public static bool _isLoaded = false;

        public static string RootPath { get; private set; }

        public static string RootUrl { get; private set; }

        public static string RootAlias { get; private set; }

        public static string DotFiles { get; private set; }

        public static int UplMaxSize { get; private set; }

        public static string TmbDir { get; private set; }

        public static string TmbUrl { get; private set; }

        public static int TmbsAtOnce { get; private set; }

        public static string ArcAppPath { get; private set; }

        public static int CacheDuration { get; private set; }

        public static string uploadOrder { get; private set; }

        public static IEnumerable<string> DisabledCommands { get; private set; }

        public static IEnumerable<string> DisabledMimeTypes { get; private set; }

        public static IEnumerable<string> uploadDeny { get; private set; }

        public static IEnumerable<string> uploadAllow { get; private set; }

        public static IEnumerable<string> ArchiveMimeTypes { get; private set; }

        public static IEnumerable<string> ExtractMimeTypes { get; private set; }

        public static void Init(System.Web.HttpContextBase context)
        {
            if (_isLoaded)
                return;

            

            var section = (FileManagerSection)ConfigurationManager.GetSection("fileManager");

            TmbsAtOnce = section.Thumbnails.TmbAtOnce;

            CacheDuration = section.CacheDuration;

            TmbDir = context.Server.MapPath(section.Thumbnails.TmbDirectory);

            TmbUrl = section.Thumbnails.TmbUrl;

            RootPath = context.Server.MapPath(section.Root.Path);
            RootPath = RootPath.TrimEnd(Path.DirectorySeparatorChar);

            RootUrl = section.Root.Url;

            RootAlias = section.Root.Alias;

            DotFiles = section.DotFiles;

            UplMaxSize = section.UplMaxSize;

            ArcAppPath = section.ArcApp.ArcAppPath;

            uploadOrder = section.uploadOrder;

            if(section.uploadAllow.Count > 0)
                uploadAllow = section.uploadAllow.Cast<NamedElement>().Where(x => x.Name != string.Empty).Select(x => x.Name);
            else
                uploadAllow = new List<string>();

            if (section.uploadDeny.Count > 0)
                uploadDeny = section.uploadDeny.Cast<NamedElement>().Where(x => x.Name != string.Empty).Select(x => x.Name);
            else
                uploadDeny = new List<string>();

            if (section.DisabledCommands.Count > 0)
            {
                DisabledCommands = section.DisabledCommands.Cast<NamedElement>().Where(x=>x.Name!=string.Empty).Select(x => x.Name);
            }
            else
            {
                DisabledCommands = new List<string>();
            }

            if (section.DisabledMimeTypes.Count > 0)
            {
                DisabledMimeTypes = section.DisabledMimeTypes.Cast<NamedElement>().Where(x => x.Name != string.Empty).Select(x => x.Name);
            }
            else
            {
                DisabledMimeTypes = new List<string>();
            }

            if (section.ArchivesMimeTypes.Count > 0)
            {
                ArchiveMimeTypes = section.ArchivesMimeTypes.Cast<NamedElement>().Where(x => x.Name != string.Empty).Select(x => x.Name);
            }
            else
            {
                ArchiveMimeTypes = new List<string>();
            }

            if (section.ArchivesMimeTypes.Count > 0)
            {
                ExtractMimeTypes = section.ArchivesMimeTypes.Cast<NamedElement>().Where(x => x.Name != string.Empty).Select(x => x.Name);
            }
            else
            {
                ExtractMimeTypes = new List<string>();
            }
        }
    }
}
