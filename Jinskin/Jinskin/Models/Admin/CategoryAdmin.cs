using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jinskin.Framework;

namespace Jinskin.Models.Admin
{
    public class CategoryAdmin
    {
        private JinskinDbContext context = null;

        public CategoryAdmin()
        {
            context = new JinskinDbContext();
        }

        public List<Category> ListAll()
        {
            var list = context.Database.SqlQuery<Category>("Sp_Category_ListAll").ToList();
            return list;
        }
    }
}