<%@ Page Title="Validate Customers" Language="C#" MasterPageFile="~/Secretary/Masterpage.master" AutoEventWireup="true" CodeFile="ValidateCustomers.aspx.cs" Inherits="Secretary_ValidateCustomers" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
     <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center" Visible="false"><i class="icon-info-sign"></i></asp:Label>
        <h2>Customer Information</h2>
        <hr />
            Business Information</h3>
        <hr />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiName" runat="server" Text="Business Name:" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessName" runat="server" placeholder="Business Name" TextMode="MultiLine" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtBusinessName_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="`{}[]" TargetControlID="txtBusinessName">
        </asp:FilteredTextBoxExtender>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusiAdd" runat="server" Text="Business Address <br>(i.e. No. Street Barangay, City, Province, Postal Code)" CssClass="labellarge width175px"></asp:Label></span>
        <p style="display: inline-block;">
        <asp:TextBox ID="txtbusinessAddress" runat="server" placeholder="Street" CssClass="width250" TextMode="MultiLine"></asp:TextBox>
        </p>
        <asp:FilteredTextBoxExtender ID="txtbusinessAddress_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtbusinessAddress"></asp:FilteredTextBoxExtender>
        <br /><br />                       
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
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" placeholder="Last Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtLN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars"
            InvalidChars="`1234567890=~!@#$%^&amp;*()_+[]{};'\:&quot;|,./&lt;&gt;?" 
            TargetControlID="txtLN">
        </asp:FilteredTextBoxExtender>
        <br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblEmailAdd" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtEmailAddress" runat="server" placeholder="Email Address" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtEmailAddress_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="`~!#$%^&amp;*()+={}[];'\:&quot;|,&lt;&gt;/?" 
            TargetControlID="txtEmailAddress">
        </asp:FilteredTextBoxExtender>
            <br />
                <br />
            <br /><br />
                <asp:Button ID="btnValidate" runat="server" onclick="btnValidate_Click" Text="Validate" CssClass="btn btn-primary width150px marginBoth btn-large" />
                <asp:Button ID="btnInvalidate" runat="server" onclick="btnInvalidate_Click" Text="Invalidate" CssClass="btn btn-primary marginBoth width150px btn-large"/>
                <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit Details" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
                <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancel" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
            <br /><br /> 
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
     <br />
</asp:Content>

