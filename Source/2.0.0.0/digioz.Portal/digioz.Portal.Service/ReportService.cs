﻿using System.Text;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Services
{
    public class ReportService : IReportService
    {
        private readonly IEmailService _emailService;
        private readonly ISettingsService _settingsService;
        private readonly ILocalizationService _localizationService;

        public ReportService(IEmailService emailService, ISettingsService settingsService, ILocalizationService localizationService)
        {
            _emailService = emailService;
            _settingsService = settingsService;
            _localizationService = localizationService;
        }

        /// <summary>
        /// Report a member
        /// </summary>
        /// <param name="report"></param>
        public void MemberReport(Report report)
        {
            var sb = new StringBuilder();
            var email = new Email();

            sb.AppendFormat("<p>{2}: <a href=\"{0}\">{1}</a></p>", 
                string.Concat(_settingsService.GetSettings().ForumUrl, report.Reporter.NiceUrl), 
                report.Reporter.UserName,
                _localizationService.GetResourceString("Report.Reporter"));

            sb.AppendFormat("<p>{2}: <a href=\"{0}\">{1}</a></p>", 
                string.Concat(_settingsService.GetSettings().ForumUrl, report.ReportedMember.NiceUrl), 
                report.ReportedMember.UserName,
                _localizationService.GetResourceString("Report.MemberReported"));

            sb.AppendFormat("<p>{0}:</p>", _localizationService.GetResourceString("Report.Reason"));
            sb.AppendFormat("<p>{0}</p>", report.Reason);

            email.EmailFrom = _settingsService.GetSettings().NotificationReplyEmail;
            email.EmailTo = _settingsService.GetSettings().AdminEmailAddress;
            email.Subject = _localizationService.GetResourceString("Report.MemberReport");
            email.NameTo = _localizationService.GetResourceString("Report.Admin");

            email.Body = _emailService.EmailTemplate(email.NameTo, sb.ToString());
            _emailService.SendMail(email);
        }

        /// <summary>
        /// Report a post
        /// </summary>
        /// <param name="report"></param>
        public void PostReport(Report report)
        {
            var sb = new StringBuilder();
            var email = new Email();

            sb.AppendFormat("<p>{2}: <a href=\"{0}\">{1}</a></p>", string.Concat(_settingsService.GetSettings().ForumUrl, report.Reporter.NiceUrl), 
                report.Reporter.UserName,
                _localizationService.GetResourceString("Report.Reporter"));

            sb.AppendFormat("<p>{2}: <a href=\"{0}\">{1}</a></p>", string.Concat(_settingsService.GetSettings().ForumUrl, 
                report.ReportedPost.Topic.NiceUrl), report.ReportedPost.Topic.Name,
                _localizationService.GetResourceString("Report.PostReported"));

            sb.AppendFormat("<p>{0}:</p>", _localizationService.GetResourceString("Report.Reason"));
            sb.AppendFormat("<p>{0}</p>", report.Reason);

            email.EmailFrom = _settingsService.GetSettings().NotificationReplyEmail;
            email.EmailTo = _settingsService.GetSettings().AdminEmailAddress;
            email.Subject = _localizationService.GetResourceString("Report.PostReport");
            email.NameTo = _localizationService.GetResourceString("Report.Admin");

            email.Body = _emailService.EmailTemplate(email.NameTo, sb.ToString());

            _emailService.SendMail(email);
        }
    }
}
