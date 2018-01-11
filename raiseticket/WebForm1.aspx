<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="raiseticket.ticket_details" MasterPageFile="~/Site.Master" %>

<asp:content id="ticketdetails" contentplaceholderid="MainContent" runat="server">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 70%; border-style: solid; border-width: 1px; background-color: #FFFFFF" align="center">
                    <tr>
                        <td style="width: 292px; height: 53px;" class="text-left">
                            <br />
                            Docket No
                            <br />
                        </td>
                        <td style="width: 397px; height: 53px;">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 136px; height: 53px;">
                            <asp:Button ID="btnNext1" runat="server" OnClick="btnNext1_Click" Text="Search" Width="109px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 292px" class="text-left">
                            Problem</td>
                        <td style="width: 397px">
                            <br />
                            <asp:TextBox ID="txtCallerName" runat="server" Width="312px" Height="22px"></asp:TextBox>
                            <br />
                        </td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 292px" class="text-left">Status</td>
                        <td style="width: 397px">
                            <br />
                            <asp:TextBox ID="txtIntercom" runat="server" Width="63px" Height="22px"></asp:TextBox>
                            <br />
                        </td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 292px">&nbsp;</td>
                        <td style="width: 397px">&nbsp;</td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 292px">&nbsp;</td>
                        <td style="width: 397px">&nbsp;</td>
                        <td style="width: 136px" class="text-center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                </table>
    </form>
</body>
</html>
    </asp:content>
