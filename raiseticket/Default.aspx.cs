using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace raiseticket
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("Application code executed using ");
            //Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name + "<br/>");

            //string whoIsUser = System.Security.Principal.WindowsIdentity.GetCurrent().Name;

            //string[] arr = whoIsUser.Split(new string[] { "\\" }, StringSplitOptions.None);

            //Response.Write("Your Computer Name " + arr[0] + "</br>");
            //Response.Write("You have logged in as - " + arr[1]);

            //Response.Write("Is User Authenticated: ");
            //Response.Write(User.Identity.IsAuthenticated.ToString() + "<br/>");

            //Response.Write("Authentication Type, if Authenticated: ");
            //Response.Write(User.Identity.AuthenticationType + "<br/>");

            //Response.Write("User Name, if Authenticated: ");
            //Response.Write(User.Identity.Name + "<br/>");
        }

        protected void btnRaiseTicket_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("ticket_details.aspx");
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/trackTicket.aspx");
        }
    }
}