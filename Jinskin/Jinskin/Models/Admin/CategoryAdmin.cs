using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jinskin.Framework;
using System.Data.SqlClient;

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

        public int CreateCat(string name, string alias, int? parentid, int? order, bool? status)
        {
            object[] parameters =
            {
                new SqlParameter("@Name", name),
                new SqlParameter("@Alias", alias),
                new SqlParameter("@ParentID", parentid),
                new SqlParameter("@Order", order),
                new SqlParameter("@Status", status)
            };
            int res = context.Database.ExecuteSqlCommand("Sp_Category_Insert @Name,@Alias,@ParentID,@Order,@Status", parameters);
            return res;
            
        }
    }
}