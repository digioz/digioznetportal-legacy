namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class SlideShow
    {
        public int Id { get; set; }

        public string Image { get; set; }

        public string Description { get; set; }
    }
}
