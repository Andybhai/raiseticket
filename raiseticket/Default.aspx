<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="raiseticket._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <div class="jumbotron">
        <h2 style="color: #000066">Raise ticket</h2>
        <p class="lead">You can raise your complaints of IT items such as desktops, printers, internet, specific intranet site&nbsp; etc using this tool.</p>
        <p>
            <a href="ticket_details.aspx" class="btn btn-primary btn-lg">
            <asp:Button ID="btnRaiseTicket" runat="server" Text="Raise Ticket » " OnClick="btnRaiseTicket_Click" width="102px" />
            </a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2 style="color: #000066">Follow up...</h2>
            <p>
                In case you feel, your complaint is not attended to your satisfaction or is not attended at all, please click below link -
            </p>
            <p>
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Track Status »" width="102px" />
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="color: #000066">Escalate the matter</h2>
            <p>
                Here you will be in a position to escalate the matter if the issue remains unresolved in specific duration
            </p>
            <p>
                &nbsp;<asp:Button ID="btnLearn" runat="server" Text="Learn More »" width="102px" />
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="color: #000066">Happy :) with the service ?</h2>
            <p>
                We are listening. Please give us your feedback - it can be positive / negative or a suggestion to be implemented.</p>
            <p>
                <asp:Button ID="btnFeedback" runat="server" Text="Feedback »" PostBackUrl="~/feedback.aspx" />
            </p>
        </div>
    </div>

</asp:Content>
