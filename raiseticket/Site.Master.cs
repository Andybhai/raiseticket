using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace raiseticket
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {

                    System.Web.HttpContext context = System.Web.HttpContext.Current;
                    string ipaddress = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

                    if (!string.IsNullOrEmpty(ipaddress))
                    {
                        string[] addresses = ipaddress.Split(',');
                        if (addresses.Length != 0)
                        {

                        lblFooterIP.Text = "Your IP Address is " + addresses[0];
                        }
                    }
                lblFooterIP.Text = "Your IP Address is " + context.Request.ServerVariables["REMOTE_ADDR"];

                }
            }
        }
    }
