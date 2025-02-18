using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Utilities;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to perform VisitorSession 
    /// related Business Logic
    /// </summary>
    public class VisitorSessionLogic : BaseLogic
    {
        /// <summary>
        /// Gets the chat visitor sessions for
        /// the past 1 minute and returns a list
        /// of usernames as a string 
        /// </summary>
        /// <param name="lastOnline">The last online.</param>
        /// <returns></returns>
        public static List<string> GetChatVisitorSessions(DateTime lastOnline)
        {
            var online = Db.VisitorSessions.Where(x => x.PageUrl.Contains("/Chat") && x.DateModified > lastOnline).Select(x => x.UserName).Distinct().ToList();

            return online;
        }

        /// <summary>
        /// Purges the visitor sessions from the
        /// VisitorSessions table that are older than 
        /// the period (min) specified in the configuration
        /// table in the database
        /// </summary>
        public static void PurgeVisitorSessions()
        {
            var configs = ConfigLogic.GetConfig();

            if (!configs["VisitorSessionPurgePeriod"].IsNullEmpty())
            {
                int visitorSessionPurgePeriod = Convert.ToInt32(configs["VisitorSessionPurgePeriod"]);
                var visitorSessionPurgeDate = DateTime.Now.AddMinutes(-visitorSessionPurgePeriod);

                var obsoleteSessions = Db.VisitorSessions.Where(x => x.DateModified < visitorSessionPurgeDate).ToList();

                if (obsoleteSessions.Count > 0)
                {
                    Db.VisitorSessions.RemoveRange(obsoleteSessions);
                    Db.SaveChanges();
                }
            }
            
        }
    }
}
