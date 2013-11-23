<%@ Page Title="" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="InventoryStatus.aspx.cs" Inherits="WarehouseManager_InventoryStatus" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <h2>Inventory Status</h2>
        <asp:Label ID="lblSearch" runat="server" Text="Looking for" ></asp:Label>
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown"> 
            <asp:ListItem Value="D.inventoryID">Inventory ID</asp:ListItem>
            <asp:ListItem Value="D.productSerialNo">Serial Number</asp:ListItem>   
            <asp:ListItem Value="D.existingStock">Existing Stock</asp:ListItem>
            <asp:ListItem Value="D.producedStock">Produced Stock</asp:ListItem>
            <asp:ListItem Value="D.warehouseStock">Warehouse STock</asp:ListItem>    
            <asp:ListItem Value="D.batchNo">Batch Number</asp:ListItem> 
            <asp:ListItem Value="D.productStatus">Product Status</asp:ListItem>     
            <asp:ListItem Value="A.productID">Product ID</asp:ListItem>      
            <asp:ListItem Value="A.productName">Product Name</asp:ListItem>         
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px"/>
        <br />
        <br />
        <asp:GridView ID="grdInventory" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" onpageindexchanging="grdInventory_PageIndexChanging" 
        CssClass="table table-hover width100" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
            onselectedindexchanged="grdInventory_SelectedIndexChanged" 
            OnPageIndexChanged="grdInventory_PageIndexChanged" 
            OnSelectedIndexChanging="grdInventory_SelectedIndexChanging">
                <Columns>
                        <asp:BoundField DataField="inventoryID" HeaderText="Inventory ID" SortExpression="inventoryID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                        <asp:BoundField DataField="productSerialNo" HeaderText="Serial No" SortExpression="productSerialNo" />
                        <asp:BoundField DataField="productStatus" HeaderText="Status" SortExpression="productStatus" />
                        <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" SortExpression="productCriticalLevel" />
                        <asp:BoundField DataField="existingStock" HeaderText="Current Stock" SortExpression="existingStock" />
                        <asp:TemplateField>
                        <ItemTemplate>
                            <a href="http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/InventoryDetails.aspx?inventoryID=<%# Eval("inventoryID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>

            <EmptyDataTemplate> No records found. </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br /><br />
        <asp:Button ID="btnViewDetails" runat="server" Text="View Details" CssClass="btn btn-primary btn-large pull-right" OnClick="btnViewDetails_Click" />
        <br /><br /><br /><br />

</asp:Content>

