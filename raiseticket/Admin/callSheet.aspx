<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="callSheet.aspx.cs" MasterPageFile="~/Site.Master" Inherits="raiseticket.callSheet" %>

<asp:Content ID="fromCallSheet" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <link rel="stylesheet" href="../CSS/StyleSheet1.css" type="text/css" />
    <script type="text/javascript">
        function Myfunction() {
            alert("Invalid selection");

        }
    </script>

    <div id="conditionaldata" style="vertical-align:text-top;">
        <table class="nav-justified" style="width: 100%; vertical-align:top;  margin-left: 10px; margin-top:5px;">
            <tr>
                <td style="width: 333px; "><strong>Conditional data -</strong>
                    <asp:DropDownList ID="ddlFilterData" runat="server" Height="30px"  OnSelectedIndexChanged="changeGridview" AutoPostBack="true" Width="160px">
                        <asp:ListItem>Select...</asp:ListItem>
                        <asp:ListItem>Pending Calls</asp:ListItem>
                        <asp:ListItem>Completed Calls</asp:ListItem>
                        <asp:ListItem>Calls for today</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td style="width: 340px">
                    D<strong>ate wise -
                </strong>
                    <asp:TextBox ID="TextBox1" runat="server"  OnTextChanged="TextBox1_TextChanged" TextMode="Date" Height="30px" Width="141px"></asp:TextBox>
                    
                &nbsp;<asp:Button ID="btnGet" runat="server" OnClick="btnGet_Click" Text="Get" Height="30px" />
                    
                </td>
            </tr>
            </table>
        <br />
        <div>
            <asp:Label ID="lblDataType" runat="server"></asp:Label>
            <asp:GridView 
                ID="gvCallSheet" 
                runat="server"
            GridLines="None"
            AllowPaging="True"
            PageSize="10"
            AllowSorting="True"
            HorizontalAlign="Center"
            CssClass="cssGridView"
            OnRowDataBound="gvCallSheet_RowDataBound" OnPageIndexChanging="gvCallSheet_PageIndexChanging">
                <PagerSettings FirstPageText="Page &amp;lt;&amp;lt;" />
                <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" />
            </asp:GridView>
        </div>
    </div>

</asp:Content>

