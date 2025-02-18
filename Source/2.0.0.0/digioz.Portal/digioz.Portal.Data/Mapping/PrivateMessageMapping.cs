using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class PrivateMessageMapping : EntityTypeConfiguration<PrivateMessage>
    {
        public PrivateMessageMapping()
        {
            HasKey(x => x.Id);
            
                HasRequired(x => x.UserFrom)
                    .WithMany(x => x.PrivateMessagesReceived)
                    .Map(x => x.MapKey("UserFrom_Id"));

                HasRequired(x => x.UserTo)
                    .WithMany(x => x.PrivateMessagesSent)
                    .Map(x => x.MapKey("UserTo_Id"));
        }
    }
}
