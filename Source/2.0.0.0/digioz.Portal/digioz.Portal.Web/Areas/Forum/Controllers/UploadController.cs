﻿using System;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Application;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Controllers;
using digioz.Portal.Web.Areas.Forum.ViewModels;

namespace digioz.Portal.Web.Areas.Forum.Controllers
{
    [Authorize]
    public class UploadController : BaseController
    {
        private readonly IPostService _postService;
        private readonly IUploadedFileService _uploadedFileService;

        private readonly MembershipUser LoggedOnUser;
        private readonly MembershipRole UsersRole;

        public UploadController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager,
            IMembershipService membershipService, ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService,
            IPostService postService, IUploadedFileService uploadedFileService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _postService = postService;
            _uploadedFileService = uploadedFileService;

            LoggedOnUser = UserIsAuthenticated ? MembershipService.GetUser(Username) : null;
            UsersRole = LoggedOnUser == null ? RoleService.GetRole(AppConstants.GuestRoleName) : LoggedOnUser.Roles.FirstOrDefault();
        }

        [HttpPost]
        public ActionResult UploadPostFiles(AttachFileToPostViewModel attachFileToPostViewModel)
        {

            if (attachFileToPostViewModel != null && attachFileToPostViewModel.Files != null)
            {
                using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
                {
                    // First this to do is get the post
                    var post = _postService.Get(attachFileToPostViewModel.UploadPostId);

                    // Check we get a valid post back and have some file
                    if (post != null && attachFileToPostViewModel.Files != null)
                    {
                        Topic topic = null;
                        try
                        {
                            // Now get the topic
                            topic = post.Topic;

                            // Now get the category
                            var category = topic.Category;

                            // Get the permissions for this category, and check they are allowed to update and 
                            // not trying to be a sneaky mofo
                            var permissions = RoleService.GetPermissions(category, UsersRole);
                            if (permissions[AppConstants.PermissionAttachFiles].IsTicked == false && LoggedOnUser.DisableFileUploads != true)
                            {
                                return ErrorToHomePage(LocalizationService.GetResourceString("Errors.NoPermission"));
                            }

                            // woot! User has permission and all seems ok
                            // Before we save anything, check the user already has an upload folder and if not create one
                            var uploadFolderPath = Server.MapPath(string.Concat(AppConstants.UploadFolderPath, LoggedOnUser.Id));
                            if (!Directory.Exists(uploadFolderPath))
                            {
                                Directory.CreateDirectory(uploadFolderPath);
                            }

                            // Loop through each file and get the file info and save to the users folder and Db
                            foreach (var file in attachFileToPostViewModel.Files)
                            {
                                if (file != null)
                                {
                                    // If successful then upload the file
                                    var uploadResult = AppHelpers.UploadFile(file, uploadFolderPath, LocalizationService);
                                    if (!uploadResult.UploadSuccessful)
                                    {
                                        TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                                        {
                                            Message = uploadResult.ErrorMessage,
                                            MessageType = GenericMessages.error
                                        };
                                        return Redirect(topic.NiceUrl);
                                    }

                                    // Add the filename to the database
                                    var uploadedFile = new UploadedFile
                                        {
                                            Filename = uploadResult.UploadedFileName,
                                            Post = post,
                                            MembershipUser = LoggedOnUser
                                        };
                                    _uploadedFileService.Add(uploadedFile);

                                }
                            }

                            //Commit
                            unitOfWork.Commit();

                            // Redirect to the topic with a success message
                            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                            {
                                Message = LocalizationService.GetResourceString("Post.FilesUploaded"),
                                MessageType = GenericMessages.success
                            };

                            return Redirect(topic.NiceUrl);
                        }
                        catch (Exception ex)
                        {
                            unitOfWork.Rollback();
                            LoggingService.Error(ex);
                            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                            {
                                Message = LocalizationService.GetResourceString("Errors.GenericMessage"),
                                MessageType = GenericMessages.error
                            };
                            return topic != null ? Redirect(topic.NiceUrl) : ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
                        }

                    }
                }

            }

            // Else return with error to home page
            return ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
        }

        public ActionResult DeleteUploadedFile(Guid id)
        {
            if (id != Guid.Empty)
            {
                using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
                {
                    Topic topic = null;
                    try
                    {
                        // Get the file and associated objects we'll need
                        var uploadedFile = _uploadedFileService.Get(id);
                        var post = uploadedFile.Post;
                        topic = post.Topic;

                        if (UsersRole.RoleName == AppConstants.AdminRoleName || uploadedFile.MembershipUser.Id == LoggedOnUser.Id)
                        {
                            // Ok to delete file
                            // Remove it from the post
                            post.Files.Remove(uploadedFile);

                            // store the file path as we'll need it to delete on the file system
                            var filePath = uploadedFile.FilePath;

                            // Now delete it
                            _uploadedFileService.Delete(uploadedFile);


                            // And finally delete from the file system
                            System.IO.File.Delete(Server.MapPath(filePath));
                        }
                        else
                        {
                            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                            {
                                Message = LocalizationService.GetResourceString("Errors.NoPermission"),
                                MessageType = GenericMessages.error
                            };
                            Redirect(topic.NiceUrl);
                        }

                        //Commit
                        unitOfWork.Commit();

                        TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                        {
                            Message = LocalizationService.GetResourceString("File.SuccessfullyDeleted"),
                            MessageType = GenericMessages.success
                        };
                        return Redirect(topic.NiceUrl);
                    }
                    catch (Exception ex)
                    {
                        unitOfWork.Rollback();
                        LoggingService.Error(ex);
                        TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                        {
                            Message = LocalizationService.GetResourceString("Errors.GenericMessage"),
                            MessageType = GenericMessages.error
                        };
                        return topic != null ? Redirect(topic.NiceUrl) : ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
                    }
                }
            }
            return ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
        }

    }
}
