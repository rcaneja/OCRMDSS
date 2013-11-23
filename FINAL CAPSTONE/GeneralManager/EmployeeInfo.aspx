<%@ Page Title="Approved Customers" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="EmployeeInfo.aspx.cs" Inherits="GeneralManager_EmployeeInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Employees Information</h4></span>
        <br /><br />
        
        <div class="pull-right">
            <asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgBusiLogo" Width="180px" Height="180px"/>
            </div>
        
        <asp:Label ID="lblUserName" runat="server" Text="Username" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtUserName" runat="server" CssClass="input-xlarge" 
            placeholder="Username" Enabled="False"></asp:TextBox><br />
       
        <asp:Label ID="lblUserType" runat="server" Text="User Type" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtUserType" runat="server" CssClass="input-xlarge" 
            placeholder="User type" Enabled="False"></asp:TextBox><br /><br />

        <asp:Label ID="lblemployeeLN" runat="server" Text="Last Name" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtemployeeLN" runat="server" CssClass="input-xlarge" 
                    placeholder="Last Name" Enabled="False"></asp:TextBox><br />

        <asp:Label ID="lblemployeeFN" runat="server" Text="First Name" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtemployeeFN" runat="server" CssClass="input-xlarge" 
                    placeholder="First Name" Enabled="False"></asp:TextBox><br />
        <br /><br />

                <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancel" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
            <br /><br /> 
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>

</asp:Content>

