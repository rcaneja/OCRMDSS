<%@ Page Title="Customers Information" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="GeneralManager_CustomerInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
       <h2>Customer Information</h2>
       <hr />
       <dl class="dl-horizontal">
            <dt>Username:</dt>
            <dd><asp:Label ID="lbluserName" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Business Logo:</dt>
            <dd><asp:Image ID="imgBusinessLogo" runat="server" CssClass="imgBusiLogo" /></dd>
            <dt>Business Name:</dt>
            <dd><asp:Label ID="lblbusinessName" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Business Address:</dt>
            <dd><asp:Label ID="lblbusinessAddress" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Business Tel. No.: </dt>
            <dd><asp:Label ID="lblbusinessTelNo" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Business Local No.:</dt>
            <dd><asp:Label ID="lblbusinessLocalNo" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Business Phone No:</dt>
            <dd><asp:Label ID="lblBusinessCPNo" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>BusinessFax No.:</dt>
            <dd><asp:Label ID="lblbusinessFaxNo" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>Contact Person Image:</dt>
            <dd><asp:Image ID="imgCP" runat="server" CssClass="imgBusiLogo" /></dd>
            <dt>Last Name:</dt>
            <dd><asp:Label ID="lblCustomerLN" runat="server" CssClass="label label-inverse"></asp:Label></dd>
            <dt>First Name:</dt>
            <dd><asp:Label ID="lblCustomerFN" runat="server" CssClass="label label-inverse"></asp:Label></dd>
           <dt>Email Address:</dt>
            <dd><asp:Label ID="lblCustomerEmail" runat="server" CssClass="label label-inverse"></asp:Label></dd>
        </dl>
            <br />
            <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/SearchCustomers.aspx" class="btn btn-primary btn-large pull-left width175px">Back</a>
            <br /><br /><br />
</asp:Content>

