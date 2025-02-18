using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Payment;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Areas.Admin.Models;
using digioz.Portal.Web.Helpers;
using digioz.Portal.Web.Models;
using digioz.Portal.Web.Models.ViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.SignalR;
using PagedList;

namespace digioz.Portal.Web.Controllers
{
    public class StoreController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Store
        public ActionResult Index()
        {
            var products = db.Products.Where(x => x.Visible).Take(9).OrderByDescending(x => x.ID);
            return View(products.ToList());
        }

        [System.Web.Mvc.Authorize]
        public ActionResult Details(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return RedirectToAction("Index");
            }

            var product = db.Products.SingleOrDefault(x => x.ID == id);

            var productOptions = db.ProductOptions.Where(x => x.ProductID == product.ID).ToList();
            ViewBag.Sizes = productOptions.Where(x => x.OptionType == "Size").ToList();
            ViewBag.Colors = productOptions.Where(x => x.OptionType == "Color").ToList();
            ViewBag.MaterialTypes = productOptions.Where(x => x.OptionType == "MaterialType").ToList();

            return View(product);
        }

        [System.Web.Mvc.Authorize]
        public ActionResult List()
        {
            string userId = User.Identity.GetUserId();
            var config = ConfigLogic.GetConfig();
            decimal transactionFee = Convert.ToDecimal(config["PaymentTransactionFee"]);

            ViewBag.TransactionFee = transactionFee;

            var shoppingCart = db.ShoppingCarts.Where(x => x.UserID == userId).ToList();
            return View(shoppingCart);
        }

        [System.Web.Mvc.Authorize]
        [HttpPost]
        public ActionResult Add(FormCollection form)
        {
            // Parse form values
            string productId = form["ID"];
            string size = form["Size"];
            string color = form["Color"];
            string materialType = form["MaterialType"];
            string notesUser = form["UserNotes"];
            Int32 quantity = Convert.ToInt32(form["Quantity"]);

            Guid guid = Guid.NewGuid();
            var product = db.Products.SingleOrDefault(x => x.ID == productId);
            var shoppingCart = new ShoppingCart();
            // var user = db.MembershipUser.Find(User.Identity.GetUserId());

            shoppingCart.ID = guid.ToString();
            shoppingCart.UserID = User.Identity.GetUserId();
            shoppingCart.Product = product;
            shoppingCart.Quantity = quantity;
            shoppingCart.DateCreated = DateTime.Now;
            shoppingCart.Size = size;
            shoppingCart.Color = color;
            shoppingCart.MaterialType = materialType;
            shoppingCart.Notes = notesUser;

            db.ShoppingCarts.Add(shoppingCart);
            db.SaveChanges();

            return RedirectToAction("List");
        }

        [System.Web.Mvc.Authorize]
        public ActionResult Remove(string id)
        {
            var shoppingCartItem = db.ShoppingCarts.SingleOrDefault(x => x.ID == id);
            db.ShoppingCarts.Remove(shoppingCartItem);
            db.SaveChanges();

            return RedirectToAction("List");
        }

        [HttpPost]
        public ActionResult Update(string id, FormCollection form)
        {
            var cartItem = db.ShoppingCarts.SingleOrDefault(x => x.ID == id);
            var quantity = form["Quantity"];

            if (quantity != null && cartItem != null)
            {
                Int32 quantityNumber = Convert.ToInt32(quantity);
                cartItem.Quantity = quantityNumber;

                db.Entry(cartItem).State = EntityState.Modified;
                db.SaveChanges();
            }
            
            return RedirectToAction("List");
        }

        [System.Web.Mvc.Authorize]
        public ActionResult Empty()
        {
            string userID = User.Identity.GetUserId();

            db.ShoppingCarts.RemoveRange(db.ShoppingCarts.Where(x => x.UserID == userID));
            db.SaveChanges();

            return RedirectToAction("List");
        }

        [System.Web.Mvc.Authorize]
        public ActionResult Checkout()
        {
            var user = AccountLogic.GetMembershipUser(User.Identity.GetUserId());

            var cart = db.ShoppingCarts.Where(x => x.UserID == user.Id).ToList();

            if (cart.Count < 1)
            {
                return RedirectToAction("Index");
            }

            var profile = ProfileLogic.GetProfileByUserId(user.Id);
            var CVM = new CheckOutViewModel
            {
                FirstName = profile.FirstName,
                LastName = profile.LastName,
                ShippingAddress = profile.Address,
                ShippingAddress2 = profile.Address2,
                ShippingCity = profile.City,
                ShippingState = profile.State,
                ShippingZip = profile.Zip,
                ShippingCountry = profile.Country,
                BillingAddress = profile.Address,
                BillingAddress2 = profile.Address2,
                BillingCity = profile.City,
                BillingState = profile.State,
                BillingZip = profile.Zip,
                BillingCountry = profile.Country,
                Email = profile.Email
            };

            return View(CVM);
        }

        [System.Web.Mvc.Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Checkout([Bind(Include = "ID,FirstName,LastName,ShippingAddress,ShippingAddress2,ShippingCity,ShippingState,ShippingZip,ShippingCountry,BillingAddress,BillingAddress2,BillingCity,BillingState,BillingZip,BillingCountry,Phone,Email,CCNumber,CCExpMonth, CCExpYear,CCCardCode,PaymentGateway")] CheckOutViewModel checkOutViewModel)
        {
            string userID = User.Identity.GetUserId().ToString();
            List<OrderDetail> orderDetails = new List<OrderDetail>();
            decimal total = 0;
            Guid orderID = Guid.NewGuid();
            string invoiceNumber = Utility.GetUniqueKey(15);
            var config = ConfigLogic.GetConfig();
            List<PayLineItem> payLineItems = new List<PayLineItem>();
            decimal transactionFee = Convert.ToDecimal(config["PaymentTransactionFee"]);
            checkOutViewModel.PaymentGateway = "AuthorizeNet";

            try
            {
                // Get Total
                var cart = db.ShoppingCarts.Where(x => x.UserID == userID);
                int i = 1;

                foreach (var item in cart)
                {
                    PayLineItem payLineItem = new PayLineItem();
                    payLineItem.ID = i.ToString();
                    payLineItem.Name = item.Product.Name;
                    payLineItem.Description = item.Product.ShortDescription;
                    payLineItem.Quantity = item.Quantity;
                    payLineItem.Price = item.Product.Price;
                    payLineItem.Taxable = false;

                    total += item.Product.Price * item.Quantity;

                    payLineItems.Add(payLineItem);

                    i++;
                }

                // Add a transaction fee line item if needed
                if (transactionFee > 0)
                {
                    PayLineItem payLineItem = new PayLineItem();
                    payLineItem.ID = i.ToString();
                    payLineItem.Name = "Transaction Fee";
                    payLineItem.Description = "Transaction fee for processing this order";
                    payLineItem.Quantity = 1;
                    payLineItem.Price = transactionFee;
                    payLineItem.Taxable = false;

                    payLineItems.Add(payLineItem);

                    total += transactionFee;
                }
                
                // Make Payment
                MakePayment makePayment = new MakePayment();
                var payResponse = PayResponse(checkOutViewModel, orderID, total, config, makePayment, invoiceNumber, payLineItems);

                if (payResponse != null && payResponse.TrxApproved == true)
                {
                    // Create Order
                    Order order = new Order();
                    CreateOrder(checkOutViewModel, order, orderID, userID, total, payResponse, invoiceNumber);

                    // Add Order Detail
                    CreateOrderDetails(cart, order, orderDetails);

                    // Email Confirmation
                    SendEmail(config, order);

                    // Clear Shopping Cart
                    db.ShoppingCarts.RemoveRange(db.ShoppingCarts.Where(x => x.UserID == userID));
                    db.SaveChanges();

                    // Redirect to Confirmation Page
                    TempData["OrderConfirmationID"] = order.InvoiceNumber;
                    return RedirectToAction("Confirmation");
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "We were unable to process your Order. Please contact the site Administrator.");
                    string failureMessage = "An error occured while processing an order request." + Environment.NewLine;

                    if (payResponse != null)
                    {
                        failureMessage += "User: " + checkOutViewModel.FirstName + " " + checkOutViewModel.LastName + Environment.NewLine;
                        failureMessage += "Message: " + payResponse.TrxMessage + " " + payResponse.TrxDescription + Environment.NewLine;
                        failureMessage += "Response Code:" + payResponse.TrxResponseCode;
                    }

                    Utility.AddLogEntry(failureMessage);
                }
                
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, "We were unable to process your Order. Please contact the site Administrator.");
                string error = "Error Placing Order for User " + User.Identity.Name + " - Exception: " + ex.Message + ex.StackTrace.ToString();
                Utility.AddLogEntry(error);
            }

            return View(checkOutViewModel);
        }

        private void CreateOrderDetails(IQueryable<ShoppingCart> cart, Order order, List<OrderDetail> orderDetails)
        {
            var config = ConfigLogic.GetConfig();
            decimal transactionFee = Convert.ToDecimal(config["PaymentTransactionFee"]);

            foreach (var item in cart)
            {
                Guid orderDetailId = Guid.NewGuid();
                var orderDetail = new OrderDetail();

                orderDetail.ID = orderDetailId.ToString();
                orderDetail.OrderID = order.ID;
                orderDetail.ProductID = item.ProductID;
                orderDetail.Quantity = item.Quantity;
                orderDetail.UnitPrice = item.Product.Price;
                orderDetail.Description = item.Product.Name;
                orderDetail.Size = item.Size;
                orderDetail.Color = item.Color;
                orderDetail.MaterialType = item.MaterialType;
                orderDetail.Notes = item.Notes;

                orderDetails.Add(orderDetail);
            }

            if (transactionFee > 0)
            {
                string transactionCategoryString = string.Empty;
                string transactionProductString = string.Empty;

                var transactionCategory = db.ProductCategories.Where(x => x.Name == "Transaction").SingleOrDefault();
                var transactionProduct = db.Products.Where(x => x.Name == "Transaction Fee").SingleOrDefault();

                if (transactionCategory == null)
                {
                    Guid transactionCategoryId = Guid.NewGuid();
                    ProductCategory transactionCategoryNew = new ProductCategory();
                    transactionCategoryNew.ID = transactionCategoryId.ToString();
                    transactionCategoryNew.Name = "Transaction";
                    transactionCategoryNew.Visible = false;
                    transactionCategoryNew.Description = "This category is for holding transaction related products. DO NOT REMOVE.";

                    db.ProductCategories.Add(transactionCategoryNew);
                    db.SaveChanges();
                    transactionCategoryString = transactionCategoryId.ToString();
                }
                else
                {
                    transactionCategoryString = transactionCategory.ID.ToString();
                }

                // create the transaction fee product if it does not exist
                if (transactionProduct == null)
                {
                    Guid transactionProductId = Guid.NewGuid();
                    Product transactionProductNew = new Product();
                    transactionProductNew.ID = transactionProductId.ToString();
                    transactionProductNew.ProductCategoryID = transactionCategoryString;
                    transactionProductNew.Name = "Transaction Fee";
                    transactionProductNew.Price = transactionFee;
                    transactionProductNew.ShortDescription = "Transaction Fee";
                    transactionProductNew.Description = "Transaction Fee";
                    transactionProductNew.UnitsInStock = 100000;
                    transactionProductNew.OutOfStock = false;
                    transactionProductNew.Visible = false;

                    db.Products.Add(transactionProductNew);
                    db.SaveChanges();

                    transactionProductString = transactionProductNew.ID.ToString();
                }
                else
                {
                    transactionProductString = transactionProduct.ID.ToString();
                }

                Guid orderDetailId = Guid.NewGuid();
                var orderDetail = new OrderDetail();

                orderDetail.ID = orderDetailId.ToString();
                orderDetail.OrderID = order.ID;
                orderDetail.ProductID = transactionProductString;
                orderDetail.Quantity = 1;
                orderDetail.UnitPrice = transactionFee;
                orderDetail.Description = "Transaction Fee";

                orderDetails.Add(orderDetail);
            }

            order.OrderDetails = orderDetails;
            db.Entry(order).State = EntityState.Modified;
            db.SaveChanges();
        }

        private void CreateOrder(CheckOutViewModel checkOutViewModel, Order order, Guid orderID, string userID, decimal total, PayResponse payResponse, string invoiceNumber)
        {
            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            order.ID = orderID.ToString();
            order.UserID = userID;
            order.InvoiceNumber = invoiceNumber;
            order.OrderDate = DateTime.Now;
            order.FirstName = checkOutViewModel.FirstName;
            order.LastName = checkOutViewModel.LastName;

            order.ShippingAddress = checkOutViewModel.ShippingAddress;
            order.ShippingAddress2 = checkOutViewModel.ShippingAddress2;
            order.ShippingCity = checkOutViewModel.ShippingCity;
            order.ShippingState = checkOutViewModel.ShippingState;
            order.ShippingZip = checkOutViewModel.ShippingZip;
            order.ShippingCountry = checkOutViewModel.ShippingCountry;

            order.BillingAddress = checkOutViewModel.BillingAddress;
            order.BillingAddress2 = checkOutViewModel.BillingAddress2;
            order.BillingCity = checkOutViewModel.BillingCity;
            order.BillingState = checkOutViewModel.BillingState;
            order.BillingZip = checkOutViewModel.BillingZip;
            order.BillingCountry = checkOutViewModel.BillingCountry;

            order.Phone = checkOutViewModel.Phone;
            order.Email = checkOutViewModel.Email;
            order.Total = total;

            order.CCNumber = stringEncryption.Encrypt(checkOutViewModel.CCNumber);
            order.CCExp = checkOutViewModel.CCExpMonth + checkOutViewModel.CCExpYear.Substring(2,checkOutViewModel.CCExpYear.Length - 2); 
            order.CCCardCode = checkOutViewModel.CCCardCode;
            order.CCAmount = total;

            // ToTo - Fill in Payment Transaction values
            order.TrxDescription = payResponse.TrxDescription;
            order.TrxApproved = payResponse.TrxApproved;
            order.TrxAuthorizationCode = payResponse.TrxAuthorizationCode;
            order.TrxMessage = payResponse.TrxMessage;
            order.TrxResponseCode = payResponse.TrxResponseCode;
            order.TrxID = payResponse.TrxID;

            db.Orders.Add(order);
            db.SaveChanges();
        }

        private static void SendEmail(Dictionary<string, string> config, Order order)
        {
            try
            {
                EmailModel email = new EmailModel();

                email.SMTPServer = config["SMTPServer"];
                email.SMTPUsername = config["SMTPUsername"];
                email.SMTPPassword = config["SMTPPassword"];
                email.FromEmail = config["WebmasterEmail"];

                email.ToEmail = order.Email;
                email.Subject = " Your Order has been placed on " + config["SiteName"];
                email.Message = "Dear User,<br /><br />"
                                +
                                "We have received an Order from you and are in the process of processing your order. <br /><br />"
                                + "Your Order ID: " + order.InvoiceNumber + " <br /><br />"
                                + "If you have any questions feel free to contact us at " + email.FromEmail + " or visit " +
                                config["SiteURL"] + " for more information.<br /><br />"
                                + "Thanks,<br />"
                                + "The " + config["SiteName"] + " Management Team";

                bool resultEmailSubmit = Utility.SubmitMail(email);
            }
            catch (Exception)
            {
                // Exception handled by SubmitMail
            }
        }

        private static PayResponse PayResponse(CheckOutViewModel checkOutViewModel, Guid orderID, decimal total,
            Dictionary<string, string> config, MakePayment makePayment, string invoiceNumber, List<PayLineItem> payLineItems)
        {
            Pay pay = new Pay();
            pay.ID = invoiceNumber; // orderID.ToString();
            pay.OrderDate = DateTime.Now;
            pay.FirstName = checkOutViewModel.FirstName;
            pay.LastName = checkOutViewModel.LastName;

            pay.ShippingAddress = checkOutViewModel.ShippingAddress;
            pay.ShippingAddress2 = checkOutViewModel.ShippingAddress2;
            pay.ShippingCity = checkOutViewModel.ShippingCity;
            pay.ShippingState = checkOutViewModel.ShippingState;
            pay.ShippingZip = checkOutViewModel.ShippingZip;
            pay.ShippingCountry = checkOutViewModel.ShippingCountry;
            pay.ShippingCountry = checkOutViewModel.ShippingCountry;
            pay.ShippingCountryCode = Utility.GetCountryCode(checkOutViewModel.ShippingCountry);

            pay.BillingAddress = checkOutViewModel.BillingAddress;
            pay.BillingAddress2 = checkOutViewModel.BillingAddress2;
            pay.BillingCity = checkOutViewModel.BillingCity;
            pay.BillingState = checkOutViewModel.BillingState;
            pay.BillingZip = checkOutViewModel.BillingZip;
            pay.BillingCountry = checkOutViewModel.BillingCountry;
            pay.BillingCountryCode = Utility.GetCountryCode(checkOutViewModel.BillingCountry);

            pay.Phone = checkOutViewModel.Phone;
            pay.Email = checkOutViewModel.Email;
            pay.Total = total;

            pay.CCNumber = checkOutViewModel.CCNumber;
            pay.CCExp = checkOutViewModel.CCExpMonth + checkOutViewModel.CCExpYear.Substring(2, checkOutViewModel.CCExpYear.Length - 2);
            pay.CCExpYear = checkOutViewModel.CCExpYear;
            pay.CCExpMonth = checkOutViewModel.CCExpMonth ;
            pay.CCCardCode = checkOutViewModel.CCCardCode;
            pay.CCAmount = total;
            pay.CCType = Utility.CreditCardType(pay.CCNumber);
            pay.Description = "Order on " + DateTime.Now + " - " + config["SiteName"];

            PaymentTypeKey key = new PaymentTypeKey();
            key.LoginId = config["PaymentLoginID"];
            key.TransactionKey = config["PaymentTransactionKey"];
            key.TestMode = Convert.ToBoolean(config["PaymentTestMode"]);
            var paymentType = (PaymentType)Enum.Parse(typeof(PaymentType), checkOutViewModel.PaymentGateway);
            PayResponse payResponse = makePayment.ProcessPayment(pay, paymentType, key, payLineItems);
            return payResponse;
        }

        public ActionResult Confirmation()
        {
            if (TempData["OrderConfirmationID"] != null)
            {
                @ViewBag.OrderConfirmationID = TempData["OrderConfirmationID"].ToString();
                return View();
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        public ActionResult ByCategory(string id, int? page)
        {
            var products = db.Products.Where(x => x.ProductCategoryID == id && x.Visible == true).ToList();

            int pageSize = 9;
            int pageNumber = (page ?? 1);

            return View(products.ToPagedList(pageNumber, pageSize));
        }

        [System.Web.Mvc.Authorize]
        public ActionResult History()
        {
            List<OrderManagerViewModel> OMVMs = new List<OrderManagerViewModel>();

            string userID = User.Identity.GetUserId();

            var orders = db.Orders.Where(x => x.UserID == userID).ToList();
            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            foreach (var order in orders)
            {
                var orderDetails = db.OrderDetails.Where(x => x.OrderID == order.ID).ToList();
                OrderManagerViewModel OMVM = new OrderManagerViewModel();

                string creditCardNumber;

                try
                {
                    creditCardNumber = stringEncryption.Decrypt(order.CCNumber);
                    creditCardNumber = StringUtils.CreditCardNumberShowLast4Chars(creditCardNumber);
                }
                catch
                {
                    creditCardNumber = string.Empty;
                }

                order.CCNumber = creditCardNumber;

                OMVM.Order = order;
                OMVM.OrderDetails = orderDetails;

                OMVMs.Add(OMVM);
            }

            return View(OMVMs);
        }
    }
}