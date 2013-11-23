<%@ Page Title="View Scheduled Delivery" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="ViewScheduledDeliveries.aspx.cs" Inherits="GeneralManager_ViewScheduledDeliveries" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Scheduled Deliveries</h4></span>
    <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown"> 
            <asp:ListItem Value="C.businessName">Business Name</asp:ListItem>   
            <asp:ListItem Value="B.orderDate">Order Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryDate">Delivery Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryMode">Delivery Mode</asp:ListItem>    
            <asp:ListItem Value="B.amount">Amount</asp:ListItem> 
            <asp:ListItem Value="B.orderStatus">Order Status</asp:ListItem>  
            <asp:ListItem Value="B.deliveryStatus">Delivery Status</asp:ListItem>         
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px"/>
        <br /><br />
        <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" CssClass="table table-hover width100"
            onpageindexchanging="grdOrders_PageIndexChanging" onselectedindexchanged="grdOrders_SelectedIndexChanged" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" GridLines="Horizontal">
            
                <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="Order ID" 
                            SortExpression="orderID">
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" 
                            SortExpression="businessName" />
                        <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" 
                            SortExpression="deliveryDate" />
                        <asp:BoundField DataField="deliveryMode" HeaderText="Shipping Mode" 
                            SortExpression="deliveryMode" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" 
                            SortExpression="amount" />
                        <asp:BoundField DataField="orderStatus" HeaderText="Order Status" 
                            SortExpression="orderStatus" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" 
                            SortExpression="deliveryStatus" />
                        <asp:TemplateField>
                        <ItemTemplate>
                        <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ScheduledDeliveryDetails.aspx?orderID=<%# Eval("orderID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>

            <EmptyDataTemplate> No records found. </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br /><br />
        <br /><br /><br /><br />

</asp:Content>

