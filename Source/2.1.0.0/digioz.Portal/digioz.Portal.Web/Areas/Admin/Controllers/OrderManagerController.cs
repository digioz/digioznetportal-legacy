using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Areas.Admin.Models;
using digioz.Portal.Web.Helpers;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class OrderManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: OrderManager
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.AspNetUser).OrderByDescending(x => x.OrderDate);
            return View(orders.ToList());
        }

        // GET: OrderManager/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            OrderManagerViewModel OMVM = new OrderManagerViewModel();
            Order order = db.Orders.Find(id);
            var orderDetails = db.OrderDetails.Where(x => x.OrderID == id).ToList();

            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            string creditCardNumber;

            try
            {
                creditCardNumber = stringEncryption.Decrypt(order.CCNumber);
            }
            catch
            {
                creditCardNumber = string.Empty;
            }

            order.CCNumber = creditCardNumber;

            OMVM.Order = order;
            OMVM.OrderDetails = orderDetails;

            if (order == null)
            {
                return HttpNotFound();
            }

            return View(OMVM);
        }

        // GET: OrderManager/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");
            return View();
        }

        // POST: OrderManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,OrderDate,FirstName,LastName,ShippingAddress,ShippingAddress2,ShippingCity,ShippingState,ShippingZip,ShippingCountry,BillingAddress,BillingAddress2,BillingCity,BillingState,BillingZip,BillingCountry,Phone,Email,Total,CCNumber,CCExp,CCCardCode,CCAmount,TrxDescription,TrxApproved,TrxAuthorizationCode,TrxMessage,TrxResponseCode,TrxID")] Order order)
        {
            Guid ID = Guid.NewGuid();
            order.ID = ID.ToString();

            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", order.UserID);
            return View(order);
        }

        // GET: OrderManager/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            string creditCardNumber;

            try
            {
                creditCardNumber = stringEncryption.Decrypt(order.CCNumber);
            }
            catch
            {
                creditCardNumber = string.Empty;
            }

            order.CCNumber = creditCardNumber;

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", order.UserID);

            return View(order);
        }

        // POST: OrderManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserID,OrderDate,FirstName,LastName,ShippingAddress,ShippingAddress2,ShippingCity,ShippingState,ShippingZip,ShippingCountry,BillingAddress,BillingAddress2,BillingCity,BillingState,BillingZip,BillingCountry,Phone,Email,Total,CCNumber,CCExp,CCCardCode,CCAmount,TrxDescription,TrxApproved,TrxAuthorizationCode,TrxMessage,TrxResponseCode,TrxID,InvoiceNumber")] Order order)
        {
            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            string creditCardNumber = stringEncryption.Encrypt(order.CCNumber);
            order.CCNumber = creditCardNumber;

            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", order.UserID);

            return View(order);
        }

        // GET: OrderManager/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            OrderManagerViewModel OMVM = new OrderManagerViewModel();
            Order order = db.Orders.Find(id);
            var orderDetails = db.OrderDetails.Where(x => x.OrderID == id).ToList();

            var config = ConfigLogic.GetConfig();
            string encryptionKey = config["SiteEncryptionKey"];
            StringEncryption stringEncryption = new StringEncryption(encryptionKey);

            string creditCardNumber;

            try
            {
                creditCardNumber = stringEncryption.Decrypt(order.CCNumber);
            }
            catch
            {
                creditCardNumber = string.Empty;
            }
            
            order.CCNumber = creditCardNumber;

            OMVM.Order = order;
            OMVM.OrderDetails = orderDetails;

            if (order == null)
            {
                return HttpNotFound();
            }

            return View(OMVM);
        }

        // POST: OrderManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Order order = db.Orders.Find(id);

            // Remove Order Details first
            var orderDetails = db.OrderDetails.Where(x => x.OrderID == id).ToList();
            db.OrderDetails.RemoveRange(orderDetails);
            db.SaveChanges();

            // Now remove the Order 
            db.Orders.Remove(order);
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