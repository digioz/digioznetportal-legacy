using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    public class PrivateMessageLogic : BaseLogic
    {
        public static List<PrivateMessage> GetByUserId(string userId)
        {
            var pms = Db.PrivateMessage.Where(x => x.UserTo.Id == userId).OrderByDescending(x => x.DateSent).ToList();

            return pms;
        }
    }
}
