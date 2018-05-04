using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineStore
{
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name, price;
            if (Request.RequestType == "GET") throw new HttpException(403, "Get requests are denied by the server");
            
            if (Request.Form["ItemName"] == null) throw new HttpException(500, "Internal server error, required field not found");
            else name = Request.Form["ItemName"];

            if (Request.Form["ItemPrice"] == null) throw new HttpException(500, "Internal server error, required field not found");
            else price = Request.Form["ItemPrice"];

            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<DataSetStore>();
            }
                ((List<DataSetStore>)(Session["Cart"])).Add(new DataSetStore() { ItemName = name, ItemPrice = price });
            Response.Write("true");
        }

    }
}