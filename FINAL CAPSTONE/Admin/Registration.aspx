<%@ Page Title = "Employee Registration" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="EmployeesRegistration" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="header" ContentPlaceHolderID="jumboTron" Runat="Server">   
        <h1>Employee Registration</h1>
        <p class="lead">Welcome to the Company.</p>      
</asp:Content>
 
 <asp:Content ID="main" ContentPlaceHolderID="mainContent" Runat="Server">          

    <asp:Label ID="lblNoti" runat="server" CssClass="alert alert-info alert-block lineheight40 text-center boldFont" Visible="false"></asp:Label>

     <div class="pull-left">
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Account Information</h4></span>
        <br /><br />
        <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="labelsmall"></asp:Label><br />
        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" ></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtUsername_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="~`!@#$%^&amp;*()-_=+\';:&quot;|?&gt;&lt;,./" 
            TargetControlID="txtUsername">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ClientIDMode="Static" ControlToValidate="txtUsername" CssClass="label-important" ErrorMessage="Input Username" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="labelsmall"></asp:Label><br />
        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
        <asp:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" 
            ClientIDMode="Static" Enabled="True" PreferredPasswordLength="8" 
            TargetControlID="txtPassword">
        </asp:PasswordStrength>
        <asp:FilteredTextBoxExtender ID="txtPassword_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars=":;'&quot;\|/?.&gt;,&lt;=+-_)(*&amp;^%$#~`" 
            TargetControlID="txtPassword">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ClientIDMode="Static" ControlToValidate="txtPassword" CssClass="label-important" ErrorMessage="Input Password" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label><br />
        <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password"  CssClass="width200"></asp:TextBox>
        <asp:PasswordStrength ID="PasswordStrength1" runat="server" 
            ClientIDMode="Static" Enabled="True" PreferredPasswordLength="8" 
            TargetControlID="txtConfirmPassword" DisplayPosition="AboveRight" HelpHandlePosition="RightSide">
        </asp:PasswordStrength>
        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars=":;'&quot;\|/?.&gt;,&lt;=+-_)(*&amp;^%$#~`" 
            TargetControlID="txtConfirmPassword">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ClientIDMode="Static" ControlToValidate="txtPassword" CssClass="label-important" ErrorMessage="Input Password" ForeColor="White"></asp:RequiredFieldValidator>
        
        </div>

        <div class="pull-right">
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Employee Information</h4></span>
        <br /><br />
        <asp:Label ID="lblUserType" runat="server" Text="User Type:" CssClass="labellarge"></asp:Label><br />
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown">            
            <asp:ListItem Value="2"> 2 - Secretary </asp:ListItem>
            <asp:ListItem Value="3"> 3 - Warehouse Manager </asp:ListItem>
            <asp:ListItem Value="4"> 4 - General Manager </asp:ListItem> 
            <asp:ListItem Value="5"> 5 - Admin </asp:ListItem>                       
          </asp:DropDownList>
        <br />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtFN" runat="server" placeholder="First Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtFN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="0123456789!@#$%^&amp;*()_+=[]{};'\:&quot;|,/&lt;&gt;?~`" 
            TargetControlID="txtFN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvFN" runat="server" ClientIDMode="Static" ControlToValidate="txtFN" CssClass="label-important" ErrorMessage="Input First Name" ForeColor="White"></asp:RequiredFieldValidator>    
        <br />
        <asp:Label ID="lblLN" runat="server" Text="Last Name:" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtLN" runat="server" placeholder="Last Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtLN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars"
            InvalidChars="`1234567890=~!@#$%^&amp;*()_+[]{};'\:&quot;|,./&lt;&gt;?" 
            TargetControlID="txtLN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvLN" runat="server" ClientIDMode="Static" ControlToValidate="txtLN" CssClass="label-important" ErrorMessage="Input Last Name" ForeColor="White"></asp:RequiredFieldValidator>
        

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="DropDownList1" Display="Dynamic" 
            ErrorMessage="Insert Employee Type Here." Font-Size="Small" ForeColor="White" 
            ClientIDMode="Static" CssClass="label-important"></asp:RequiredFieldValidator>
          <br />
        <br /><br />
        <asp:Button ID="btnRegister" runat="server" Text="Register" 
            CssClass="btn btn-large btn-primary pull-right" onclick="btnRegister_Click" />
        </div>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>   
     
     <div style="height:400px; display:block"></div>
</asp:Content>
   
   

    