using System;
using System.Web.UI;
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

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            
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

            DropDownList dropDownList = (DropDownList)DetailsView1.FindControl("DropDownList1");

            SqlDataSource1.UpdateParameters["team"].DefaultValue = dropDownList.SelectedValue;

            DropDownList dropDownList2 = (DropDownList)DetailsView1.FindControl("DropDownList2");

            SqlDataSource1.UpdateParameters["membername"].DefaultValue = dropDownList2.SelectedValue;


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Getting selected value of first dropdownlist -Company Name
            //DropDownList dropDownList1 = (DropDownList)DetailsView1.FindControl("DropDownList1");
            // string param_company = dropDownList1.SelectedValue;

            // XmlDataSource xmlDataSource2 = (XmlDataSource)DetailsView1.FindControl("XmlDataSource2");
            // xmlDataSource2.DataFile = "~/App_Data/xml/team_member.xml";

            // //Filter data in xmlDataSource2 based on selection done
            // //xmlDataSource.XPath = "//support/company[@team='HCL']";
            // xmlDataSource2.XPath = "//support/company[@team='" + param_company + "']";

            // xmlDataSource2.DataBind();

            // DropDownList dropDownList2 = (DropDownList)DetailsView1.FindControl("DropDownList2");
            // dropDownList2.DataBind();
            fill_dropdownlist1();


        }

        protected void fill_dropdownlist1()
        {

            //Getting selected value of first dropdownlist -Company Name
            DropDownList dropDownList1 = (DropDownList)DetailsView1.FindControl("DropDownList1");
            //string param_company = dropDownList1.SelectedValue;
            string param_company = dropDownList1.Text;

            XmlDataSource xmlDataSource2 = (XmlDataSource)DetailsView1.FindControl("XmlDataSource2");
            xmlDataSource2.DataFile = "~/App_Data/xml/team_member.xml";

            //Filter data in xmlDataSource2 based on selection done
            //Expected syntax xmlDataSource.XPath = "//support/company[@team='HCL']";
            xmlDataSource2.XPath = "//support/company[@team='" + param_company + "']";

            xmlDataSource2.DataBind();

            DropDownList dropDownList2 = (DropDownList)DetailsView1.FindControl("DropDownList2");
            dropDownList2.DataBind();

        }

        protected void DropDownList2_Load(object sender, EventArgs e)
        {
            ////Getting selected value of first dropdownlist -Company Name
            //DropDownList dropDownList1 = (DropDownList)DetailsView1.FindControl("DropDownList1");
            ////string param_company = dropDownList1.SelectedValue;
            //string param_company = dropDownList1.Text;

            //XmlDataSource xmlDataSource2 = (XmlDataSource)DetailsView1.FindControl("XmlDataSource2");
            //xmlDataSource2.DataFile = "~/App_Data/xml/team_member.xml";

            ////Filter data in xmlDataSource2 based on selection done
            ////Expected syntax xmlDataSource.XPath = "//support/company[@team='HCL']";
            //xmlDataSource2.XPath = "//support/company[@team='" + param_company + "']";

            //xmlDataSource2.DataBind();

            //DropDownList dropDownList2 = (DropDownList)DetailsView1.FindControl("DropDownList2");
            //dropDownList2.DataBind();


        }

        protected void DetailsView1_ModeChanged(Object sender, EventArgs e)
        {
            //switch (DetailsView1.CurrentMode)
            //{
            //    case DetailsViewMode.Edit:

            //        DetailsView1.HeaderText = "Edit Mode";
            //        Response.Write("ModeChanged");
            //        DetailsView1.HeaderStyle.ForeColor = System.Drawing.Color.Red;
            //        DetailsView1.HeaderStyle.BackColor = System.Drawing.Color.LightGray;


            //        break;
            //}
        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            //fill_dropdownlist1();
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            fill_dropdownlist1();
        }
    }
}