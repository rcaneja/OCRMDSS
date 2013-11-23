<%@ Page Title="General Manager Profile" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="GeneralManager_MyProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>

    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>My Profile</h4></span>
    <br /><br />
        <asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgThumbnail pull-right" Height="200px"/>
        <br /><br />      
        <span style="float:left; width: 150px;"><asp:Label ID="lblemployeeID" runat="server" Text="Employee ID" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtemployeeID" runat="server" placeholder="Employee ID" 
            Enabled="False" ></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtemployeeID_FilteredTextBoxExtender" 
            runat="server" Enabled="True" FilterType="Numbers" 
            TargetControlID="txtemployeeID">
        </asp:FilteredTextBoxExtender>        
        <br />
        <span style="float:left; width: 150px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float:left; width: 150px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br /><br /><br /><br /><br /> 
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-large btn-primary pull-right" onclick="btnEdit_Click"/>
        <br /><br /><br />
        
        <div id="ChangePW"><span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Change Password</h4></span></div>
        <br /><br /> 
        <span style="float:left; width: 150px;"><asp:Label ID="lblCurrentPW" runat="server" Text="Current Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtCurrentPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <span style="float:left; width: 150px;"><asp:Label ID="lblNewPW" runat="server" Text="New Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtNewPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <span style="float:left; width: 150px;"><asp:Label ID="lblConfirmPW" runat="server" Text="Confirm New Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtConfirmPW" runat="server" TextMode="Password" 
                CssClass="input-xlarge"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnChangePW" runat="server" 
                CssClass="btn btn-primary btn-large pull-right" Text="Change Password" 
                onclick="btnChangePW_Click" />
        <br />
        <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            
</asp:Content>

