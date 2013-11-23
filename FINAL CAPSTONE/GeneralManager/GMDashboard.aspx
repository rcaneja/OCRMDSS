<%@ Page Title="General Manager Dashboards" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="GMDashboard.aspx.cs" Inherits="GeneralManager_GMDashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Customers</h4></span>
    <asp:GridView ID="grdCustomers" runat="server" AutoGenerateColumns="False"
                DataKeyNames="userID" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                
                <Columns>
                    <asp:BoundField DataField="customerID" HeaderText="Customer ID" SortExpression="customerID" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" ></asp:BoundField>
                    <asp:BoundField DataField="businessAddress" HeaderText="Address" SortExpression="businessAddress" />
                    <asp:BoundField DataField="businessTelNo" HeaderText="Telephone Number" SortExpression="businessContactNo" />
                    <asp:BoundField DataField="validation" HeaderText="Validation" SortExpression="validation" />
                    <asp:BoundField DataField="approval" HeaderText="Approval" SortExpression="approval" />
                </Columns>

                <EmptyDataTemplate>
                    <span class="boldFont text-center label label-warning">No new customer for approval!</span>
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
    <br /><br />
    <asp:Button ID="btnViewAllCustomers" runat="server" Text="View All Customers" CssClass="btn btn-primary width150px pull-right" OnClick="btnViewAllCustomers_Click"/>
    <br /><br />

    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Orders</h4></span>
    <asp:GridView CssClass="table table-hover width100" ID="grdOrders" 
                    runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="Black" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                    
                    <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="Order ID" >
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="customerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="orderDate" HeaderText="Order Date" />
                        <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" />
                        <asp:BoundField DataField="deliveryMode" HeaderText="Delivery Mode" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" />
                        <asp:BoundField DataField="orderStatus" HeaderText="Order Status" />
                    </Columns>
                    
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                    <span class="boldFont text-center label label-warning">No new order for approval!</span>
                    </EmptyDataTemplate>
                </asp:GridView>
    <br /><br />    
    <asp:Button ID="btnViewAllOrders" runat="server" Text="View All Orders" CssClass="btn btn-primary width150px pull-right" OnClick="btnViewAllOrders_Click"/>
    <br /><br />
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Products</h4></span>
    <asp:GridView CssClass="table table-hover" ID="grdProducts" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                
                <Columns>
                        <asp:BoundField DataField="productID" HeaderText="Product ID">
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productName" HeaderText="Product Name" />
                        <asp:BoundField DataField="productClassID" HeaderText="Product Class ID" />
                        <asp:BoundField DataField="productSubClassID" HeaderText="Product Subclass ID" />  
                        <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" />
                        <asp:BoundField DataField="productDescription" HeaderText="Description" />   
                        <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" />    
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
    <br /><br />    
    <asp:Button ID="btnViewAllProducts" runat="server" Text="View All Products" CssClass="btn btn-primary width150px pull-right" OnClick="btnViewAllProducts_Click"/>
    <br /><br />
</asp:Content>

