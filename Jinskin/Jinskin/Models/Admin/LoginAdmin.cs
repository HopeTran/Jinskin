﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jinskin.Models.Admin
{
    public class LoginAdmin
    {
        public string Username { get; set; }

        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}