using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Helpers;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class ProductManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: ProductManager
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.ProductCategory);
            return View(products.ToList());
        }

        // GET: ProductManager/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Product product = db.Products.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }

            var productOptions = db.ProductOptions.Where(x => x.ProductID == product.ID).ToList();
            ViewBag.Sizes = productOptions.Where(x => x.OptionType == "Size").ToList();
            ViewBag.Colors = productOptions.Where(x => x.OptionType == "Color").ToList();
            ViewBag.MaterialTypes = productOptions.Where(x => x.OptionType == "MaterialType").ToList();

            return View(product);
        }

        // GET: ProductManager/Create
        public ActionResult Create()
        {
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ID", "Name");

            return View();
        }

        // POST: ProductManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ProductCategoryID,Name,Make,Model,SKU,Image,Price,Cost,QuantityPerUnit,Weight,Dimensions,Sizes,Colors,MaterialType,PartNumber,ShortDescription,Description,ManufacturerURL,UnitsInStock,OutOfStock,Notes,SizeList,ColorList,MaterialTypeList,Visible")] Product product, HttpPostedFileBase file, FormCollection form)
        {
            if (file != null && file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
            {
                Guid guidName = Guid.NewGuid();
                var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                // Save Original Image
                var pathFull = Path.Combine(Server.MapPath("~/Content/Products/Full"), fileName);
                file.SaveAs(pathFull);

                // Save Thumbnail Image
                var pathThumb = Path.Combine(Server.MapPath("~/Content/Products/Thumb"), fileName);
                Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                product.Image = fileName;
            }

            Guid ID = Guid.NewGuid();
            product.ID = ID.ToString();

            if (ModelState.IsValid)
            {
                // Save the Product Record
                db.Products.Add(product);
                db.SaveChanges();

                // Check if new Product Options have been added 
                var sizesArray = form.GetValues("SizeList");
                var colorsArray = form.GetValues("ColorList");
                var materialTypesArray = form.GetValues("MaterialTypeList");

                // Add Sizes
                if (sizesArray != null)
                {
                    List<ProductOption> sizeOptions = new List<ProductOption>();
                    foreach (var size in sizesArray)
                    {
                        Guid sizeId = Guid.NewGuid();
                        ProductOption sizeOption = new ProductOption();
                        sizeOption.ID = sizeId.ToString();
                        sizeOption.ProductID = product.ID.ToString();
                        sizeOption.OptionType = "Size";
                        sizeOption.OptionValue = size;

                        sizeOptions.Add(sizeOption);
                    }

                    db.ProductOptions.AddRange(sizeOptions);
                    db.SaveChanges();
                }

                // Add Colors
                if (colorsArray != null)
                {
                    List<ProductOption> colorOptions = new List<ProductOption>();
                    foreach (var color in colorsArray)
                    {
                        Guid colorId = Guid.NewGuid();
                        ProductOption colorOption = new ProductOption();
                        colorOption.ID = colorId.ToString();
                        colorOption.ProductID = product.ID.ToString();
                        colorOption.OptionType = "Color";
                        colorOption.OptionValue = color;

                        colorOptions.Add(colorOption);
                    }

                    db.ProductOptions.AddRange(colorOptions);
                    db.SaveChanges();
                }

                // Add Material
                if (materialTypesArray != null)
                {
                    List<ProductOption> materialTypeOptions = new List<ProductOption>();
                    foreach (var materialType in materialTypesArray)
                    {
                        Guid materialTypeId = Guid.NewGuid();
                        ProductOption materialTypeOption = new ProductOption();
                        materialTypeOption.ID = materialTypeId.ToString();
                        materialTypeOption.ProductID = product.ID.ToString();
                        materialTypeOption.OptionType = "MaterialType";
                        materialTypeOption.OptionValue = materialType;

                        materialTypeOptions.Add(materialTypeOption);
                    }

                    db.ProductOptions.AddRange(materialTypeOptions);
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ID", "Name", product.ProductCategoryID);
            return View(product);
        }

        // GET: ProductManager/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Product product = db.Products.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }

            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ID", "Name", product.ProductCategoryID);

            var productOptions = db.ProductOptions.Where(x => x.ProductID == product.ID).ToList();
            ViewBag.Sizes = productOptions.Where(x => x.OptionType == "Size").ToList();
            ViewBag.Colors = productOptions.Where(x => x.OptionType == "Color").ToList();
            ViewBag.MaterialTypes = productOptions.Where(x => x.OptionType == "MaterialType").ToList();

            return View(product);
        }

        // POST: ProductManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,ProductCategoryID,Name,Make,Model,SKU,Image,Price,Cost,QuantityPerUnit,Weight,Dimensions,Sizes,Colors,MaterialType,PartNumber,ShortDescription,Description,ManufacturerURL,UnitsInStock,OutOfStock,Notes,SizeList,ColorList,MaterialTypeList,Visible")] Product product, HttpPostedFileBase file, FormCollection form)
        {
            if (file != null && file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
            {
                Guid guidName = Guid.NewGuid();
                var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                // Save Original Image
                var pathFull = Path.Combine(Server.MapPath("~/Content/Products/Full"), fileName);
                file.SaveAs(pathFull);

                // Save Thumbnail Image
                var pathThumb = Path.Combine(Server.MapPath("~/Content/Products/Thumb"), fileName);
                Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                product.Image = fileName;
            }

            if (ModelState.IsValid)
            {
                // Save Product Record
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();

                // Check if new Product Options have been added or modified
                var sizesArray = form.GetValues("SizeList");
                var colorsArray = form.GetValues("ColorList");
                var materialTypesArray = form.GetValues("MaterialTypeList");

                // Get existing Product Options
                var currentSizes = db.ProductOptions.Where(x => x.ProductID == product.ID && x.OptionType == "Size").ToList();
                var currentColors = db.ProductOptions.Where(x => x.ProductID == product.ID && x.OptionType == "Color").ToList();
                var currentMaterialTypes = db.ProductOptions.Where(x => x.ProductID == product.ID && x.OptionType == "MaterialType").ToList();

                // Update Sizes
                if (currentSizes != null)
                {
                    foreach (var size in currentSizes)
                    {
                        // Remove the ones that have been removed
                        if (!sizesArray.Contains(size.OptionValue))
                        {
                            var deletedSize = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionType == "Size" && x.OptionValue == size.OptionValue);
                            db.ProductOptions.Remove(deletedSize);
                            db.SaveChanges();
                        }
                    }
                }

                if (sizesArray != null)
                {
                    foreach (var size in sizesArray)
                    {
                        // Add the ones that do not exist
                        var sizeNew = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionValue == size && x.OptionType == "Size");

                        if (sizeNew == null)
                        {
                            Guid sizeId = Guid.NewGuid();
                            ProductOption sizeOption = new ProductOption();
                            sizeOption.ID = sizeId.ToString();
                            sizeOption.ProductID = product.ID.ToString();
                            sizeOption.OptionType = "Size";
                            sizeOption.OptionValue = size;

                            db.ProductOptions.Add(sizeOption);
                            db.SaveChanges();
                        }
                    }
                }

                // Update Colors
                if (currentColors != null)
                {
                    foreach (var color in currentColors)
                    {
                        // Remove the ones that have been removed
                        if (!colorsArray.Contains(color.OptionValue))
                        {
                            var deletedColor = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionType == "Color" && x.OptionValue == color.OptionValue);
                            db.ProductOptions.Remove(deletedColor);
                            db.SaveChanges();
                        }
                    }
                }

                if (colorsArray != null)
                {
                    foreach (var color in colorsArray)
                    {
                        // Add the ones that do not exist
                        var colorNew = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionValue == color && x.OptionType == "Color");

                        if (colorNew == null)
                        {
                            Guid colorId = Guid.NewGuid();
                            ProductOption colorOption = new ProductOption();
                            colorOption.ID = colorId.ToString();
                            colorOption.ProductID = product.ID.ToString();
                            colorOption.OptionType = "Color";
                            colorOption.OptionValue = color;

                            db.ProductOptions.Add(colorOption);
                            db.SaveChanges();
                        }
                    }
                }

                // Update Material
                if (currentMaterialTypes != null)
                {
                    foreach (var materialType in currentMaterialTypes)
                    {
                        // Remove the ones that have been removed
                        if (!materialTypesArray.Contains(materialType.OptionValue))
                        {
                            var deletedMaterialType = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionType == "MaterialType" && x.OptionValue == materialType.OptionValue);
                            db.ProductOptions.Remove(deletedMaterialType);
                            db.SaveChanges();
                        }
                    }
                }

                if (materialTypesArray != null)
                {
                    foreach (var materialType in materialTypesArray)
                    {
                        // Add the ones that do not exist
                        var materialTypeNew = db.ProductOptions.SingleOrDefault(x => x.ProductID == product.ID && x.OptionValue == materialType && x.OptionType == "MaterialType");

                        if (materialTypeNew == null)
                        {
                            Guid materialTypeId = Guid.NewGuid();
                            ProductOption materialTypeOption = new ProductOption();
                            materialTypeOption.ID = materialTypeId.ToString();
                            materialTypeOption.ProductID = product.ID.ToString();
                            materialTypeOption.OptionType = "MaterialType";
                            materialTypeOption.OptionValue = materialType;

                            db.ProductOptions.Add(materialTypeOption);
                            db.SaveChanges();
                        }
                    }
                }

                return RedirectToAction("Index");
            }
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ID", "Name", product.ProductCategoryID);
            return View(product);
        }

        // GET: ProductManager/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Product product = db.Products.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }

            var productOptions = db.ProductOptions.Where(x => x.ProductID == product.ID).ToList();
            ViewBag.Sizes = productOptions.Where(x => x.OptionType == "Size").ToList();
            ViewBag.Colors = productOptions.Where(x => x.OptionType == "Color").ToList();
            ViewBag.MaterialTypes = productOptions.Where(x => x.OptionType == "MaterialType").ToList();

            return View(product);
        }

        // POST: ProductManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Product product = db.Products.Find(id);

            // First Remove Product Options
            var productOptions = db.ProductOptions.Where(x => x.ProductID == product.ID).ToList();
            db.ProductOptions.RemoveRange(productOptions);
            db.SaveChanges();

            // Now Remove the Product
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}