<%@ Page Title="" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="WarehouseManagerDashboard.aspx.cs" Inherits="WarehouseManager_WarehouseManagerDashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <h3>Inventory</h3>
    <hr />
    <asp:GridView CssClass="table table-hover" ID="grdInventory" runat="server" 
        AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
        onpageindexchanging="grdInventory_PageIndexChanging" 
        onselectedindexchanged="grdInventory_SelectedIndexChanged">
                
                <Columns>
                        <asp:BoundField DataField="inventoryID" HeaderText="Inventory ID" SortExpression="inventoryID" InsertVisible="False" ReadOnly="True">
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                        <asp:BoundField DataField="productClass" HeaderText="Product Class" SortExpression="productClass" />
                        <asp:BoundField DataField="productStatus" HeaderText="Status" SortExpression="productStatus" />
                        <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" SortExpression="productCriticalLevel" DataFormatString="{0:0,0}"/>
                        <asp:BoundField DataField="existingStock" HeaderText="Current Stock" SortExpression="existingStock" DataFormatString="{0:0,0}"/>
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
    <asp:Button ID="btnViewAllInventory" runat="server" Text="View All Inventory" CssClass="btn btn-primary width150px pull-right" OnClick="btnViewAllInventory_Click"/>
    <br /><br />
</asp:Content>

