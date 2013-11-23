<%@ Page Title="Search Product" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="SearchProducts.aspx.cs" Inherits="Customers_SearchProducts" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h4>Search Products</h4></span><br /><br />
    <asp:DropDownList ID="ddlColumns" runat="server">
            <asp:ListItem Value="A.productID">ID</asp:ListItem>
            <asp:ListItem Value="A.productName">Name</asp:ListItem>
            <asp:ListItem Value="A.productUnitPrice">Unit Price</asp:ListItem>            
    </asp:DropDownList>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Products"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" 
        CssClass="btn btn-primary width175px marginB10px" OnClick="btnSearch_Click" 
        Text="Search" />
    <asp:Button ID="btnViewAll0" runat="server" 
        CssClass="btn btn-primary width175px marginB10px" onclick="ViewAll" 
        Text="View All" />
    <br />
        <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-error alert-block lineheight40 text-center width100" Visible="false"></asp:Label>

        <div class="width100">
        <ul class="thumbnails width100 column3">
            <asp:ListView ID="lvProducts" runat="server" 
                onselectedindexchanged="lvProducts_SelectedIndexChanged" >
             <ItemTemplate>
              <li class="span4 table-hover" style="margin: 5px 5px 5px 5px;">
                <div class="thumbnail">
                 <a href="ProductInfo.aspx?productID=<%# Eval("productID") %>"></a>
                  <img src="<%# Eval("productImage") %>" style="height:250px; width:368px;" alt="" class="img-rounded img100" />
                  <div class="caption">
                    <p class="text-center font20 boldFont"><%# Eval("productName") %></p>
                    <p class="text-center"><asp:Label ID="lblProdClassName" runat="server" CssClass="label label-success" Text="Product Class: "><%# Eval("productClassName") %></asp:Label></p>                      
                    <p class="text-center"><asp:Label ID="lblProdSubClassName" runat="server" CssClass="label label-success" Text="Product Sub Class: "><%# Eval("productSubClass") %></asp:Label></p>
                    <p class="text-center"><asp:Label ID="lblSerialNo" runat="server" CssClass="label label-success" Text="Product Serial No.: "><%# Eval("productSerialNo") %></asp:Label></p>
                    <p class="text-center"><asp:Label ID="lblProdSerial" runat="server" CssClass="label label-success" Text="Product Description: "><%# Eval("productDescription") %></asp:Label></p> 
                    <p class="text-center"><asp:Label ID="lblProdUnitPrice" runat="server" CssClass="label label-success" Text="Product Unit Price: "><%# Eval("productUnitPrice") %></asp:Label></p> 
                    <p><a href="http://localhost:12345/FINAL%20CAPSTONE/ProductInfo.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right">Add to Cart</a></p>
                      <br />
                  </div>
                </div>
              </li>
             </ItemTemplate>                
            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No Products Found!</span>
            </EmptyDataTemplate> 
            </asp:ListView>
            </ul>
          </div>   
        <br />
        <br />
            <br />
</asp:Content>

