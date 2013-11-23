<%@ Page Title="Approved Orders" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="ApproveOrders.aspx.cs" Inherits="GeneralManager_ApproveOrders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p> 

     <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Sales Order Summary</h4></span>
     <br />
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
            <dd><asp:Label ID="lblDeliveryStatus" runat="server" CssClass="label label-inverse"></asp:Label></dd>
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
            <br /><br />
                <asp:Button ID="btnApproved" runat="server" onclick="btnApproved_Click" Text="Approved" CssClass="btn btn-primary width150px marginBoth btn-large" />
                <asp:Button ID="btnDisapproved" runat="server" onclick="btnDisapproved_Click" Text="Disapproved" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
                <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancel" CssClass="btn width150px btn-large btn-primary"/>
            <br /><br /> <br /><br />
            <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
</asp:Content>

