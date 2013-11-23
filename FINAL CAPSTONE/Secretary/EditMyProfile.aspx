<%@ Page Title="Edit My Profile" Language="C#" MasterPageFile="~/Secretary/MasterPage.master" AutoEventWireup="true" CodeFile="EditMyProfile.aspx.cs" Inherits="Secretary_EditMyProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
    <h3>Employee Information</h3>
        <hr />        
        <div class="pull-right">
        <asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgThumbnail"/>
        <br /><asp:FileUpload ID="fuemployeeImage" runat="server" />
        </div>
        <br />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge" 
        placeholder="First Name" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge" 
        placeholder="Last Name" Enabled="False"></asp:TextBox>
        <br />
        <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <br /><br /><hr />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                CssClass="btn btn-large btn-primary pull-right" onclick="btnCancel_Click"/>
        <asp:Button ID="btnSave0" runat="server" Text="Save" 
                CssClass="btn btn-large btn-primary pull-right marginBoth" onclick="btnSave_Click"/>
        <br /><br /><br /><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
</asp:Content>

