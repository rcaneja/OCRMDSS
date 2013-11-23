<%@ Page Title="Edit General Manager Profile" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="EditMyProfile.aspx.cs" Inherits="GeneralManager_EditMyProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
        <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
        <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>

        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Employee Information</h4></span>
        
        <br /><br />
        <div class="pull-right">
        <asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgThumbnail" Width="200px"/>
        <br />
        <asp:FileUpload ID="fuemployeeImage" runat="server" />
        </div>
        <br /><br />

        <span style="float: left; width: 150px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>

        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge" 
            placeholder="First Name" Enabled="False"></asp:TextBox>
        <br />

        <span style="float: left; width: 150px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge" 
            placeholder="Last Name" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br /><br />
        <br /><br />
        <br /><br />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                CssClass="btn btn-large btn-primary pull-right" onclick="btnCancel_Click"/>
        <asp:Button ID="btnSave" runat="server" Text="Save" 
                CssClass="btn btn-large btn-primary pull-right marginBoth" onclick="btnSave_Click"/>
        <br />
        <br />
        <br />        
         <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>

</asp:Content>

