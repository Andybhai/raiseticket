<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trackTicket.aspx.cs" Inherits="raiseticket.trackTicket" MasterPageFile="~/Site.Master" %>

<asp:Content ID="track_Ticket" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <style>
        .center{
            margin:auto;
            width:60%;
            padding:10x;
            top:auto;
        }
        .auto-style1 {
            margin-top:20px;
            margin-left:150px;
            width: 65%;
        }
        .auto-style2 {
            width: 107px;
            text-align: center;
        }
        .auto-style3 {
            margin: auto;
            width: 81%;
            height: 386px;
        }
    </style>


        <form id="form1">
            <div class ="auto-style1">
                <table class="auto-style12">
                    <tr>
                        <td class="auto-style13">
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Enter ticket no - " CssClass="auto-style11"></asp:Label>
                        </td>
                        <td class="auto-style14">
                            <br />
                            <br />
                            <asp:TextBox ID="txtTicketNo" runat="server" Height="24px" Width="77px" OnTextChanged="txtTicketNo_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <br />
                            <br />
                            <asp:Button ID="btnGetStatus" runat="server" OnClick="btnGetStatus_Click" Text="Get Status" Width="84px" />
                        </td>
                        <td class="auto-style2">
                            <br />
                            <br />
                            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="75px" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="Silver" BorderColor="#CC3300" BorderStyle="Solid" Height="394px" Width="674px">
                 
                    <table class="auto-style3">
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblTicketNo" runat="server" Text="Ticket No - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style10" style="width: 660px">
                                <asp:TextBox ID="txtTktNo" runat="server" Enabled="False" Height="24px" Width="57px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblProblem" runat="server" Text="Problem reported - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style10" style="width: 660px">
                                <asp:TextBox ID="txtProblem" runat="server" Enabled="False" Height="24px" Width="313px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblProblemReportedBy" runat="server" Text="Reported by - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style10" style="width: 660px">
                                <asp:TextBox ID="txtProblemReportedBy" runat="server" Enabled="False" Height="24px" Width="176px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblStatus" runat="server" Text="Status - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style10" style="width: 660px">
                                <asp:TextBox ID="txtStatus" runat="server" Enabled="False" Height="24px" Width="89px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblWhoClosed" runat="server" Text="Who closed - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style10" style="width: 660px">
                                <asp:TextBox ID="txtWhoClosed" runat="server" Enabled="False" Height="24px" Width="139px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 726px">
                                <asp:Label ID="lblSolutionProvided" runat="server" Text="Solution Provided - "></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style5" style="width: 660px">
                                <asp:TextBox ID="txtSolution" runat="server" Enabled="False" Height="52px" Width="312px"></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                    </table>
                  
                </asp:Panel>
      
            </div>
        </form>
</asp:Content>
