using Jinskin.Controllers;
using Jinskin.Models.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
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
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { Username = model.Username });
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ModelState.AddModelError("", "Error Login");
            }
            return View(model);
        }
    }
}