<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="GeneralManager_OrderDetails" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
     <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Sales Order Summary</h4></span>
    <br /><br />
        <dl class="dl-horizontal">
            <dt>Order Number:</dt>
            <dd><asp:Label ID="lblOrderNo" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Order Date:</dt>
            <dd><asp:Label ID="lblOrderDate" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Amount:</dt>
            <dd><asp:Label ID="lblAmount" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Delivery Date:</dt>
            <dd><asp:Label ID="lblDeliveryDate" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Shipping Mode: </dt>
            <dd><asp:Label ID="lblDeliveryMode" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Special Instructions:</dt>
            <dd><asp:Label ID="lblComments" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Order Status:</dt>
            <dd><asp:Label ID="lblOrderStatus" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Ready for Delivery:</dt>
            <dd><asp:Label ID="lblReadyForDelivery" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Delivery Status:</dt>
            <dd><asp:Label ID="lblDeiveryStatus" runat="server" CssClass="label label-inverse"></asp:Label></dd>
        </dl>
    <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h4>Order Details</h4></span>
    <br />
            <asp:GridView ID="grdOrderDetails" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrderDetails" 
                AllowPaging="True" CssClass="table table-hover width100" DataKeyNames="detailID,productID1,productClassID1,productSubClassID1">
                <Columns>  
                    <asp:BoundField DataField="productID" HeaderText="Product ID" 
                        SortExpression="productID" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" ></asp:BoundField>
                    <asp:BoundField DataField="productClassName" HeaderText="Class" SortExpression="productClassName" />
                    <asp:BoundField DataField="productSubClass" HeaderText="Type" SortExpression="productSubClass" />
                    <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" SortExpression="productUnitPrice" ></asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" ></asp:BoundField>
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" ></asp:BoundField> 
                </Columns>
                <EmptyDataTemplate>
                    <span class="label label-important"></span>No Records Found!
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#33CC33" ForeColor="Black" />
            </asp:GridView>

            <asp:SqlDataSource ID="dsOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM OrderDetails AS A INNER JOIN Products AS B ON A.productID = B.productID 
                INNER JOIN ProductClass AS C ON B.productClassID = C.productClassID 
                INNER JOIN ProductSubClass AS D ON B.productSubClassID = D.productSubClassID 
                WHERE ([orderID] = @orderID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="orderID" QueryStringField="orderID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
                <b class="pull-right"><asp:Label ID="lblOrderTQuantity" runat="server"/></b><br />
                <b class="pull-right"><asp:Label ID="lblTOrderPrice" runat="server"/></b>
            <br /><br />
            <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/SearchOrders.aspx" class="btn btn-primary btn-large width175px">Back</a>
            <br />
</asp:Content>

