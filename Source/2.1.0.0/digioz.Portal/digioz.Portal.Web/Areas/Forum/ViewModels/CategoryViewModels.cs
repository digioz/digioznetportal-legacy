using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class CategoryListViewModel
    {
        public Dictionary<Category, PermissionSet> AllPermissionSets { get; set; }
    }

    public class CategoryViewModel
    {
        public PagedList<Topic> Topics { get; set; }
        public PermissionSet Permissions { get; set; }
        public Category Category { get; set; }
        public CategoryListViewModel SubCategories { get; set; }
        public MembershipUser User { get; set; }
        public bool IsSubscribed { get; set; }

        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
    }

    public class SubCategoryViewModel
    {
        public Dictionary<Category, PermissionSet> AllPermissionSets { get; set; }
        public Category ParentCategory { get; set; }
    }

    public class IndexCategoryViewModel
    {
        public CategoryListViewModel Categories { get; set; }
    }
}