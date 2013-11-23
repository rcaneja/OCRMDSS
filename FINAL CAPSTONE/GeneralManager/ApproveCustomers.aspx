<%@ Page Title="Approved Customers" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="ApproveCustomers.aspx.cs" Inherits="GeneralManager_ApproveCustomers" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
        <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
        <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>

        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Business Information</h4></span>
        <br /><br />
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
        <br /><br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblBusinessFaxNo" runat="server" Text="Business Fax No. <br>(i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtbusinessFaxNo" runat="server" CssClass="width250"  
                placeholder="Business Fax Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessFaxNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessFaxNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <br /><br />
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Contact Person Information</h4></span>
        <br /><br />
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
                <asp:Button ID="btnApproved" runat="server" onclick="btnApprove_Click" Text="Approved" CssClass="btn btn-primary width150px marginBoth btn-large" />
                <asp:Button ID="btnDisapproved" runat="server" onclick="btnDisapprove_Click" Text="Disapproved" CssClass="btn btn-primary marginBoth width150px btn-large"/>
                <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancel" CssClass="btn btn-primary marginBoth width150px btn-large"/> 
            <br /><br /> 
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
     <br />
</asp:Content>

