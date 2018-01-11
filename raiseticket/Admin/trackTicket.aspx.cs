using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

namespace raiseticket
{
    public partial class trackTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetStatus_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sqlString = ("select * from ticket where ticketno = @ticketno");

            using (OleDbConnection con = new OleDbConnection(CS))
            {

                OleDbCommand command = new OleDbCommand(sqlString, con);

                command.CommandType = CommandType.Text;

                command.Parameters.AddWithValue("@ticketno", txtTicketNo.Text);

                con.Open();

                OleDbDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    txtTktNo.Text = dr["ticketno"].ToString();
                    txtProblem.Text = dr["problem"].ToString();
                    txtProblemReportedBy.Text = dr["callername"].ToString();
                    Boolean status = Convert.ToBoolean(dr["closestatus"]);

                    if (status)
                    {
                        //txtStatus.Text = dr["closestatus"].ToString();
                        txtStatus.Text = "Closed";
                    }
                    else
                    {
                        txtStatus.Text = "Pending";
                    }

                    txtWhoClosed.Text = dr["membername"].ToString();
                    txtSolution.Text = dr["solution"].ToString();
                    
                }
                

            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtTicketNo.Text = "";
            txtProblemReportedBy.Text = "";
            txtProblem.Text = "";
            txtStatus.Text = "";
            txtSolution.Text = "";
            txtWhoClosed.Text = "";
            txtTktNo.Text = "";

        }

        protected void txtTicketNo_TextChanged(object sender, EventArgs e)
        {


        }
    }
}