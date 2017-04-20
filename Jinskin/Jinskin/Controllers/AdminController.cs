using Jinskin.Controllers;
using Jinskin.Models.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jinskin.Controllers
{
    
    public class AdminController : Controller
    {
        // GET: Admin
        //[Authorize]
        public ActionResult Index()
        {
             return View();
        }

        // get: login

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


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
        public ActionResult CategoryAdmin()
        {
            var iplCate = new CategoryAdmin();
            var model = iplCate.ListAll();
            return View(model);
        }
    }
}

