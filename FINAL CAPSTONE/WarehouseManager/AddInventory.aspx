<%@ Page Title="Add Inventory" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="AddInventory.aspx.cs" Inherits="WarehouseManager_AddInventory" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h4>Manage Inventories</h4></span>
    <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown"> 
            <asp:ListItem Value="A.productName">Product Name</asp:ListItem>
            <asp:ListItem Value="A.productDescription">Description</asp:ListItem>   
            <asp:ListItem Value="A.productSerialNo">Serial Number</asp:ListItem>   
            <asp:ListItem Value="A.productUnitPrice">Order Date</asp:ListItem>
            <asp:ListItem Value="B.productClassName">Delivery Date</asp:ListItem>
            <asp:ListItem Value="C.productSubClass">Delivery Mode</asp:ListItem> 
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px marginB10px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px marginB10px"/>
        <br />
        <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" CssClass="table table-hover width100"
             onpageindexchanging="grdProducts_PageIndexChanging" onselectedindexchanged="grdProducts_SelectedIndexChanged" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" GridLines="Horizontal" AllowPaging="True" HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
            
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="Product ID" 
                        SortExpression="productID">
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" /></asp:BoundField>
                    <asp:ImageField DataImageUrlField="productImage" HeaderText="Images" ItemStyle-CssClass="img100"><ItemStyle CssClass="img100"></ItemStyle></asp:ImageField>
                    <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" />
                    <asp:BoundField DataField="productClassName" HeaderText="Class Name" SortExpression="productClassName" />
                    <asp:BoundField DataField="productSubClass" HeaderText="Type" SortExpression="productSubClass" />
                    <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" SortExpression="productCriticalLevel" DataFormatString="{0:0,0}" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <a href="http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/UpdateInventoryLevels.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-primary width150px" />
                    </asp:TemplateField>
                </Columns>

            <EmptyDataTemplate><span class="boldFont text-center label label-warning">No Records Found!</span></EmptyDataTemplate>   
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Font-Bold="False" Font-Overline="True" Font-Strikeout="False" Font-Underline="True" VerticalAlign="Middle" Wrap="True" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            <RowStyle HorizontalAlign="Center" />
            <AlternatingRowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <br />
</asp:Content>

