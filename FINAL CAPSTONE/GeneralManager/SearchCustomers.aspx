<%@ Page Title="Search Customers" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="SearchCustomers.aspx.cs" Inherits="GeneralManager_SearchCustomers" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
   <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Search Customers</h4></span>
    <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="customerID">ID</asp:ListItem>
            <asp:ListItem Value="businessName">Business Name</asp:ListItem>
            <asp:ListItem Value="businessAddress">Business Address</asp:ListItem>
            <asp:ListItem Value="businessTelNo">Business Telephone No.</asp:ListItem>
            <asp:ListItem Value="businessLocalNo">Business Local No.</asp:ListItem>
            <asp:ListItem Value="businessCPNo">Business Cellphone No.</asp:ListItem>
            <asp:ListItem Value="businessFaxNo">Business Fax No.</asp:ListItem>
            <asp:ListItem Value="customerLN">Last Name</asp:ListItem>
            <asp:ListItem Value="customerFN">First Name</asp:ListItem>
            <asp:ListItem Value="customerEmail">Email</asp:ListItem>
            <asp:ListItem Value="validation">Validation</asp:ListItem>
            <asp:ListItem Value="approval">Approval</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtKeyword" Display="Dynamic" CssClass="label label-important"
            ErrorMessage="Insert keyword here." Font-Size="Small" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginB10px" onclick="btnSearch_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px marginB10px" onclick="btnViewAll_Click" Text="View All" />
    <br />
    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" 
            onpageindexchanging="gvCustomers_PageIndexChanging" CssClass
        ="table table-hover width100"
            onselectedindexchanged="gvCustomers_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="customerID" HeaderText="ID">
                <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                </asp:BoundField>
                <asp:BoundField DataField="businessName" HeaderText="Business Name" />
                <asp:BoundField DataField="businessAddress" HeaderText="Business Address" />
                <asp:BoundField DataField="businessTelNo" HeaderText="Business Telephone No." />
                <asp:BoundField DataField="businessLocalNo" HeaderText="Business Local No." />
                <asp:BoundField DataField="validation" HeaderText="Validation" />
                <asp:BoundField DataField="approval" HeaderText="Approval" />
                <asp:TemplateField>
                <ItemTemplate>
                <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/CustomerInfo.aspx?customerID=<%# Eval("customerID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No Records Found!</span>
            </EmptyDataTemplate> 
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
            
    </div>
</asp:Content>

