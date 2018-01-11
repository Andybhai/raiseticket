<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ticketClosure.aspx.cs" Inherits="raiseticket.ticketClosure" MasterPageFile="~/Site.Master" %>

<asp:Content ID="ticketsClosure" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <link rel="stylesheet" href="../CSS/StyleSheet1.css" type="text/css" />

    <div>
        <script type="text/javascript">
            setTimeout(function () {
                location = ''
            }, 30000)
        </script>


        <asp:GridView
            ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            GridLines="None"
            DataKeyNames="ID"
            DataSourceID="SqlDataSource1"
            AllowPaging="True"
            AllowSorting="True"
            HorizontalAlign="Center"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            CssClass="cssGridView"
            PagerStyle-CssClass="pgr">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Id", "~/Admin/details.aspx?Id={0}") %>' Text="View details"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>

                <asp:BoundField DataField="ticketno" HeaderText="Ticket No" ItemStyle-Width="50px" SortExpression="ticketno">
                    <ItemStyle Width="50px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="calldate" HeaderText="Date" ItemStyle-Width="85px" DataFormatString="{0:d}" SortExpression="calldate">
                    <ItemStyle Width="85px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="calltime" HeaderText="Time" ItemStyle-Width="70px" DataFormatString="{0:t}" SortExpression="calltime">
                    <ItemStyle Width="70px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="dept" HeaderText="Dept" SortExpression="dept" />
                <asp:BoundField DataField="callername" HeaderText="Employee" SortExpression="callername" />
                <asp:BoundField DataField="problem" HeaderText="Problem" SortExpression="problem" />
                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                <asp:CheckBoxField DataField="closestatus" HeaderText="Status" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="closestatus">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CheckBoxField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Justify" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" ProviderName="<%$ ConnectionStrings:DBCS.ProviderName %>" SelectCommand="SELECT [ID], [ticketno], [dept], [callername], [problem], [calldate], [calltime], [extension], [description], [closestatus] FROM [ticket] WHERE ([closestatus] &lt;&gt; ?) ORDER BY [ID]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="closestatus" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

        <%--Original command <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                ProviderName="<%$ ConnectionStrings:DBCS.ProviderName %>" 
                SelectCommand="SELECT * FROM [ticket] WHERE ([ID] = ?)" 
                UpdateCommand="UPDATE [ticket] SET [ticketno] = ?, [calldate] = ?, [calltime] = ?, [dept] = ?, [callername] = ?, [extension] = ?, [problem] = ?, [description] = ?, [solution] = ?, [team] = ?, [membername] = ?, [closestatus] = ?, [computername] = ?, [username] = ? WHERE [ID] = ?" 
                DeleteCommand="DELETE FROM [ticket] WHERE [ID] = ?" InsertCommand="INSERT INTO [ticket] ([ID], [ticketno], [calldate], [calltime], [dept], [callername], [extension], [problem], [description], [solution], [team], [membername], [closestatus], [computername], [username]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)">--%>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>"
            ProviderName="<%$ ConnectionStrings:DBCS.ProviderName %>"
            SelectCommand="SELECT * FROM [ticket] WHERE ([ID] = ?)"
            UpdateCommand="UPDATE [ticket] SET [solution] = ?, [team] = ?, [membername] = ?, [closestatus] = ? WHERE [ID] = ?"
            DeleteCommand="DELETE FROM [ticket] WHERE [ID] = ?" InsertCommand="INSERT INTO [ticket] ([ID], [ticketno], [calldate], [calltime], [dept], [callername], [extension], [problem], [description], [solution], [team], [membername], [closestatus], [computername], [username]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)">

            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="ticketno" Type="Int32" />
                <asp:Parameter Name="calldate" Type="DateTime" />
                <asp:Parameter Name="calltime" Type="DateTime" />
                <asp:Parameter Name="dept" Type="String" />
                <asp:Parameter Name="callername" Type="String" />
                <asp:Parameter Name="extension" Type="String" />
                <asp:Parameter Name="problem" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="solution" Type="String" />
                <asp:Parameter Name="team" Type="String" />
                <asp:Parameter Name="membername" Type="String" />
                <asp:Parameter Name="closestatus" Type="Boolean" />
                <asp:Parameter Name="computername" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>

            <UpdateParameters>
                <%--<asp:Parameter Name="ticketno" Type="Int32" />
                    <asp:Parameter Name="calldate" Type="DateTime" />
                    <asp:Parameter Name="calltime" Type="DateTime" />
                    <asp:Parameter Name="dept" Type="String" />
                    <asp:Parameter Name="callername" Type="String" />
                    <asp:Parameter Name="extension" Type="String" />
                    <asp:Parameter Name="problem" Type="String" />
                    <asp:Parameter Name="description" Type="String" />--%>
                <asp:Parameter Name="solution" Type="String" />
                <asp:Parameter Name="team" Type="String" />
                <asp:Parameter Name="membername" Type="String" />
                <asp:Parameter Name="closestatus" Type="Boolean" />
                <%--<asp:Parameter Name="computername" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />--%>
            </UpdateParameters>


        </asp:SqlDataSource>
    </div>

</asp:Content>
