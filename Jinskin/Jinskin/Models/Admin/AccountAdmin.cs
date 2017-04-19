using Jinskin.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Jinskin.Models.Admin
{
    public class AccountAdmin
    {
        private JinskinDBContext context = null;

        public AccountAdmin()
        {
            context = new JinskinDBContext();
        }

        public bool Login(string Username, string Password)
        {
            object[] sqlParams =
            {
                new SqlParameter("@Username", Username),
                new SqlParameter("@Password", Password),
            };
            var res = context.Database.SqlQuery<bool>("Sp_Account_Login @Username, @Password", sqlParams).SingleOrDefault();
            return res;
        }
    }
}