﻿using System;
using System.Collections.Generic;
using System.Linq;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Exceptions;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly IRoleService _roleService;
        private readonly ICategoryRepository _categoryRepository;
        private readonly ICategoryNotificationService _categoryNotificationService;
        private readonly ICategoryPermissionForRoleRepository _categoryPermissionForRoleRepository;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="categoryPermissionForRoleRepository"> </param>
        /// <param name="roleService"> </param>
        /// <param name="categoryRepository"> </param>
        /// <param name="categoryNotificationService"> </param>
        public CategoryService(ICategoryRepository categoryRepository, ICategoryPermissionForRoleRepository categoryPermissionForRoleRepository,
            IRoleService roleService, ICategoryNotificationService categoryNotificationService)
        {
            _categoryRepository = categoryRepository;
            _categoryPermissionForRoleRepository = categoryPermissionForRoleRepository;
            _roleService = roleService;
            _categoryNotificationService = categoryNotificationService;
        }

        /// <summary>
        /// Return all categories
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Category> GetAll()
        {
            return _categoryRepository.GetAll();
        }


        /// <summary>
        /// Return all sub categories from a parent category id
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public IEnumerable<Category> GetAllSubCategories(Guid parentId)
        {
            return _categoryRepository.GetAllSubCategories(parentId);
        }

        /// <summary>
        /// Get all main categories (Categories with no parent category)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Category> GetAllMainCategories(bool getWithExtendedData = false)
        {
            return _categoryRepository.GetMainCategories(getWithExtendedData);
        }

        /// <summary>
        /// Return allowed categories based on the users role
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public IEnumerable<Category> GetAllowedCategories(MembershipRole role)
        {
            var filteredCats = new List<Category>();
            var allCats = _categoryRepository.GetAll().ToList();
            foreach (var category in allCats)
            {
                var permissionSet = _roleService.GetPermissions(category, role);
                if (!permissionSet[AppConstants.PermissionDenyAccess].IsTicked)
                {
                    filteredCats.Add(category);
                }
            }
            return filteredCats;
        }

        /// <summary>
        /// Add a new category
        /// </summary>
        /// <param name="category"></param>
        public void Add(Category category)
        {
            // Sanitize
            category = SanitizeCategory(category);

            // Set the create date
            category.DateCreated = DateTime.UtcNow;

            // url slug generator
            category.Slug = ServiceHelpers.GenerateSlug(category.Name, x => _categoryRepository.GetBySlugLike(ServiceHelpers.CreateUrl(category.Name)));            

            // Add the category
            _categoryRepository.Add(category);
        }

        /// <summary>
        /// Keep slug in line with name
        /// </summary>
        /// <param name="category"></param>
        public void UpdateSlugFromName(Category category)
        {
            // Sanitize
            category = SanitizeCategory(category);

            category.Slug = ServiceHelpers.GenerateSlug(category.Name, x => _categoryRepository.GetBySlugLike(category.Slug)); 
        }

        /// <summary>
        /// Sanitizes a category
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public Category SanitizeCategory(Category category)
        {
            // Sanitize any strings in a category
            category.Description = StringUtils.GetSafeHtml(category.Description);
            category.Name = StringUtils.SafePlainText(category.Name);
            return category;
        }

        /// <summary>
        /// Return category by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Category Get(Guid id)
        {
            return _categoryRepository.Get(id);
        }

        /// <summary>
        /// Return model with Sub categories
        /// </summary>
        /// <param name="slug"></param>
        /// <returns></returns>
        public CategoryWithSubCategories GetBySlugWithSubCategories(string slug)
        {
            return _categoryRepository.GetBySlugWithSubCategories(slug);
        }

        /// <summary>
        /// Return category by Url slug
        /// </summary>
        /// <param name="slug"></param>
        /// <returns></returns>
        public Category Get(string slug)
        {
            return _categoryRepository.GetBySlug(StringUtils.GetSafeHtml(slug));
        }

        /// <summary>
        /// Delete a category
        /// </summary>
        /// <param name="category"></param>
        public void Delete(Category category)
        {
            // Check if anyone else if using this role
            var okToDelete = !category.Topics.Any();

            if (okToDelete)
            {
                // Get any categorypermissionforoles and delete these first
                var rolesToDelete = _categoryPermissionForRoleRepository.GetByCategory(category.Id);

                foreach (var categoryPermissionForRole in rolesToDelete)
                {
                    _categoryPermissionForRoleRepository.Delete(categoryPermissionForRole);
                }

                var categoryNotificationsToDelete = new List<CategoryNotification>();
                categoryNotificationsToDelete.AddRange(category.CategoryNotifications);
                foreach (var categoryNotification in categoryNotificationsToDelete)
                {
                    _categoryNotificationService.Delete(categoryNotification);
                }

                _categoryRepository.Delete(category);
            }
            else
            {
                var inUseBy = new List<Entity>();
                inUseBy.AddRange(category.Topics);
                throw new InUseUnableToDeleteException(inUseBy);
            }
        }

        /// <summary>
        /// Save / Update a category
        /// </summary>
        /// <param name="category"></param>
        public void Save(Category category)
        {
            // Sanitize
            category = SanitizeCategory(category);

            _categoryRepository.Update(category);
        }
    }
}

