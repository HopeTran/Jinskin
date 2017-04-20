using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Jinskin.Framework
{
    public class CustomAuthorize : AuthorizeAttribute
    {
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            //string controller = filterContext.RouteData.Values["controller"].ToString();
            filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controllers = "Admin", action = "Login" }));
        }
    }
}