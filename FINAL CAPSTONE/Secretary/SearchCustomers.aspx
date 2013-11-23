<%@ Page Title="View Customers" Language="C#" MasterPageFile="~/Secretary/MasterPage.master" AutoEventWireup="true" CodeFile="SearchCustomers.aspx.cs" Inherits="Secretary_SearchCustomers" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
    <span class="label label-success text-center" style="width: 98%; background-color:#26972D"><h2>Customers</h2></span>
    <hr />
    <asp:DropDownList ID="ddlColumns" runat="server">
        <asp:ListItem Value="userID">User ID</asp:ListItem>
        <asp:ListItem Value="A.userName">Username</asp:ListItem>
        <asp:ListItem Value="validation">Validation</asp:ListItem>
        <asp:ListItem Value="approval">Approval</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search.."></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary width150px marginB10px" Text="Search" OnClick="btnSearch_Click" />
    <asp:Button ID="btnViewAll" runat="server" CssClass="btn btn-primary width150px marginB10px" Text="View All" OnClick="btnViewAll_Click" />
    <hr />
            <asp:GridView ID="grdCustomers" runat="server" AutoGenerateColumns="False"
                OnSelectedIndexChanged="grdCustomers_SelectedIndexChanged" onpageindexchanging="grdCustomers_PageIndexChanging"
                DataKeyNames="userID" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="customerID" SortExpression="customerID" 
                        ShowHeader="False" HeaderText="Customer ID">
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="userName" HeaderText="Username" SortExpression="userName" ></asp:BoundField>
                    <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" ></asp:BoundField>
                    <asp:BoundField DataField="businessAddress" HeaderText="Address" SortExpression="businessAddress" />
                    <asp:BoundField DataField="businessCPNo" HeaderText="Contact Number" SortExpression="businessContactNo" />
                    <asp:BoundField DataField="validation" HeaderText="isValid?" SortExpression="validation" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="http://localhost:12345/FINAL%20CAPSTONE/Secretary/CustomerDetails.aspx?customerID=<%# Eval("customerID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="boldFont text-center label label-warning">No Records Found!</span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="pagination-centered" VerticalAlign="Middle" Wrap="True" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

            <br />
            <br /><br /><br /> <br />
</asp:Content>

