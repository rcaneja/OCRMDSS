<%@ Page Title="Search Products" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="SearchProducts.aspx.cs" Inherits="GeneralManager_SearchProducts" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Search Products</h4></span>
    <br />
    <br />
        <div class="form-actions" 
            style="border-radius: 5px; margin-top: 0px; height: 470px; width: 653px;">      
        
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown" 
                onselectedindexchanged="ddlColumns_SelectedIndexChanged">
            <asp:ListItem Value="productID">ID</asp:ListItem>
            <asp:ListItem Value="productSerialNo">Serial Number</asp:ListItem>
            <asp:ListItem Value="productName">Product Name</asp:ListItem>
            <asp:ListItem Value="productClassID">Class ID</asp:ListItem>
            <asp:ListItem Value="productSubClassID">Subclass ID</asp:ListItem>
            <asp:ListItem Value="productUnitPrice">Unit Price</asp:ListItem>
            <asp:ListItem Value="productDescription">Description</asp:ListItem>
            <asp:ListItem Value="productCriticalLevel">Critical Level</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="search..."></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtKeyword" Display="Dynamic" CssClass="label label-important"
            ErrorMessage="Insert keyword here." Font-Size="Small" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginBoth"
            onclick="btnSearch_Click" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px"
            onclick="btnViewAll_Click" Text="View All" />
        
        <br />
        <br />

    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True"  CssClass="table table-hover width100"
            onpageindexchanging="gvProducts_PageIndexChanging" 
            onselectedindexchanged="gvProducts_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="productID" HeaderText="ID" />
                <asp:BoundField DataField="productSerialNo" HeaderText="Serial Number" />
                <asp:BoundField DataField="productName" HeaderText="Product Name" />
                <asp:BoundField DataField="productClassID" HeaderText="Class ID" />
                <asp:BoundField DataField="productSubClassID" HeaderText="Subclass ID" />
                <asp:BoundField DataField="productUnitPrice" HeaderText="Unit Price" />
                <asp:BoundField DataField="productDescription" HeaderText="Description" />
                <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" />
            </Columns>
            <EmptyDataTemplate>
                No records found.
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
            
    </div>
</asp:Content>

