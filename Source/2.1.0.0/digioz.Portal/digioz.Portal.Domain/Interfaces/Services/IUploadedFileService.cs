using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IUploadedFileService
    {
        UploadedFile Add(UploadedFile uploadedFile);
        void Delete(UploadedFile uploadedFile);
        IList<UploadedFile> GetAll();
        IList<UploadedFile> GetAllByPost(Guid postId);
        IList<UploadedFile> GetAllByUser(string membershipUserId);
        UploadedFile Get(Guid id);  
    }
}
