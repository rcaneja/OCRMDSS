<%@ Page Title="Check-Out" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Customers_Checkout" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
        <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
        <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
             <span class="label label-success" style="width: 100%; background-color:#26972D"><h4><i class="icon-user"></i> Contact Information</h4></span>
             <br /><br />
             <ul class="unstyled">
                <li class="text-left"><span style="width:175px; float: left;">First Name:</span><asp:Label ID="lblFN" runat="server" CssClass="label label-info"></asp:Label></li>
                <li class="text-left"><span style="width:175px; float: left;">Last Name:</span><asp:Label ID="lblLN" runat="server" CssClass="label label-info"></asp:Label></li>
                <li class="text-left"><span style="width:175px; float: left;">Email Address:</span><asp:Label ID="lblEmail" runat="server" CssClass="label label-info"></asp:Label></li>        
             </ul><br />    
             <span class="label label-success" style="width: 100%; background-color:#26972D"><h4><i class="icon-home"></i> Billing Information</h4></span>
             <br /><br />
             <ul class="unstyled">
                <li class="text-left"><span style="width:175px; float: left;">Business Name:</span><asp:Label ID="lblBusinessName" runat="server" CssClass="label label-info"></asp:Label></li>
                <li class="text-left"><span style="width:175px; float: left;">Address:</span><asp:Label ID="lblBusinessAddress" runat="server" CssClass="label label-info"></asp:Label></li>
                <li class="text-left"><span style="width:175px; float: left;">Contact No.:</span><asp:Label ID="lblBusinessContactNo" runat="server" CssClass="label label-info"></asp:Label></li>
                <li class="text-left"><span style="width:175px; float: left;">Fax No.:</span><asp:Label ID="lblFaxNo" runat="server" CssClass="label label-info"></asp:Label></li>
             </ul><br />    
             <span class="label label-success" style="width: 100%; background-color:#26972D"><h4><i class="icon-road"></i> Delivery Method</h4></span>
             <br /><br />
             <ul class="unstyled">
                <li><span style="width:175px; float: left;">Delivery Option:</span><asp:DropDownList ID="dropDeliveryMethod" runat="server">
                    <asp:ListItem>Delivery</asp:ListItem>
                    <asp:ListItem>Pick Up</asp:ListItem>
                    </asp:DropDownList></li>
                <li><span style="width:175px; float: left;">Preffered Delivery Date:</span><asp:TextBox ID="txtDeliveryDate" runat="server" placeholder="Choosen Delivery Date"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDeliveryDate_CalendarExtender" runat="server" 
                        ClearTime="True" ClientIDMode="Static" Enabled="True" FirstDayOfWeek="Sunday" 
                        TargetControlID="txtDeliveryDate" PopupPosition="TopRight" Format="dddd, MMMM dd, yyyy">
                    </asp:CalendarExtender></li>
            </ul><br />    
             <span class="label label-success" style="width: 100%; background-color:#26972D"><h4><i class="icon-shopping-cart"></i> Order Summary</h4></span>
             <br /><br />
             <ul class="unstyled">
                <li><asp:GridView ID="grdShoppingCart" runat="server" AutoGenerateColumns="False" DataSourceID="dsShoppingCart" CssClass="table table-hover width100" emptydatatext="No Records Found" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                    <asp:BoundField DataField="productID" HeaderText="ID" SortExpression="productID" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" />
                        <ItemStyle CssClass="hide" /></asp:BoundField>
                    <asp:ImageField DataImageUrlField="productImage" HeaderText="Image">
                        <ItemStyle Height="100px" Width="100px" />
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
                    <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" SortExpression="productUnitPrice" >
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" DataFormatString="{0:0,0}">
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}" >
                    <ItemStyle CssClass="text-center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="boldFont text-center label label-warning">No Records Found!</span>
                </EmptyDataTemplate> 
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

            <asp:SqlDataSource ID="dsShoppingCart" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="
                SELECT * FROM ShoppingCart AS A INNER JOIN Products AS B ON A.productID = B.productID 
                INNER JOIN ProductClass AS C ON B.productClassID = C.productClassID 
                INNER JOIN ProductSubClass AS D ON B.productSubClassID = D.productSubClassID 
                WHERE (A.userID = @userID) AND (A.cartStatus = @cartStatus)">

                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userID" />
                    <asp:Parameter DefaultValue="Pending" Name="cartStatus" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
                <b class="pull-right"><asp:Label ID="lblTQuantity" runat="server"/></b><br />
                <b class="pull-right"><asp:Label ID="lblTPrice" runat="server"/></b>
            <br />
                    <br />
            <a class="btn btn-primary btn-large pull-right btn-large" href="ShoppingCart.aspx">Edit Order</a><br />
            </li> 
            </ul><br />    
             <span class="label label-success" style="width: 100%; background-color:#26972D"><h4><i class="icon-check"></i> Other Delivery Instructions</h4></span>
             <br /><br />
             <ul class="unstyled">
                <li>Other comments or other delivery instructions</li>
                <li>
                    <asp:TextBox ID="txtDeliveryInstruction" runat="server" TextMode="MultiLine" Width="504px" Height="100px"></asp:TextBox>
                </li>
                <li><asp:Button ID="btnCheckout" runat="server" class="btn btn-primary btn-large pull-right btn-large" Text="Checkout" OnClick="btnCheckout_Click"></asp:Button></li>
            </ul>
            <br /><br /><br /><br /><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>

