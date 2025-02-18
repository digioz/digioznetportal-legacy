﻿using System;
using System.Linq;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = AppConstants.AdminRoleName)]
    public class PermissionsController : BaseAdminController
    {
        private readonly IRoleService _roleService;
        private readonly IPermissionService _permissionService;
        private readonly ICategoryService _categoryService;
        private readonly ICategoryPermissionForRoleService _categoryPermissionForRoleService;

        public PermissionsController(ILoggingService loggingService, 
                                    IUnitOfWorkManager unitOfWorkManager, 
                                    IRoleService roleService,
                                    ILocalizationService localizationService,
                                    IPermissionService permissionService,
                                    ICategoryService categoryService,
                                    ICategoryPermissionForRoleService categoryPermissionForRoleService,
                                    IMembershipService membershipService,
                                    ISettingsService settingsService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, settingsService)
        {
            _roleService = roleService;
            _permissionService = permissionService;
            _categoryService = categoryService;
            _categoryPermissionForRoleService = categoryPermissionForRoleService;
        }

        /// <summary>
        /// List of roles to apply permissions to
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var permViewModel = new ChoosePermissionsViewModel
                                        {
                                            MembershipRoles = _roleService.AllRoles().ToList(),
                                            Permissions = _permissionService.GetAll().ToList()
                                        };
                return View(permViewModel);
            }
        }

        /// <summary>
        /// Add / Remove permissions for a role on each category
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult EditPermissions(string id)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var role = _roleService.GetRoleById(id);
                var permViewModel = new EditPermissionsViewModel
                                        {
                                            MembershipRole = role,
                                            Permissions = _permissionService.GetAll().ToList(),
                                            Categories = _categoryService.GetAll().ToList()
                                        };
                return View(permViewModel);
            }
        }

        /// <summary>
        /// Add a new permission type into the permission table
        /// </summary>
        /// <returns></returns>
        public ActionResult AddType()
        {
            return View(new AddTypeViewModel());
        }

        [HttpPost]
        public ActionResult AddType(AddTypeViewModel permissionViewModel)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    var permission = new Permission
                                         {
                                             Name = permissionViewModel.Name,
                                         };
                        
                    _permissionService.Add(permission);
                    TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = "Permission Added",
                        MessageType = GenericMessages.success
                    };
                    unitOfWork.Commit();
                }
                catch(Exception ex)
                {
                    unitOfWork.Rollback();
                    LoggingService.Error(ex); 
                    throw;
                }
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public void UpdatePermission(AjaxEditPermissionViewModel ajaxEditPermissionViewModel)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    if (Request.IsAjaxRequest())
                    {
                        var mappedItem = new CategoryPermissionForRole
                                             {
                                                 Category = _categoryService.Get(ajaxEditPermissionViewModel.Category),
                                                 MembershipRole =
                                                     _roleService.GetRoleById(ajaxEditPermissionViewModel.MembershipRole),
                                                 Permission =
                                                     _permissionService.Get(ajaxEditPermissionViewModel.Permission),
                                                 IsTicked = ajaxEditPermissionViewModel.HasPermission
                                             };
                        _categoryPermissionForRoleService.UpdateOrCreateNew(mappedItem);
                    }
                    unitOfWork.Commit();
                }
                catch (Exception ex)
                {
                    unitOfWork.Rollback();
                    LoggingService.Error(ex);
                    throw;
                }
            }
        }

        public ActionResult DeletePermission(Guid id)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    var permission = _permissionService.Get(id);
                    _permissionService.Delete(permission);

                    TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                                                                    {
                                                                        Message = "Permission Deleted",
                                                                        MessageType = GenericMessages.success
                                                                    };
                    unitOfWork.Commit();
                }
                catch (Exception ex)
                {
                    unitOfWork.Rollback();
                    LoggingService.Error(ex);
                    throw;
                }
            }
            return RedirectToAction("Index");
        }

    }
}
