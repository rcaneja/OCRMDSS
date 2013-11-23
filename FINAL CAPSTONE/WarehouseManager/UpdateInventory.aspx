<%@ Page Title="" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateInventory.aspx.cs" Inherits="WarehouseManager_InventoryStatus" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <h2>Inventory Status</h2>
        <asp:Label ID="lblSearch" runat="server" Text="Looking for  " ></asp:Label>
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown"> 
            <asp:ListItem Value="A.productSerialNo">Serial Number</asp:ListItem>   
            <asp:ListItem Value="A.existingStock">Existing Stock</asp:ListItem>
            <asp:ListItem Value="A.productStatus">Product Status</asp:ListItem>     
            <asp:ListItem Value="B.productID">Product ID</asp:ListItem>      
            <asp:ListItem Value="B.productName">Product Name</asp:ListItem>         
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px marginB10px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary marginB10px width150px"/><br />
        <br />,br>
        <asp:GridView ID="grdInventory" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" onpageindexchanging="grdInventory_PageIndexChanging" 
        CssClass="table table-hover width100" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
            onselectedindexchanged="grdInventory_SelectedIndexChanged" 
            OnPageIndexChanged="grdInventory_PageIndexChanged" 
            OnSelectedIndexChanging="grdInventory_SelectedIndexChanging">
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="Product ID" 
                        SortExpression="productID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="productSerialNo" HeaderText="Product Serial No." 
                        SortExpression="productSerialNo" />
                        <asp:BoundField DataField="productName" HeaderText="Product Name" 
                        SortExpression="productName" />
                        <asp:BoundField DataField="productUnitPrice" 
                        HeaderText="Product Unit Price" SortExpression="productUnitPrice" />
                        <asp:BoundField DataField="productClassName" 
                        HeaderText="Product Class Name" SortExpression="productClassName" />
                        <asp:BoundField DataField="productSubClass" HeaderText="Product Sub Class" 
                        SortExpression="productSubClass" />
                        <asp:BoundField DataField="inventoryID" HeaderText="Inventory ID" 
                        InsertVisible="False" ReadOnly="True" SortExpression="inventoryID" /> 
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                    <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                </Columns>

            <EmptyDataTemplate> No records found. </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" CssClass="pagination" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    <br /><br />
        <asp:Button ID="btnUpdateInventoryLevel" runat="server" Text="Add Inventory" CssClass="btn btn-primary btn-large pull-right marginBoth width250" OnClick="btnUpdateInventoryLevel_Click" />
        <br /><br /><br /><br />
        
</asp:Content>

