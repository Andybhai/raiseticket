<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="raiseticket.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

        <table class="auto-style1">
            <tr>
                <td style="padding: 1px; margin: 1px; border-spacing: 3px; border-collapse: collapse; top: 1px; height: 40px;" class="auto-style2" colspan="2">
                <h1 style="text-align: left">Feedback </h1></td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label1" runat="server" Text="Your Name:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:TextBox ID="txtName" runat="server" Width="340px" Height="20px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label2" runat="server" Text="Subject:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:TextBox ID="txtSubject" runat="server" Width="340px" Height="20px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label3" runat="server" Text="Email ID:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="252px" Height="20px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label4" runat="server" Text="Category:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:RadioButtonList ID="rdBtnCategory" runat="server" RepeatDirection="Horizontal" Width="375px">
                        <asp:ListItem Selected="True">Appreciation</asp:ListItem>
                        <asp:ListItem>Suggestion</asp:ListItem>
                        <asp:ListItem>Complaint</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label5" runat="server" Text="Reference docket no:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:TextBox ID="refDocketNos" runat="server" Width="252px" Height="20px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:Label ID="Label6" runat="server" Text="Description:"></asp:Label>
                </td>
                <td style="border-style: none; border-width: 0px; padding: 5px; margin: 5px;">
                    <asp:TextBox ID="txtDescription" runat="server" Height="69px" TextMode="MultiLine" Width="340px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <br />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="31px" OnClick="btnCancel_Click" PostBackUrl="~/Default.aspx" />
                    <br style="border-style: inset; border-width: 3px" />
                </td>
                <td>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="31px" />
                    <br style="border-style: inset; border-width: 3px" />
                </td>
            </tr>
        </table>





</asp:Content>
