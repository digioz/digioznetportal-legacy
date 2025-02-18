using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class PermissionService : IPermissionService
    {
        private readonly IPermissionRepository _permissionRepository;
        private readonly ICategoryPermissionForRoleRepository _categoryPermissionForRoleRepository;

        public PermissionService(IPermissionRepository permissionRepository, ICategoryPermissionForRoleRepository categoryPermissionForRoleRepository)
        {
            _permissionRepository = permissionRepository;
            _categoryPermissionForRoleRepository = categoryPermissionForRoleRepository;
        }

        /// <summary>
        /// Get all permissions
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Permission> GetAll()
        {
            return _permissionRepository.GetAll();
        }

        /// <summary>
        /// Add a new permission
        /// </summary>
        /// <param name="permission"></param>
        public void Add(Permission permission)
        {
            permission.Name = StringUtils.SafePlainText(permission.Name);
            _permissionRepository.Add(permission);
        }

        /// <summary>
        ///  Delete permission and associated category permission for roles
        /// </summary>
        /// <param name="permission"></param>
        public void Delete(Permission permission)
        {
            var catPermForRoles = _categoryPermissionForRoleRepository.GetByPermission(permission.Id);
            foreach (var categoryPermissionForRole in catPermForRoles)
            {
                _categoryPermissionForRoleRepository.Delete(categoryPermissionForRole);
            }

            _permissionRepository.Delete(permission);
        }

        /// <summary>
        /// Get a permision by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Permission Get(Guid id)
        {
            return _permissionRepository.Get(id);
        }
    }
}
