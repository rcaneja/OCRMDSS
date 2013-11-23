<%@ Page Title="Edit My Profile" Language="C#" MasterPageFile="~/Customers/CustomersSite.master" AutoEventWireup="true" CodeFile="EditMyProfile.aspx.cs" Inherits="Customers_EditMyProfile" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
        <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
        <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p> 
      
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Business Information</h4></span>
        <br /><br />
            <div class="pull-right">
            <asp:FileUpload ID="fubusinessLogo" runat="server" /><br />
            <asp:Image ID="imgBusiness" runat="server" CssClass="img-rounded imgBusiLogo"/>
            </div>
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiName" runat="server" Text="Business Name:" CssClass="labellarge" ></asp:Label></span>
        <asp:TextBox ID="txtbusinessName" runat="server" TextMode="MultiLine" 
                CssClass="input-xlarge" placeholder="Business Name"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessName_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessName" 
                ClientIDMode="Static" FilterMode="InvalidChars" InvalidChars="{}[]\|`">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiName" runat="server" ClientIDMode="Static" 
                ControlToValidate="txtbusinessName" ErrorMessage="Input Business Name" 
                CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiAdd" runat="server" Text="Business Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessAddress" runat="server" TextMode="MultiLine" 
                CssClass="input-xlarge" placeholder="Business Address"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessAddress_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessAddress" 
                ClientIDMode="Static" FilterMode="InvalidChars" InvalidChars="~[]{}\|?">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiAdd" runat="server" ClientIDMode="Static" 
                ControlToValidate="txtbusinessAddress" ErrorMessage="Input Business Address" 
                CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiTelNo" runat="server" Text="Business Telephone No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessTelNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Telephone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessTelNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessTelNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiTelNo" runat="server" 
                ClientIDMode="Static" ControlToValidate="txtbusinessTelNo" 
                ErrorMessage="Input Business Telephone No." CssClass="label-important" 
                ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiLocalNo" runat="server" Text="Business Local No. <br>(i.e. 123)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessLocalNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Local Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessLocalNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessLocalNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiLocalNo" runat="server" 
                ClientIDMode="Static" ControlToValidate="txtbusinessLocalNo" 
                ErrorMessage="Input Business Local No." CssClass="label-important" 
                ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiCPNo" runat="server" Text="Business Cellphone No. <br>(i.e. 0916-1234-567)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessCPNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Cellphone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessCPNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessCPNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiCPNo" runat="server" 
                ClientIDMode="Static" ControlToValidate="txtbusinessCPNo" 
                ErrorMessage="Input Business Telephone No." CssClass="label-important" 
                ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusinessFaxNo" runat="server" Text="Business Fax No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessFaxNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Fax Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessFaxNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessFaxNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusiFaxNo" runat="server" ClientIDMode="Static" ControlToValidate="txtBusinessFaxNo" ErrorMessage="Input Business Fax No." CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <br />
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Contact Person Information</h4></span>
        <br /><br />    
            <div class="pull-right">
            <asp:FileUpload ID="fuuserImage" runat="server" /><br />
            <asp:Image ID="imgUser" runat="server" CssClass="img-rounded imgBusiLogo" /></div>
        <span style="float: left; width: 200px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" CssClass="input-xlarge" placeholder="First Name"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtFN_FilteredTextBoxExtender" runat="server" 
                Enabled="True" TargetControlID="txtFN" ClientIDMode="Static" 
                FilterMode="InvalidChars" 
                InvalidChars="1234567890~`!@#$%^^^&amp;*(()_=+[]{};'\:&quot;|,/&lt;&gt;?">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvFN" runat="server" ClientIDMode="Static" ControlToValidate="txtFN" ErrorMessage="Input First Name" CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" CssClass="input-xlarge" placeholder="Last Name"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtLN_FilteredTextBoxExtender" runat="server" 
                Enabled="True" TargetControlID="txtLN" ClientIDMode="Static" FilterMode="InvalidChars"
                InvalidChars="`~!@#$%^&amp;*()_=+{}[];'\:&quot;|,./&lt;&gt;?1234567890">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvLN" runat="server" ClientIDMode="Static" ControlToValidate="txtLN" ErrorMessage="Input Last Name" CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblEmailAdd" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="input-xlarge" placeholder="Email Address"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtEmailAddress_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtEmailAddress" 
                ClientIDMode="Static" FilterMode="InvalidChars" 
                InvalidChars="`~!#$%^&amp;*()=+[]{};:'&quot;\|&lt;,&gt;/?">
            </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ClientIDMode="Static" ControlToValidate="txtEmailAddress" ErrorMessage="Input Email Address" CssClass="label-important" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <hr />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                CssClass="btn btn-large btn-primary pull-right" onclick="btnCancel_Click"/>
        <asp:Button ID="btnSave0" runat="server" Text="Save" 
                CssClass="btn btn-large btn-primary pull-right marginBoth" onclick="btnSave_Click"/>
        <br />
        <br />
        <br />   
        
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>      
</asp:Content>

