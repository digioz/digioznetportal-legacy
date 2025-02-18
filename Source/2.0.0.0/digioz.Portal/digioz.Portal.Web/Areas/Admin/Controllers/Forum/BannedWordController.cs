﻿using System;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = AppConstants.AdminRoleName)]
    public class BannedWordController : BaseAdminController
    {

        private readonly IBannedWordService _bannedWordService;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="unitOfWorkManager"> </param>
        /// <param name="membershipService"></param>
        /// <param name="localizationService"> </param>
        /// <param name="settingsService"> </param>
        /// <param name="loggingService"> </param>
        /// <param name="bannedWordService"></param>
        public BannedWordController(ILoggingService loggingService,
            IUnitOfWorkManager unitOfWorkManager,
            IMembershipService membershipService,
            ILocalizationService localizationService,
            ISettingsService settingsService, 
            IBannedWordService bannedWordService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, settingsService)
        {
            _bannedWordService = bannedWordService;
        }


        public ActionResult Index(int? p, string search)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var pageIndex = p ?? 1;
                var allEmails = string.IsNullOrEmpty(search) ? _bannedWordService.GetAllPaged(pageIndex, AppConstants.AdminListPageSize) :
                                    _bannedWordService.GetAllPaged(search, pageIndex, AppConstants.AdminListPageSize);

                var viewModel = new BannedWordListViewModel
                    {
                        Words = allEmails,
                        PageIndex = pageIndex,
                        TotalCount = allEmails.TotalCount,
                        Search = search
                    };
                
                return View(viewModel);
            }
            
        }

        [HttpPost]
        public ActionResult Add(AddBannedWordViewModel addBannedEmailViewModel)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    if (!string.IsNullOrEmpty(addBannedEmailViewModel.Word))
                    {
                        var bannedWord = new BannedWord
                        {
                            Word = addBannedEmailViewModel.Word,
                            DateAdded = DateTime.Now
                        };

                        _bannedWordService.Add(bannedWord);

                        TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                        {
                            Message = "Word added",
                            MessageType = GenericMessages.success
                        };

                        unitOfWork.Commit();
                    }
                    else
                    {
                        TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                        {
                            Message = "Please add a word",
                            MessageType = GenericMessages.error
                        };
                    }

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
                }
            }

            return RedirectToAction("Index");
        }

        public ActionResult Delete(Guid id, int? p, string search)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    var word = _bannedWordService.Get(id);
                    if (word == null)
                    {
                        throw new ApplicationException("Cannot delete word - Word does not exist");
                    }

                    _bannedWordService.Delete(word);

                    ViewBag.Message = new GenericMessageViewModel
                    {
                        Message = "Word delete successfully",
                        MessageType = GenericMessages.success
                    };
                    unitOfWork.Commit();
                }
                catch (Exception ex)
                {
                    unitOfWork.Rollback();
                    LoggingService.Error(ex);
                    ViewBag.Message = new GenericMessageViewModel
                    {
                        Message = string.Format("Delete failed: {0}", ex.Message),
                        MessageType = GenericMessages.error
                    };
                }

                return RedirectToAction("Index", new { p, search });
            }
        }

        /// <summary>
        /// Edit a resource key
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public void AjaxUpdateWord(AjaxEditWordViewModel viewModel)
        {
            if (Request.IsAjaxRequest())
            {
                using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
                {
                    try
                    {
                        var wordToUpdate = _bannedWordService.Get(viewModel.WordId);
                        wordToUpdate.Word = viewModel.NewName;
                        unitOfWork.Commit();
                    }
                    catch (Exception ex)
                    {
                        unitOfWork.Rollback();
                        LoggingService.Error(ex);
                    }
                }
            }
        }
    }
}
