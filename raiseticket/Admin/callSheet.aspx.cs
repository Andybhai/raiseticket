using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace raiseticket
{
    public partial class callSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvCallSheet.BackColor = Color.Cornsilk;
                ddlFilterData.Items.FindByValue("Select...").Selected = true;

            }
        }

        protected void changeGridview(object sender, EventArgs e)
        {

            //Todo: Default value "Select.." in dropdownlist - invalid selection and hiding gridview

            switch (ddlFilterData.SelectedIndex)
            {
                
                case 1:
                    TextBox1.Text = "";
                    pendingcalls();
                    break;
                case 2:
                    TextBox1.Text = "";
                    completedcalls();
                    break;
                case 3:
                    TextBox1.Text = "";
                    callsfortoday();
                    break;

                default:
                    TextBox1.Text = "";
                    ddlFilterData.SelectedIndex = 0;
                    break;
            }

           
            if (ddlFilterData.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(
                    GetType(),
                    "MyKey",
                    "Myfunction();",
                    true);
            }
        }

        private void callsfortoday()
        {
            DateTime dt = DateTime.Now.Date;

            string dtString = dt.ToString("MM/dd/yyyy");

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))

            {
                string cmd = "select ticketno, calldate, dept, callername, problem, description, closestatus, solution, team, membername from ticket where calldate= #" + dtString + "# order by calldate, dept, callername";

                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvCallSheet.DataSource = ds;
                gvCallSheet.DataBind();
                gvCallSheet.BackColor = Color.WhiteSmoke;
            }
        }

        private void completedcalls()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))

            {
                string cmd = "select ticketno, calldate, dept, callername, problem, description, closestatus, solution, team, membername from ticket where closestatus= -1 order by calldate, dept, callername";
                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvCallSheet.DataSource = ds;
                gvCallSheet.DataBind();
                gvCallSheet.BackColor = Color.Azure;
            }
        }

        private void pendingcalls()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))

            {
                //For pending calls
                string cmd = "select ticketno, calldate, dept, callername, problem, description, closestatus from ticket where closestatus= 0 order by calldate, dept, callername";
                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvCallSheet.DataSource = ds;
                gvCallSheet.DataBind();


                gvCallSheet.BackColor = Color.Cornsilk;

            }
        }

        //protected void ExportToExcel(object sender, EventArgs e)
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        //    Response.Charset = "";
        //    Response.ContentType = "application/vnd.ms-excel";
        //    using (StringWriter sw = new StringWriter())
        //    {
        //        HtmlTextWriter hw = new HtmlTextWriter(sw);

        //        //To Export all pages
        //        gvCallSheet.AllowPaging = false;
        //        this.BindGrid();

        //        gvCallSheet.HeaderRow.BackColor = Color.White;
        //        foreach (TableCell cell in gvCallSheet.HeaderRow.Cells)
        //        {
        //            cell.BackColor = gvCallSheet.HeaderStyle.BackColor;
        //        }
        //        foreach (GridViewRow row in gvCallSheet.Rows)
        //        {
        //            row.BackColor = Color.White;
        //            foreach (TableCell cell in row.Cells)
        //            {
        //                if (row.RowIndex % 2 == 0)
        //                {
        //                    cell.BackColor = gvCallSheet.AlternatingRowStyle.BackColor;
        //                }
        //                else
        //                {
        //                    cell.BackColor = gvCallSheet.RowStyle.BackColor;
        //                }
        //                cell.CssClass = "textmode";
        //            }
        //        }

        //        gvCallSheet.RenderControl(hw);

        //        //style to format numbers to string
        //        string style = @"<style> .textmode { } </style>";
        //        Response.Write(style);
        //        Response.Output.Write(sw.ToString());
        //        Response.Flush();
        //        Response.End();
        //    }
        //}

        //private void BindGrid()
        //{
        //    string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(strConnString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("SELECT * FROM Customers"))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter())
        //            {
        //                cmd.Connection = con;
        //                sda.SelectCommand = cmd;
        //                using (DataTable dt = new DataTable())
        //                {
        //                    sda.Fill(dt);
        //                    GridView1.DataSource = dt;
        //                    GridView1.DataBind();
        //                }
        //            }
        //        }
        //    }
        //}



        protected void gvCallSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = Convert.ToDateTime(e.Row.Cells[1].Text).ToString("dd MMM yyyy");

                e.Row.VerticalAlign = VerticalAlign.Middle;
                e.Row.HorizontalAlign = HorizontalAlign.Center;

                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Left;
                e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Left;

                gvCallSheet.HeaderRow.Cells[0].Text = "Ticket No";
                gvCallSheet.HeaderRow.Cells[1].Text = "Date";
                gvCallSheet.HeaderRow.Cells[2].Text = "Dept";
                gvCallSheet.HeaderRow.Cells[3].Text = "Caller Name";
                //gvCallSheet.HeaderRow.Cells[4].Text = "Ph.Ext";
                gvCallSheet.HeaderRow.Cells[4].Text = "Problem";
                gvCallSheet.HeaderRow.Cells[5].Text = "Additional Details";
                gvCallSheet.HeaderRow.Cells[6].Text = "Status";

                if (e.Row.Cells.Count > 8)
                {
                    gvCallSheet.HeaderRow.Cells[7].Text = "Solution";
                    gvCallSheet.HeaderRow.Cells[8].Text = "Team";
                    gvCallSheet.HeaderRow.Cells[9].Text = "Member";

                }
                gvCallSheet.CellPadding = 2;
                gvCallSheet.AllowSorting = true;
                gvCallSheet.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            //DateTime dt = Calendar1.SelectedDate;

            DateTime dt = Convert.ToDateTime(TextBox1.Text);

            // Convert.ToDateTime((TextBox1.Text), "dd/MM/yyyy")

            string dtString = dt.ToString("MM/dd/yyyy");

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))

            {
                string cmd = "select ticketno, calldate, dept, callername, problem, description, closestatus, solution, team, membername  from ticket where calldate= #" + dtString + "# order by calldate, dept, callername";

                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvCallSheet.DataSource = ds;
                gvCallSheet.DataBind();


                gvCallSheet.BackColor = Color.WhiteSmoke;
                ddlFilterData.ClearSelection();

            }
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {

            DateTime dt = Convert.ToDateTime(TextBox1.Text);

            string dtString = dt.ToString("MM/dd/yyyy");

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(CS))

            {
                string cmd = "select ticketno, calldate, dept, callername, problem, description, closestatus from ticket where calldate= #" + dtString + "# order by calldate, dept, callername";

                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvCallSheet.DataSource = ds;
                gvCallSheet.DataBind();


                gvCallSheet.BackColor = Color.WhiteSmoke;
                ddlFilterData.ClearSelection();

            }
        }

        protected void gvCallSheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCallSheet.PageIndex = e.NewPageIndex;

            if (ddlFilterData.SelectedValue== "Pending Calls")
            {
                pendingcalls();
            }
            else if(ddlFilterData.SelectedValue== "Completed Calls")
            {
                completedcalls();
            }
            else if (ddlFilterData.SelectedValue== "Calls for today")
            {
                callsfortoday();
            }
            else if(ddlFilterData.SelectedValue== "Select...")
            {
                TextBox1_TextChanged(null, null);
            }
            gvCallSheet.DataBind();
            
        }

     
    }
}
