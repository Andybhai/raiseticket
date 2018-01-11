<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="raiseticket.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <link rel="stylesheet" href="../CSS/StyleSheet1.css" type="text/css" />


    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:DBCS %>"
        ProviderName="<%$ ConnectionStrings:DBCS.ProviderName %>"
        SelectCommand="SELECT * FROM [ticket] WHERE ([ID] = ?)"
        DeleteCommand="DELETE FROM [ticket] WHERE [ID] = ?"
        InsertCommand="INSERT INTO [ticket] ([ID], [ticketno], [calldate], [calltime], [dept], [callername], [extension], [problem], [description], [solution], [team], [membername], [closestatus], [computername], [username]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        UpdateCommand="UPDATE [ticket] SET [solution] = ?, [team] = ?, [membername] = ?, [closestatus] = ?, [callcldate] = ?, [callcltime] = ? WHERE [ID] = ?">
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
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:Parameter Name="solution" Type="String" />
            <asp:Parameter Name="team" Type="String" />
            <asp:Parameter Name="membername" Type="String" />
            <asp:Parameter Name="closestatus" Type="Boolean" />
            <asp:Parameter Name="callcldate" Type="DateTime" />
            <asp:Parameter Name="callcltime" Type="DateTime" />

        </UpdateParameters>

    </asp:SqlDataSource>


    <asp:DetailsView
        ID="DetailsView1"
        runat="server"
        HeaderText="Change Status"
        AutoGenerateRows="False"
        DataKeyNames="ID"
        DataSourceID="SqlDataSource1"
        CssClass="cssDetailsView"
        HeaderStyle-CssClass="header"
        FieldHeaderStyle-CssClass="fieldheader"
        ItemStyle-CssClass="item"
        CommandRowStyle-CssClass="command"
        PagerStyle-CssClass="pager"
        EditRowStyle-CssClass="edit" Width="506px" BackColor="White" Font-Bold="True" ForeColor="White" Wrap="False" OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating">


        <CommandRowStyle CssClass="command"></CommandRowStyle>


        <EditRowStyle CssClass="edit"></EditRowStyle>



        <FieldHeaderStyle CssClass="fieldheader"></FieldHeaderStyle>



        <Fields>

            <asp:BoundField DataField="ticketno" ReadOnly="True" HeaderText="Ticket No" SortExpression="ticketno" />
            <asp:BoundField DataField="calldate" ReadOnly="True" HeaderText="Call date" DataFormatString="{0:d}" SortExpression="calldate" />
            <asp:BoundField DataField="calltime" ReadOnly="True" HeaderText="Call time" DataFormatString="{0:t}" SortExpression="calltime" />
            <asp:BoundField DataField="dept" ReadOnly="True" HeaderText="Department" SortExpression="dept" />
            <asp:BoundField DataField="callername" ReadOnly="True" HeaderText="Name of employee" SortExpression="callername" />
            <asp:BoundField DataField="extension" ReadOnly="True" HeaderText="Phone Ext" SortExpression="extension" />
            <asp:BoundField DataField="problem" ReadOnly="True" HeaderText="Problem reported" SortExpression="problem" />
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Height="40px" Text='<%# Bind("description") %>' Width="330px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Solution provided" SortExpression="solution">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Height="37px" Text='<%# Bind("solution") %>' Width="331px" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("solution") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Height="37px" Text='<%# Bind("solution") %>' Width="330px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Team Name" SortExpression="team">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="130px"
                        SelectedValue='<%# Bind("team") %>'>
                        <asp:ListItem>HCL</asp:ListItem>
                        <asp:ListItem>Silver Touch</asp:ListItem>
                        <asp:ListItem>Starminds</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("team") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("team") %>' Height="19px" Width="330px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name who attended" SortExpression="membername">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="19px" Text='<%# Bind("membername") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("membername") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("membername") %>' Width="200px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="closestatus" HeaderText="Status" SortExpression="closestatus" />

            <asp:CommandField ButtonType="Button" ControlStyle-Width="100px" DeleteText="" InsertText="" InsertVisible="False" ShowEditButton="True" ControlStyle-Height="35px" EditText="Close ticket" UpdateText="Save">

                <ControlStyle Height="35px" Width="100px"></ControlStyle>


            </asp:CommandField>

            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CommandName="" Height="29px" Text="Back" Width="76px" CssClass="templatebutton" OnClick="btnBack_Click" />

                </ItemTemplate>
                <ControlStyle CssClass="templatebutton" />
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

        </Fields>
        <FooterStyle BackColor="#660033" ForeColor="White" />

        <HeaderStyle CssClass="header"></HeaderStyle>

        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>


</asp:Content>
