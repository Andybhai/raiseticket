using System;
using System.Web.UI.WebControls;

namespace raiseticket
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        // static variable
        static string prevPage = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
                
            }

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            
            //SqlDataSource1.Update();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string callcltime = DateTime.Now.ToString("h:mm tt");
            SqlDataSource1.UpdateParameters["callcldate"].DefaultValue = DateTime.Now.ToShortDateString();
            SqlDataSource1.UpdateParameters["callcltime"].DefaultValue = callcltime;
        }
    }
}