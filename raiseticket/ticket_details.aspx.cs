using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

using System.Data;
using System.Configuration;

namespace raiseticket
{
    public partial class ticket_details : System.Web.UI.Page
    {
        public string computerName, userName;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                MultiView1.ActiveViewIndex = 0;
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


                using (OleDbConnection con = new OleDbConnection(CS))
                {
                    //con.Open();
                    //OleDbCommand command = new OleDbCommand("select * from dept", con);
                    //OleDbDataReader reader = command.ExecuteReader();
                    //ddlDept.DataSource = reader;
                    //ddlDept.DataTextField = "dept";
                    //ddlDept.DataValueField = "dept";
                    //ddlDept.DataBind();
                    //reader.Close();


                    System.Web.HttpContext context = System.Web.HttpContext.Current;
                    string ipaddress = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];


                    if (!string.IsNullOrEmpty(ipaddress))
                    {
                        string[] addresses = ipaddress.Split(',');
                        if (addresses.Length != 0)
                        {

                            //Response.Write("Client IP address is " + addresses[0]);
                        }
                    }

                    //Response.Write("This is ipaddress " + context.Request.ServerVariables["REMOTE_ADDR"]);

                }
            }
        }

        protected void btnNext1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


            using (OleDbConnection con = new OleDbConnection(CS))
            {
                //con.Open();
                //OleDbCommand command = new OleDbCommand("select * from problem", con);
                //OleDbDataReader reader = command.ExecuteReader();
                //ddlProblem.DataSource = reader;
                //ddlProblem.DataTextField = "description";
                //ddlProblem.DataValueField = "description";
                //ddlProblem.DataBind();
                //reader.Close();


            }
        }

        protected void btnPrevious1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;


            lblCallTime.Text = DateTime.Now.ToShortTimeString();
            lblCallDate.Text = DateTime.Now.ToShortDateString();
            lblDept.Text = ddlDept.SelectedValue + " (Ext - " + txtIntercom.Text + ")";
            lblEmployeeName.Text = txtCallerName.Text;
            lblProblem.Text = ddlProblem.SelectedValue;
            lblAddlDetails.Text = txtAddlDetails.Text;

            string whoIsUser = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            string[] arr = whoIsUser.Split(new string[] { "\\" }, StringSplitOptions.None);
            computerName = arr[0];
            userName = arr[1];
            lblComputerName.Text = computerName;
            lblUserName.Text = userName;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)


        {
            MultiView1.ActiveViewIndex = 3;

            Random rand = new Random();
            int random = rand.Next(1, 99999);
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))
            {
                con.Open();
                OleDbCommand command = new OleDbCommand();
                command.CommandText = "insert into ticket(ticketno, calldate, calltime, dept, callername, extension, problem, description, computername, username) values(@tno, @calldate, @calltime, @dept, @callername, @ext, @problem, @addldetails, @computername, @username)";
                command.Parameters.AddWithValue("@tno", random);
                command.Parameters.AddWithValue("@calldate", lblCallDate.Text);
                command.Parameters.AddWithValue("@calltime", lblCallTime.Text);
                command.Parameters.AddWithValue("@dept", ddlDept.SelectedValue);
                command.Parameters.AddWithValue("@callername", txtCallerName.Text);
                command.Parameters.AddWithValue("@ext", txtIntercom.Text);
                command.Parameters.AddWithValue("@problem", ddlProblem.SelectedValue);
                command.Parameters.AddWithValue("@addldetails", txtAddlDetails.Text);
                command.Parameters.AddWithValue("@computername", lblComputerName.Text);
                command.Parameters.AddWithValue("@username", lblUserName.Text);


                command.Connection = con;
                int a = command.ExecuteNonQuery();
                if (a > 0)
                {

                    lblTicket.Text = "Your ticket has been raised with the following docket number";
                    lblTktno.Text = "<h3>" + random + "</h3>";
                    lblDateTimeStamp.Text = "<h4>" + "On " + lblCallDate.Text + " at " + lblCallTime.Text + "</h4>";


                }
                else
                {
                    lblTicket.Text = "While raising ticket some error was encountered";
                }


            }
        }

        protected void btnPrevious2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
}