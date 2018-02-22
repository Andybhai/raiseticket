<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ticket_details.aspx.cs" Inherits="raiseticket.ticket_details" MasterPageFile="~/Site.Master" %>


<asp:Content ID="ticketdetails" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <!DOCTYPE html>


    <html>
    <head>
        <title>Raise ticket form</title>

    </head>
    <body>

        <asp:MultiView ID="MultiView1" runat="server">

            <asp:View ID="View1" runat="server">

                <span></span>
                <h1>Your details -</h1>
                <table style="width: 70%; border-style: solid; border-width: 1px; background-color: #FFFFFF" align="center">
                    <tr>
                        <td style="width: 358px; height: 53px;" class="text-left">
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Department" ForeColor="White" Style="color: #000000"></asp:Label>
                            <br />
                        </td>
                        <td style="width: 397px; height: 53px;">
                            <asp:DropDownList ID="ddlDept" runat="server" Height="25px" Width="127px" DataSourceID="XmlDataSource1" DataTextField="deptname" DataValueField="deptname">
                            </asp:DropDownList>
                            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/xml/depts.xml"></asp:XmlDataSource>
                        </td>
                        <td style="width: 136px; height: 53px;"></td>
                    </tr>
                    <tr>
                        <td style="width: 358px" class="text-left">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text="Name" ForeColor="White" Style="color: #000000"></asp:Label>
                        </td>
                        <td style="width: 397px">
                            <br />
                            <asp:TextBox ID="txtCallerName" runat="server" Width="312px" Height="22px"></asp:TextBox>
                            <br />
                        </td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 358px" class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Intercom</td>
                        <td style="width: 397px">
                            <br />
                            <asp:TextBox ID="txtIntercom" runat="server" Width="63px" Height="22px"></asp:TextBox>
                            <br />
                        </td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 358px">&nbsp;</td>
                        <td style="width: 397px">&nbsp;</td>
                        <td style="width: 136px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 358px">&nbsp;</td>
                        <td style="width: 397px">&nbsp;</td>
                        <td style="width: 136px" class="text-center">
                            <asp:Button ID="btnNext1" runat="server" OnClick="btnNext1_Click" Text="Next" Width="68px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                </table>
            </asp:View>


            <asp:View ID="View2" runat="server">
                <h1>Problem details</h1>

                <table style="width: 70%; border-style: solid; border-width: 1px; background-color: #FFFFFF" align="center">
                    <tr>
                        <td style="width: 311px; height: 82px;" class="text-left">
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" runat="server" Text="Nature of problem" ForeColor="White" Style="color: #000000"></asp:Label>
                            <br />
                        </td>
                        <td style="height: 82px;" colspan="2">
                            <asp:DropDownList ID="ddlProblem" runat="server" Height="25px" Width="432px" style="margin-left: 3px" DataSourceID="XmlDataSource2" DataTextField="desc" DataValueField="desc">
                            </asp:DropDownList>
                            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/xml/problems.xml"></asp:XmlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 311px; height: 55px;" class="text-left">
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Different problem ?
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (not in the above list)</td>
                        <td style="width: 399px" rowspan="2">
                            <br />
                            <asp:TextBox ID="txtDifferentProblem" runat="server" Width="428px" Height="25px"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 311px" class="text-left">&nbsp;</td>
                        <td style="width: 133px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 311px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Additional details</td>
                        <td style="width: 399px">
                            <asp:TextBox ID="txtAddlDetails" runat="server" Height="60px" TextMode="MultiLine" Width="430px"></asp:TextBox>
                        </td>
                        <td style="width: 133px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 311px" class="text-center">
                            &nbsp;</td>
                        <td style="width: 399px" class="auto-style2">
                            <br />
                            <asp:Button ID="btnPrevious1" runat="server" OnClick="btnPrevious1_Click" Text="Previous" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnProceed" runat="server" CssClass="col-md-offset-0" OnClick="btnProceed_Click" Text="Proceed" Width="87px" />
                        </td>
                        <td style="width: 133px" class="text-center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="View3" runat="server">
                <h1>Confirm </h1>
                <table style="width: 70%; border-style: solid; border-width: 1px; background-color: #FFFFFF" align="center">
                    <tr>
                        <td style="height: 24px;" class="text-left" colspan="2">
                            <br />
                            <h2 class="auto-style2">Your details</h2>
                            <p class="text-center">
                                &nbsp;</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 245px; height: 21px; text-align: right;" class="text-right">
                            <strong>Call Time - </strong>
                            <br />
                            </td>
                        <td style="width: 252px; height: 21px;">
                            <asp:Label ID="lblCallTime" runat="server"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 245px; text-align: right;" class="text-right"><strong>Call Date - </strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblCallDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" style="width: 245px; text-align: right;"><strong>Your Computer name - </strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblComputerName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" style="width: 245px; text-align: right;"><strong>Logged in user name -</strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblUserName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" style="width: 245px; text-align: right;"><strong>Your department &amp; ext -</strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblDept" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" style="width: 245px; text-align: right;"><strong>Your name - </strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" style="width: 245px; text-align: right;"><strong>Nature of problem - </strong></td>
                        <td style="width: 252px">
                            <asp:Label ID="lblProblem" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 245px; height: 73px; text-align: right;" class="text-right"><strong>Additional details - </strong></td>
                        <td style="width: 252px; height: 73px;">
                            <asp:Label ID="lblAddlDetails" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 245px">&nbsp;</td>
                        <td style="width: 252px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 245px; text-align: right;" class="text-center">
                            <asp:Button ID="btnPrevious2" runat="server" OnClick="btnPrevious2_Click" Text="Previous" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td style="width: 252px" class="text-center">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" CssClass="col-md-offset-0" OnClick="btnSubmit_Click" Text="Submit" Width="87px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>

            </asp:View>


            <asp:View ID="View4" runat="server">
                <h1>&nbsp;</h1>
                <table style="width: 70%; border-style: solid; border-width: 1px; background-color: #FFFFFF" align="center">
                    <tr>
                        <td style="height: 24px;" class="auto-style2" colspan="2">
                            <br />
                            <h2 class="text-center">Ticket details</h2>
                            <p class="auto-style2">
                                &nbsp;</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 21px;" class="auto-style2" colspan="2">
                            <asp:Label ID="lblTicket" runat="server"></asp:Label>
                            <br />
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:Label ID="lblTktno" runat="server"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:Label ID="lblDateTimeStamp" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 245px" class="text-center">
                            &nbsp;</td>
                        <td style="width: 252px" class="text-center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
                <script type="text/javascript">
                    window.setTimeout(function () {
                        window.location.href = 'default.aspx';
                    }, 5000);
                </script>
            </asp:View>

        </asp:MultiView>


    </body>

    </html>

</asp:Content>
