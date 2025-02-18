using System;
using System.Collections.Generic;
using System.Linq;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;

namespace digioz.Portal.Data.Repositories
{
    public class UploadedFileRepository : IUploadedFileRepository
    {
        private readonly digiozPortalEntities _context;
        public UploadedFileRepository(digiozPortalEntities context)
        {
            _context = context;
        }

        public UploadedFile Add(UploadedFile uploadedFile)
        {
            return _context.UploadedFile.Add(uploadedFile);
        }

        public void Delete(UploadedFile uploadedFile)
        {
            _context.UploadedFile.Remove(uploadedFile);
        }

        public IList<UploadedFile> GetAll()
        {
            return _context.UploadedFile.ToList();
        }

        public IList<UploadedFile> GetAllByPost(Guid postId)
        {
            return _context.UploadedFile.Where(x => x.Post.Id == postId).ToList();
        }

        public IList<UploadedFile> GetAllByUser(string membershipUserId)
        {
            return _context.UploadedFile.Where(x => x.MembershipUser.Id == membershipUserId).ToList();
        }

        public UploadedFile Get(Guid id)
        {
            return _context.UploadedFile.FirstOrDefault(x => x.Id == id);
        }
    }
}
