<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Customers_MyProfile" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
        <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
        <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>

        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Business Information</h4></span>
        <br /><br />
        <asp:Image ID="imgBusiness" runat="server" 
                CssClass="img-rounded imgBusiLogo pull-right"/>
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiName" runat="server" Text="Business Name" CssClass="labellarge" ></asp:Label></span>
        <asp:TextBox ID="txtbusinessName" runat="server" TextMode="MultiLine" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiAdd" runat="server" Text="Business Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessAddress" runat="server" TextMode="MultiLine" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiTelNo" runat="server" Text="Business Tel. No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessTelNo" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiLocalNo" runat="server" Text="Business Local No. <br>(i.e. 123)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessLocalNo" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiCPNo" runat="server" Text="Business Cell. No. <br>(i.e. 0916-1234-567)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessCPNo" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblbusinessFaxNo" runat="server" Text="Business Fax No.<br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessFaxNo" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <br />
        <br />
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Contact Person Information</h4></span>
        <br /><br />
        <asp:Image ID="imgUser" runat="server" 
                CssClass="img-rounded imgBusiLogo pull-right"/>
        <span style="float: left; width: 150px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblEmailAdd" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="input-xlarge uneditable-input" Enabled="false"></asp:TextBox>
        <br /><br /> <br /> 
        <asp:Button ID="btnEdit" runat="server" Text="Edit" 
                CssClass="btn btn-large btn-primary pull-right" onclick="btnEdit_Click"/>
        <br />
        <br /><br />
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4 id="ChangePW">Change Password</h4></span>
            <br /><br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblCurrentPW" runat="server" Text="Current Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtCurrentPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblNewPW" runat="server" Text="New Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtNewPW" runat="server" TextMode="Password" CssClass="input-xlarge"></asp:TextBox>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblConfirmPW" runat="server" Text="Confirm New Password" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtConfirmPW" runat="server" TextMode="Password" 
                CssClass="input-xlarge"></asp:TextBox>
        <br />
        <br /><br />
        <asp:Button ID="btnChangePW" runat="server" 
                CssClass="btn btn-primary btn-large pull-right" Text="Change Password" 
                onclick="btnChangePW_Click" />
        <br />
        <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />  
</asp:Content>

