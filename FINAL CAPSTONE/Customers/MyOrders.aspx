<%@ Page Title="My Orders" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="Customers_MyOrders" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Orders</h4></span>
  <br />
        <h3>You have <span class="badge badge-info" style="line-height: 25px; font-size: 20px;"><asp:Label ID="lblNoOrders" runat="server" CssClass="marginB20px"></asp:Label></span>&nbsp;orders</h3>
            <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrders" 
                OnSelectedIndexChanged="grdOrders_SelectedIndexChanged" 
                AllowPaging="True" DataKeyNames="orderID" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="orderID" HeaderText="ID" SortExpression="orderID" InsertVisible="False" ReadOnly="True" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" /></asp:BoundField>
                    <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" DataFormatString="{0:MMMM dd, yyyy}" >
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="preferredDelivery" HeaderText="Delivery Date" SortExpression="preferredDelivery" DataFormatString="{0:MMMM dd, yyyy}" >
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="deliveryMode" HeaderText="Shipping Mode" SortExpression="modeofDelivery" >
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="amount" HeaderText="Total Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}" />
                    <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
                    <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
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
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

            <asp:SqlDataSource ID="dsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM [Orders] WHERE ([userID] = @userID) ORDER BY [orderDate] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

</asp:Content>

