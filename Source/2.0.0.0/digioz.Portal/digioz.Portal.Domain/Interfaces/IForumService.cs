using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IForumService
    {
        IPostService Post { get; set; }
        ITopicService Topic { get; set; }

    }
}
