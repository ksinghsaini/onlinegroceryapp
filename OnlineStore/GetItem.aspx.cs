using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineStore
{
    public partial class GetItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                Response.Write("[");
                var inp = ((List<DataSetStore>)(Session["Cart"]));
                int q = 0;
                foreach (DataSetStore i in inp)
                {
                    Response.Write("{\"name\":\"" + i.ItemName + "\",\"price\":\"" + i.ItemPrice + "\"}");
                    if (++q < inp.Count) Response.Write(",");
                }
                Response.Write("]");
            }
            else Response.Write("false");
        }
    }
}