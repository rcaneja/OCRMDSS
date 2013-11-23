<%@ Page Title="" Language="C#" MasterPageFile="~/Secretary/Masterpage.master" AutoEventWireup="true" CodeFile="UpdatePaymentStatus.aspx.cs" Inherits="Secretary1_UpdatePaymentStatus" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
     <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <h2>Sales Order Summary</h2>
        <hr />
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
        <hr />
        <center>
        <h3>Order Details</h3></center>
        <hr />
            <asp:GridView ID="grdOrderDetails" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrderDetails" 
                AllowPaging="True" CssClass="table table-hover width100" DataKeyNames="detailID,productID1,productClassID1,productSubClassID1">
                <Columns>  
                    <asp:BoundField DataField="productID" HeaderText="Product ID" 
                        SortExpression="productID" ></asp:BoundField>
                    <asp:BoundField DataField="productName" HeaderText="Product Name" 
                        SortExpression="productName" ></asp:BoundField>
                    <asp:BoundField DataField="productClassName" HeaderText="Product Class Name" 
                        SortExpression="productClassName" />
                    <asp:BoundField DataField="productSubClass" HeaderText="Product Sub Class" 
                        SortExpression="productSubClass" />
                    <asp:BoundField DataField="productUnitPrice" HeaderText="Product Unit Price" 
                        SortExpression="productUnitPrice" ></asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" 
                        SortExpression="quantity" ></asp:BoundField>
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" ></asp:BoundField> 
                </Columns>
                <EmptyDataTemplate>
                    <span class="label label-important"></span>No Records Found!
                </EmptyDataTemplate>
                <PagerStyle HorizontalAlign="Center" />
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
            <hr />
            <h4>Payment Information</h4>
            <hr />
            <asp:Label ID="lblReceiptNo" runat="server" Text="Payment Receipt Number:" CssClass="labellarge"></asp:Label><br />
            <asp:Textbox ID="txtReceiptNo" runat="server" CssClass="input-xlarge" placeholder="Delivery Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReceiptNo" runat="server" ClientMode="Static" ControlToValidate="txtReceiptNo" CssClass="label-important marginB10px" ErrorMessage="Input the payment receipt no or check " ForeColor="White"></asp:RequiredFieldValidator>
        

            <br /><br />
                <asp:Button ID="btnPaid" runat="server" onclick="btnPaid_Click" Text="Paid" CssClass="btn btn-primary width150px marginBoth btn-large" />
                <asp:Button ID="btnUnpaid" runat="server" onclick="btnUnpaid_Click" Text="Unpaid" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
                <a href="http://localhost:12345/FINAL CAPSTONE/Secretary/ViewPaymentStatus.aspx" class="btn width150px btn-large btn-primary">Cancel</a>
            <br /><br /> <br /><br />
            <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
</asp:Content>

