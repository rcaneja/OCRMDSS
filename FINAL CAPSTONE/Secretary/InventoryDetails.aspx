<%@ Page Title="Inventory Details" Language="C#" MasterPageFile="~/Secretary/Masterpage.master" AutoEventWireup="true" CodeFile="InventoryDetails.aspx.cs" Inherits="Secretary_InventoryDetails" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
     <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <h2>Product Inventory Details</h2>
        <hr />
    <dl class="dl-horizontal">
        <dt>Product Image:<dt>
        <dd><asp:Image ID="prodImage" runat="server" CssClass="img-rounded" style="height:215px; width:200px;" /></dd>
        <dt>Product Name:<dt>
        <dd><asp:Label ID="lblProdName" runat="server" CssClass="label label-success font18"></asp:Label></dd>
        <dt>Product ID:<dt>
        <dd><asp:Label ID="lblProdID" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Serial Number:<dt>
        <dd><asp:Label ID="lblProdSerialNo" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Class:<dt>
        <dd><asp:Label ID="lblProdClassName" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Type:<dt>
        <dd><asp:Label ID="lblProdSubClass" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Description:<dt>
        <dd><asp:Label ID="lblProdDescription" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Unit Price:<dt>
        <dd><asp:Label ID="lblProdUnitPrice" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Product Status:<dt>
        <dd><asp:Label ID="lblProdStatus" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Critical Level:<dt>
        <dd><asp:Label ID="lblCriticalLevel" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Warehouse Stock:<dt>
        <dd><asp:Label ID="lblWarehouseStock" runat="server" CssClass="label label-success font14"></asp:Label></dd>
        <dt>Existing Stock:<dt>
        <dd><asp:Label ID="lblExistingStock" runat="server" CssClass="label label-success font14"></asp:Label></dd>
    </dl>
            <a href="http://localhost:12345/FINAL%20CAPSTONE/Secretary/InventoryStatus.aspx" class="btn btn-primary btn-large pull-left width175px">Back</a>
            <br /><br /><br />
</asp:Content>

