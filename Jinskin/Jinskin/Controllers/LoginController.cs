using Jinskin.Controllers;
using Jinskin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginModel model)
        {
            var result = new AccountModel().Login(model.Username, model.Password);
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