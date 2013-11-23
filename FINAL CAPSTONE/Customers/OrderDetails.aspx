<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="Customers_OrderDetails" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
     <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h4>Order Details</h4></span>
            <asp:GridView ID="grdOrderDetails" runat="server" AutoGenerateColumns="False"  
                AllowPaging="True" CssClass="table table-hover width100" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                        <asp:BoundField DataField="productID" HeaderText="ID" SortExpression="productID" >
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="productImage" HeaderText="Image">
                            <ControlStyle CssClass="img100" />
                        </asp:ImageField>
                        <asp:BoundField DataField="productSerialNo" HeaderText="Serial No" SortExpression="productSerialNo" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productDescription" HeaderText="Description" SortExpression="productDescription" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productClass" HeaderText="Class" SortExpression="productClass" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productSubClass" HeaderText="Type" SortExpression="productSubClass" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" SortExpression="productUnitPrice" DataFormatString="{0:#,##0.00}">
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" DataFormatString="{0:0,0}" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}" >
                        <ItemStyle CssClass="text-center" />
                        </asp:BoundField>
                    </Columns>
                <EmptyDataTemplate>
                    <span class="label label-important"></span>No Records Found!
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
          
            <br />
                <b class="pull-right"><asp:Label ID="lblOrderTQuantity" runat="server"/></b><br />
                <b class="pull-right"><asp:Label ID="lblTOrderPrice" runat="server"/></b>
            <br /><br />
            <a href="MyOrders.aspx" class="btn btn-primary btn-large pull-right width175px">Back</a>
            <br />
</asp:Content>

