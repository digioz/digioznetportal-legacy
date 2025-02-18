using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IEmailService
    {
        void SendMail(Email email);
        void SendMail(List<Email> email);
        string EmailTemplate(string to, string content);
    }
}
