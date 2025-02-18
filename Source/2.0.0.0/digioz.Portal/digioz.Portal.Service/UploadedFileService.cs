using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Services
{
    public class UploadedFileService : IUploadedFileService
    {
        private readonly IUploadedFileRepository _uploadedFileRepository;

        public UploadedFileService(IUploadedFileRepository uploadedFileRepository)
        {
            _uploadedFileRepository = uploadedFileRepository;
        }

        public UploadedFile Add(UploadedFile uploadedFile)
        {
            uploadedFile.DateCreated = DateTime.UtcNow;
            return _uploadedFileRepository.Add(uploadedFile);
        }

        public void Delete(UploadedFile uploadedFile)
        {
            _uploadedFileRepository.Delete(uploadedFile);
        }

        public IList<UploadedFile> GetAll()
        {
            return _uploadedFileRepository.GetAll();
        }

        public IList<UploadedFile> GetAllByPost(Guid postId)
        {
            return _uploadedFileRepository.GetAllByPost(postId);
        }

        public IList<UploadedFile> GetAllByUser(string membershipUserId)
        {
            return _uploadedFileRepository.GetAllByUser(membershipUserId);
        }

        public UploadedFile Get(Guid id)
        {
            return _uploadedFileRepository.Get(id);
        }
    }
}
