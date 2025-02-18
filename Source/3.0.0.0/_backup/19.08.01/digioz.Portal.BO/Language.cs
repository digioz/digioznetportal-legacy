namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Language
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string LanguageCulture { get; set; }

        public string FlagImageFileName { get; set; }

        public bool RightToLeft { get; set; }
    }
}
