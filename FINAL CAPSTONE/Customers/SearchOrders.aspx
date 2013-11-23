<%@ Page Title="Search Orders" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="SearchOrders.aspx.cs" Inherits="Customers_SearchOrders" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h4>Search Order</h4></span>
    <br /> <br />   
    <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-error alert-block lineheight40 boldFont text-center width100" Visible="false"></asp:Label>
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="Orders.orderID">Order ID</asp:ListItem>
            <asp:ListItem Value="Orders.orderDate">Order Date</asp:ListItem>
            <asp:ListItem Value="Orders.preferredDelivery">Preferred Delivery Date</asp:ListItem>
            <asp:ListItem Value="Orders.deliveryMode">Shipping Method</asp:ListItem>
            <asp:ListItem Value="Orders.amount">Amount</asp:ListItem>
            <asp:ListItem Value="Orders.orderStatus">Order Status</asp:ListItem>
            <asp:ListItem Value="Orders.deliveryStatus">Delivery Status</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="search..."></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvSearch" runat="server" 
        ControlToValidate="txtSearch" Display="Dynamic" 
        ErrorMessage="Insert keyword here." Font-Size="Small" CssClass="label label-important" ForeColor="White"></asp:RequiredFieldValidator>
    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" CssClass="btn btn-primary width150px marginB10px" Text="Search" />
    <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="marginB10px btn btn-primary width150px"/>
    <br />
        <asp:GridView ID="grdOrders" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" onselectedindexchanged="grdOrders_SelectedIndexChanged" 
        AutoGenerateColumns="False" ForeColor="Black" GridLines="Horizontal" CssClass="table table-hover width100">

             <Columns>
                <asp:BoundField DataField="orderID" HeaderText="Order ID" >
                <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                </asp:BoundField>
                <asp:BoundField DataField="orderDate" HeaderText="Order Date" DataFormatString="{0:MMMM d, yyyy}"/>
                <asp:BoundField DataField="preferredDelivery" HeaderText="Preferred Date" DataFormatString="{0:MMMM d, yyyy}" />
                <asp:BoundField DataField="deliveryMode" HeaderText="Delivery Mode" />
                <asp:BoundField DataField="amount" HeaderText="Amount" DataFormatString="{0:#,##0.00}"/>
                <asp:BoundField DataField="orderStatus" HeaderText="Order Status" /> 
                <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" />               
                <asp:TemplateField>
                <ItemTemplate>
                <a href="http://localhost:12345/FINAL%20CAPSTONE/Customers/OrderDetails.aspx?orderID=<%# Eval("orderID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                </ItemTemplate>
                </asp:TemplateField>                
            </Columns>

            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No Records Found!</span>
            </EmptyDataTemplate>     

            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
        <br />
</asp:Content>

