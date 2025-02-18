namespace digioz.Portal.BO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Profile
    {
        public int ID { get; set; }

        [StringLength(128)]
        public string UserID { get; set; }

        public string Email { get; set; }

        public DateTime? Birthday { get; set; }

        public bool? BirthdayVisible { get; set; }

        public string Address { get; set; }

        public string Address2 { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public string Zip { get; set; }

        public string Country { get; set; }

        public string Signature { get; set; }

        public string Avatar { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}
