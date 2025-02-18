namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Plugin
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        public string DLL { get; set; }

        public bool IsEnabled { get; set; }
    }
}
