<%@ Page Title="Search Orders" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="SearchOrders.aspx.cs" Inherits="GeneralManager_SearchOrders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Search Orders</h4></span>
    <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="B.orderID">Order ID</asp:ListItem>
            <asp:ListItem Value="B.amount">Amount</asp:ListItem>
            <asp:ListItem Value="B.orderDate">Order Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryDate">Delivery Date</asp:ListItem>
            <asp:ListItem Value="B.preferredDelivery">Preferred Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryMode">Shipping Mode</asp:ListItem>
            <asp:ListItem Value="B.concerns">Concerns</asp:ListItem>
            <asp:ListItem Value="B.validation">Validation</asp:ListItem>
            <asp:ListItem Value="B.orderStatus">Order Status</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginB10px" onclick="btnSearch_Click" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px marginB10px" onclick="btnViewAll_Click" Text="View All" />
        <br />
    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="width100 table table-hover"
            CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" 
            onpageindexchanging="gvOrders_PageIndexChanging" 
            onselectedindexchanged="gvOrders_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="orderID" HeaderText="Order ID" SortExpression="orderID">
                <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                </asp:BoundField>
                <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" />
                <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" SortExpression="deliveryDate" DataFormatString="{0:MMMM dd, yyyy}" />
                <asp:BoundField DataField="deliveryMode" HeaderText="Delivery Mode" SortExpression="deliveryMode" />
                <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}"/>
                <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
                <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
                <asp:TemplateField>
                    <ItemTemplate>
                    <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/OrderDetails.aspx?orderID=<%# Eval("orderID") %>" class="btn btn-primary text-center pull-right">View Details</a>
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

