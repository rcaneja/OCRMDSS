<%@ Page Title="Edit My Profile" Language="C#" MasterPageFile="~/Secretary/MasterPage.master" AutoEventWireup="true" CodeFile="EditCustomers.aspx.cs" Inherits="Secretary_EditCustomers" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
    <h3>Business Information</h3>
        <hr />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiName" runat="server" Text="Business Name:" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessName" runat="server" placeholder="Business Name" TextMode="MultiLine" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtBusinessName_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="`{}[]" TargetControlID="txtBusinessName">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvBusinessName" runat="server" 
            ClientIDMode="Static" ControlToValidate="txtbusinessName" 
            CssClass="label-important" ErrorMessage="Input Business Name" 
            ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiAdd" runat="server" Text="Business Address <br>(i.e. No. Street Barangay, City, Province, Postal Code)" CssClass="labellarge width175px"></asp:Label></span>
        <p style="display: inline-block;">
        <asp:TextBox ID="txtbusinessAddress" runat="server" placeholder="Street" CssClass="width250" TextMode="MultiLine"></asp:TextBox>
        </p>
        <asp:FilteredTextBoxExtender ID="txtbusinessAddress_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtbusinessAddress"></asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvtxtbusinessAddress" ControlToValidate="txtbusinessAddress" ErrorMessage="Input Business Address" runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <br />                       
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiTelNo" runat="server" Text="Business Telephone No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label><br /></span>
        <asp:TextBox ID="txtbusinessTelNo" runat="server" CssClass="width250" 
                placeholder="Business Telephone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessTelNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessTelNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiLocalNo" runat="server" Text="Business Local No. <br>(i.e. 123)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessLocalNo" runat="server" CssClass="width250" 
                placeholder="Business Local Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessLocalNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessLocalNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiCPNo" runat="server" Text="Business Cellphone No. <br>(i.e. 0916-1234-567)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessCPNo" runat="server" CssClass="width250" 
                placeholder="Business Cellphone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessCPNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessCPNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-">
            </asp:FilteredTextBoxExtender>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusinessFaxNo" runat="server" Text="Business Fax No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessFaxNo" runat="server" CssClass="width250"  
                placeholder="Business Fax Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessFaxNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessFaxNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <h3>Contact Person Information</h3>
        <hr />
        <span style="float: left; width: 200px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" placeholder="First Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtFN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="0123456789!@#$%^&amp;*()_+=[]{};'\:&quot;|,/&lt;&gt;?~`" 
            TargetControlID="txtFN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvFN" runat="server" ClientIDMode="Static" ControlToValidate="txtFN" CssClass="label-important" ErrorMessage="Input First Name" ForeColor="White"></asp:RequiredFieldValidator>    
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" placeholder="Last Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtLN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars"
            InvalidChars="`1234567890=~!@#$%^&amp;*()_+[]{};'\:&quot;|,./&lt;&gt;?" 
            TargetControlID="txtLN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvLN" runat="server" ClientIDMode="Static" ControlToValidate="txtLN" CssClass="label-important" ErrorMessage="Input Last Name" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblEmailAdd" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtEmailAddress" runat="server" placeholder="Email Address" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtEmailAddress_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="`~!#$%^&amp;*()+={}[];'\:&quot;|,&lt;&gt;/?" 
            TargetControlID="txtEmailAddress">
        </asp:FilteredTextBoxExtender>
        <br /><hr />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                CssClass="btn btn-large btn-primary pull-right" onclick="btnCancel_Click"/>
        <asp:Button ID="btnSave0" runat="server" Text="Save" CssClass="btn btn-large btn-primary pull-right marginBoth" onclick="btnSave_Click"/>
        <br /><br /><br /><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
</asp:Content>

