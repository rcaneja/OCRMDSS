<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Customers_Feedback" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
   <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info boldFont alert-block lineheight40 text-center" Visible="false"></asp:Label>
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Feedback</h4></span>
 
        <br /><br />
        <span style="float: left; width: 250px;"><asp:Label ID="lblFN" runat="server" Text="First Name:" ></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" placeholder="First Name" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 250px;"><asp:Label ID="lblLN" runat="server" Text="Last Name:" ></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" placeholder="Last Name" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br /><br />
        <span style="float: left; width: 250px;"><asp:Label ID="lblFeedbackCommSugg" runat="server" Text="Comments and Suggestions:" ></asp:Label></span>
        <asp:TextBox ID="txtFeedbackCommSugg" runat="server" placeholder="Comments and Suggestions" TextMode="MultiLine" CssClass="input-xlarge" Height="100px" Width="270px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-large btn-primary marginleft50px marginBoth" onclick="btnSend_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-large btn-primary marginBoth" onclick="btnCancel_Click" />
        <br />
        <br />
        <br /> 
        <br />
        <br />
</asp:Content>

