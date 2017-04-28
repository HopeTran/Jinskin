using Jinskin.Controllers;
using Jinskin.Framework;
using Jinskin.Models.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jinskin.Controllers
{
    //[CustomAuthorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        // GET: Admin
        
        public ActionResult Index()
        {
             return View();
        }

        // get: login
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginAdmin model)
        {
            var result = new AccountAdmin().Login(model.Username, model.Password);
            //if (Membership.ValidateUser(model.Username, model.Password) && ModelState.IsValid)
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { Username = model.Username });
                //FormsAuthentication.SetAuthCookie(model.Username, model.RememberMe);
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ModelState.AddModelError("", "Error Login");
            }
            return View(model);
        }

        //CategoryAdmin
        public ActionResult Category()
        {
            var iplCate = new CategoryAdmin();
            var model = iplCate.ListAll();
            return View(model);
        }
        //Create category
        [HttpGet]
        public ActionResult CreateCat()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateCat(Category collection)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    var model = new CategoryAdmin();
                    int res = model.CreateCat(collection.Name, collection.Alias, collection.ParentID, collection.Order, collection.Status);
                    if (res > 0)
                    {
                        return RedirectToAction("Category");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới không thành công");
                    }
                    
                }
                return View(collection);
            }
            catch (Exception ex)
            {
                return View();
            }
        }
    }
}

