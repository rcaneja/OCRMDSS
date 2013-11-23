<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Admin_MyProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="jumboTron" Runat="Server">
    <h1>Welcome <span><asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></span></h1>
        <p class="lead">We are glad to see you back.</p>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block boldFont lineheight40 text-center" Visible="false"></asp:Label>
        <h2>My Profile</h2>
        <hr />        
        <asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgThumbnail pull-right"/><br />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <br />
    <br />
    <br />
    <br />
    <br />
        <br /><br /><hr />
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-large btn-primary pull-right" onclick="btnEdit_Click"/>
        <div ID="ChangePW"><h3>Change Credentials</h3></div>
        <hr />
        <asp:Label ID="lblCurrentPW" runat="server" Text="Current Password" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtCurrentPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <asp:Label ID="lblNewPW" runat="server" Text="New Password" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtNewPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <asp:Label ID="lblConfirmPW" runat="server" Text="Confirm New Password" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtConfirmPW" runat="server" TextMode="Password" 
                CssClass="input-xlarge"></asp:TextBox>
        <br /><br /><hr />
        <asp:Button ID="btnChangePW" runat="server" CssClass="btn btn-primary btn-large pull-right" Text="Change Password" onclick="btnChangePW_Click" />
        <br /><br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager><br />         
</asp:Content>

