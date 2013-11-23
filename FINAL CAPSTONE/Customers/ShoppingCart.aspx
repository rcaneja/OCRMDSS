<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Customers_ShoppingCart" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

   <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4 style="display: inline-block">Shopping Cart</h4><span class="badge badge-danger marginleft10"><asp:Label ID="lblItemCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
        <hr />
            <asp:GridView ID="grdShoppingCart" runat="server" AutoGenerateColumns="False" DataSourceID="dsShoppingCart" 
                OnSelectedIndexChanged="grdShoppingCart_SelectedIndexChanged" 
                AllowPaging="True" CssClass="table table-hover width100" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="productID" HeaderText="ID" SortExpression="productID">
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide"/>
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="productImage" HeaderText="Image"><ControlStyle CssClass="img100" /></asp:ImageField>
                        <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" ><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="productDescription" HeaderText="Description" SortExpression="productDescription" ><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="productClass" HeaderText="Class" SortExpression="productClass" ><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="productSubClass" HeaderText="Type" SortExpression="productSubClass" ><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" SortExpression="productUnitPrice" ><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" DataFormatString="{0:0,0}"><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}"><ItemStyle CssClass="text-center" /></asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="http://localhost:12345/FINAL%20CAPSTONE/Customers/EditQuantity.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right">Edit</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField>
                            <ItemTemplate>
                                <a href="http://localhost:12345/FINAL%20CAPSTONE/Customers/DeleteToCart.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right">Delete</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <EmptyDataTemplate>
                <span class="boldFont text-center label label-warning">No Records Found!</span>
                </EmptyDataTemplate>   
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black" />
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
            <br /><br />
             
            <br /><br /><br />
            
            <asp:Button ID="btnCheckout" runat="server" CssClass="btn btn-primary pull-right" Width="150px" Text="Checkout" Visible="true" onclick="btnCheckout_Click"/>
            &nbsp;&nbsp;
            <button ID="btnModalRemoveAll" runat="server" type="button" class="btn btn-primary pull-right marginBoth width150px"  data-toggle="modal" data-target="#RemoveAll">Remove All</button><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />  
            <br /><br />
            <!-- Modal -->
            <div id="RemoveAll" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="RemoveAllLabel" aria-hidden="true">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="RemoveAllLabel">Remove All</h3>
            </div>
            <div class="modal-body">
            <p>Are you sure you want to remove all the items in your shopping cart?</p>
            </div>
            <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>
           <asp:Button ID="btnRemoveAll" runat="server" CssClass="btn btn-primary marginBoth pull-right" Width="100px" Text="Remove All" Visible="true" onclick="btnRemoveAll_Click"/>        
             </div>
            </div>
</asp:Content>

