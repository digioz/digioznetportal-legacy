using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace digioz.Portal.Web.Areas.Admin.Models.FileManager
{
    public sealed class FileManagerSection :
    ConfigurationSection
    {
        public FileManagerSection()
            : base()
        {

        }

        [ConfigurationProperty("dotFiles")]
        public string DotFiles
        {
            get
            {
                return this["dotFiles"].ToString();
            }
            set
            {
                this["dotFiles"] = value;
            }
        }

        [ConfigurationProperty("uplMaxSize", DefaultValue = 5)]
        public int UplMaxSize
        {
            get
            {
                return (int)this["uplMaxSize"];
            }
            set
            {
                this["uplMaxSize"] = value;
            }
        }

        [ConfigurationProperty("cacheDuration", DefaultValue=10)]
        public int CacheDuration
        {
            get
            {
                return (int)this["cacheDuration"];
            }
            set
            {
                this["cacheDuration"] = value;
            }
        }

        [ConfigurationProperty("uploadOrder", DefaultValue = "deny,allow")]
        public string uploadOrder
        {
            get
            {
                return this["uploadOrder"].ToString();
            }
            set
            {
                this["uploadOrder"] = value;
            }
        }

        [ConfigurationProperty("Root")]
        public RootElement Root
        {
            get
            {
                return (RootElement)this["Root"];
            }
            set
            {
                this["Root"] = value;
            }
        }

        [ConfigurationProperty("Thumbnails")]
        public ThumbnailElement Thumbnails
        {
            get
            {
                return (ThumbnailElement)this["Thumbnails"];
            }
            set
            {
                this["Thumbnails"] = value;
            }
        }

        [ConfigurationProperty("ArcApp")]
        public ArcAppElement ArcApp
        {
            get
            {
                return (ArcAppElement)this["ArcApp"];
            }
            set
            {
                this["ArcApp"] = value;
            }
        }

        [ConfigurationProperty("DisabledCommands")]
        public NamedElementsCollection DisabledCommands
        {
            get
            {
                return (NamedElementsCollection)this["DisabledCommands"];
            }
            set
            {
                this["DisabledCommands"] = value;
            }
        }

        [ConfigurationProperty("DisabledMimeTypes")]
        public NamedElementsCollection DisabledMimeTypes
        {
            get
            {
                return (NamedElementsCollection)this["DisabledMimeTypes"];
            }
            set
            {
                this["DisabledMimeTypes"] = value;
            }
        }

        [ConfigurationProperty("ArchivesMimeTypes")]
        public NamedElementsCollection ArchivesMimeTypes
        {
            get
            {
                return (NamedElementsCollection)this["ArchivesMimeTypes"];
            }
            set
            {
                this["ArchivesMimeTypes"] = value;
            }
        }

        [ConfigurationProperty("uploadDeny")]
        public NamedElementsCollection uploadDeny
        {
            get
            {
                return (NamedElementsCollection)this["uploadDeny"];
            }
            set
            {
                this["uploadDeny"] = value;
            }
        }

        [ConfigurationProperty("uploadAllow")]
        public NamedElementsCollection uploadAllow
        {
            get
            {
                return (NamedElementsCollection)this["uploadAllow"];
            }
            set
            {
                this["uploadAllow"] = value;
            }
        }
    }

    public sealed class RootElement : ConfigurationElement
    {
        public RootElement()
            : base() 
        {
        }

        [ConfigurationProperty("Path")]
        public string Path
        {
            get
            {
                return this["Path"].ToString();
            }
            set
            {
                this["Path"] = value;
            }
        }

        [ConfigurationProperty("Url")]
        public string Url
        {
            get
            {
                return this["Url"].ToString();
            }
            set
            {
                this["Url"] = value;
            }
        }

        [ConfigurationProperty("Alias")]
        public string Alias
        {
            get
            {
                return this["Alias"].ToString();
            }
            set
            {
                this["Alias"] = value;
            }
        }
    }

    public sealed class ThumbnailElement : ConfigurationElement
    {
        public ThumbnailElement()
            : base()
        {
        }

        [ConfigurationProperty("TmbDirectory")]
        public string TmbDirectory
        {
            get
            {
                return this["TmbDirectory"].ToString();
            }
            set
            {
                this["TmbDirectory"] = value;
            }
        }

        [ConfigurationProperty("TmbUrl")]
        public string TmbUrl
        {
            get
            {
                return this["TmbUrl"].ToString();
            }
            set
            {
                this["TmbUrl"] = value;
            }
        }

        [ConfigurationProperty("TmbAtOnce")]
        public int TmbAtOnce
        {
            get
            {
                return (int)this["TmbAtOnce"];
            }
            set
            {
                this["TmbAtOnce"] = value;
            }
        }
    }

    public sealed class ArcAppElement : ConfigurationElement
    {
        public ArcAppElement()
            : base()
        {
        }

        [ConfigurationProperty("ArcAppPath")]
        public string ArcAppPath
        {
            get
            {
                return this["ArcAppPath"].ToString();
            }
            set
            {
                this["ArcAppPath"] = value;
            }
        }
            }

    public class NamedElement : ConfigurationElement
    {
        public NamedElement()
            : base()
        {
            
        }

        [ConfigurationProperty("Name",
            IsRequired = true,
            IsKey = true)]
        public string Name
        {
            get
            {
                return (string)this["Name"];
            }
            set
            {
                this["Name"] = value;
            }
        }        
    }



    public class NamedElementsCollection :
        ConfigurationElementCollection
    {
        public NamedElementsCollection()
        {
            NamedElement command =
                (NamedElement)CreateNewElement();
            BaseAdd(command);
        }


        protected override ConfigurationElement CreateNewElement()
        {
            return new NamedElement();
        }

        protected override Object GetElementKey(ConfigurationElement element)
        {
            return ((NamedElement)element).Name;
        }

        new public NamedElement this[string Name]
        {
            get
            {
                return (NamedElement)BaseGet(Name);
            }
        }

        public int IndexOf(NamedElement command)
        {
            return BaseIndexOf(command);
        }        
    }
}
