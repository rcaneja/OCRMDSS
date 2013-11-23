<%@ Page Title = "Registration" Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Customers_Registration" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Oversea Plastic Manufacturing</title>

    <!-- Le styles -->
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet" />

        <style> /* GLOBAL STYLES-------------------------------------------------- */
        /* Padding below the footer and lighter body text */
        html, body { height: 100%;color: #5a5a5a;padding-top: 60px;}
        /* CUSTOMIZE THE NAVBAR-------------------------------------------------- */
        /* Special class on .container surrounding .navbar, used for positioning it into place. */
        .navbar-wrapper {position: absolute;top: 0;left: 0;right: 0;z-index: 10;margin-top: 20px;margin-bottom: -90px; /* Negative margin to pull up carousel. 90px is roughly margins and height of navbar. */}
        .navbar-wrapper .navbar {}
        /* Remove border and change up box shadow for more contrast */
        .navbar .navbar-inner {border: 0;-webkit-box-shadow: 0 2px 10px rgba(0,0,0,.25);-moz-box-shadow: 0 2px 10px rgba(0,0,0,.25);box-shadow: 0 2px 10px rgba(0,0,0,.25);}
        /* Downsize the brand/project name a bit */
        .navbar .brand {padding: 14px 20px 16px;  /*Increase vertical padding to match navbar links */font-size: 16px;font-weight: bold;text-shadow: 0 -1px 0 rgba(0,0,0,.5);}
        /* Navbar links: increase padding for taller navbar */
        .navbar .nav > li > a {padding: 15px 20px;}
        /* Offset the responsive button for proper vertical alignment */
        .navbar .btn-navbar {margin-top: 10px;} /* Wrapper for page content to push down footer */
        #wrap {min-height: 100%;height: auto !important;height: 100%;/* Negative indent footer by it's height */margin: -60px auto auto auto ;}
        /* Set the fixed height of the footer here */
        #push,#footer {height: 60px;}
        #footer {background-color: #f5f5f5;}
        /* Lastly, apply responsive CSS fixes as necessary */
        @media (max-width: 767px) {#footer {margin-left: -20px;margin-right: -20px;padding-left: 20px;padding-right: 20px;}}
        /* Custom page CSS-------------------------------------------------- */
        /* Not required for template or sticky footer method. */
        #wrap > .container {}
        .container .credit {margin: 0 0;padding: 20px;}
        code {font-size: 80%;}
        </style>
  </head>

 <body style="background: url(http://localhost:12345/FINAL%20CAPSTONE/assets/img/log.jpeg); background-size:100%; height:98px;">       
    <form id="frmRegistration" runat="server">
     <!-- Part 1: Wrap all page content here -->
    <div id="wrap">
    <!-- Navbar
    ================================================== -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="http://localhost:12345/FINAL%20CAPSTONE/Home.aspx">
          <img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/OPM.jpg" alt="" style="height:40px; width:45px;" class="img-rounded"/>&nbsp;Oversea Plastic Manufacturing</a>
          <div class="nav-collapse collapse">
                <ul class="nav">
                <li class=""><a href="http://localhost:12345/FINAL%20CAPSTONE/Home.aspx">Home</a></li>
                <li class=""><a href="http://localhost:12345/FINAL%20CAPSTONE/Products.aspx">Products</a></li>
                <li class=""><a href="http://localhost:12345/FINAL%20CAPSTONE/AboutUs.aspx">About Us</a></li>
                <li class=""><a href="http://localhost:12345/FINAL%20CAPSTONE/ContactUs.aspx">Contact Us</a></li>
                </ul>
                <ul class="nav pull-right">
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/Customers/MyProfile.aspx"><asp:Label ID="myProfile" runat="server" Text="My Profile"></asp:Label></a></li>
                <li class="active"><a href="http://localhost:12345/FINAL%20CAPSTONE/Login.aspx">Login</a></li>
                </ul>
          </div>
        </div>
      </div>
    </div>

      
<!-- Masthead
================================================== -->
    <%--<header class="jumbotron subhead" id="overview">
      <div class="container">
        <h1>Registration</h1>
        <p class="lead">We are happy to transact with you.</p>
      </div>
    </header>--%>
           
    <div class="container">
    <div class="span12">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
    <div class="row-fluid">
    <div class="form-actions span5 pull-left borRad5" style="height:283px; width: 40%; margin-bottom: 0px; margin-top: 30px;">
        <h3>Account Information</h3>
        <hr />
        <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="labelsmall"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="width200" ></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtUsername_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="~`!@#$%^&amp;*()-_=+\';:&quot;|?&gt;&lt;,./" 
            TargetControlID="txtUsername">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ClientIDMode="Static" ControlToValidate="txtUsername" CssClass="label-important" ErrorMessage="Input Username" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="labelsmall"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"  CssClass="width200"></asp:TextBox>
        <asp:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" 
            ClientIDMode="Static" Enabled="True" PreferredPasswordLength="8" 
            TargetControlID="txtPassword" DisplayPosition="AboveRight" HelpHandlePosition="RightSide">
        </asp:PasswordStrength>
        <asp:FilteredTextBoxExtender ID="txtPassword_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars=":;'&quot;\|/?.&gt;,&lt;=+-_)(*&amp;^%$#~`" 
            TargetControlID="txtPassword">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ClientIDMode="Static" ControlToValidate="txtPassword" CssClass="label-important" ErrorMessage="Input Password" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="labelsmall"></asp:Label>
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
        <br />
        <hr />
        <asp:Label ID="lblNote" runat="server" CssClass="label-info pull-right" ForeColor="White">Please fill out necessary information. &#8594 &#8594</asp:Label>
        <br />
    </div>

    <div class="form-actions span7 borRad5 height100">
        <h3>Business Information</h3>
        <hr />
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiName" runat="server" Text="Business Name:" CssClass="labellarge"></asp:Label></span><br />
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
        <span style="float: left; width: 150px;"><asp:Label ID="lblBusiAdd" runat="server" Text="Business Address" CssClass="labellarge width175px"></asp:Label></span>
        <p style="display: inline-block;"><asp:TextBox ID="txtHouseNo" runat="server" placeholder="House No" CssClass="width100px" MaxLength="4"></asp:TextBox>
        <asp:TextBox ID="txtStreetName" runat="server" placeholder="Street" CssClass="width200"></asp:TextBox>
        <asp:TextBox ID="txtBarangay" runat="server" placeholder="Barangay | District" CssClass="width200"></asp:TextBox>
        <asp:TextBox ID="txtCity" runat="server" placeholder="City | Town" CssClass="width200"></asp:TextBox>
        <asp:TextBox ID="txtProvince" runat="server" placeholder="Province" CssClass="width200"></asp:TextBox>
        <asp:TextBox ID="txtPostalCode" runat="server" placeholder="Postal Code" CssClass="width100px" MaxLength="4"></asp:TextBox>
        </p>
        <asp:FilteredTextBoxExtender ID="txtHouseNo_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtHouseNo"></asp:FilteredTextBoxExtender>
        <asp:FilteredTextBoxExtender ID="txtStreetName_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtStreetName"></asp:FilteredTextBoxExtender>
        <asp:FilteredTextBoxExtender ID="txtBarangay_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtBarangay"></asp:FilteredTextBoxExtender>
        <asp:FilteredTextBoxExtender ID="txtCity_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtCity"></asp:FilteredTextBoxExtender>
        <asp:FilteredTextBoxExtender ID="txtPostalCode_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" TargetControlID="txtPostalCode" FilterMode="ValidChars" ValidChars="1234567890"></asp:FilteredTextBoxExtender>
        <asp:FilteredTextBoxExtender ID="txtProvince_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" InvalidChars="~`!$%^+=_[]{};'&quot;\|&lt;&gt;?" TargetControlID="txtProvince"></asp:FilteredTextBoxExtender>
        <br />
        <asp:RequiredFieldValidator ID="rfvHouseNo" ControlToValidate="txtHouseNo" ErrorMessage="House No." runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvStreetName" ControlToValidate="txtStreetName" ErrorMessage="Street" runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvBarangay" ControlToValidate="txtBarangay" ErrorMessage="Barangay" runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="txtCity" ErrorMessage="Business City" runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvPostalCode" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code" runat="server" ClientIDMode="Static"  CssClass="label-important"  ForeColor="White"></asp:RequiredFieldValidator>
        <br />                       
        <asp:Label ID="lblBusiTelNo" runat="server" Text="Business Telephone No. (i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtbusinessTelNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Telephone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessTelNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessTelNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <br />
        <asp:Label ID="lblBusiLocalNo" runat="server" Text="Business Local No. (i.e. 123)" CssClass="labellarge"></asp:Label><br />
        <asp:TextBox ID="txtbusinessLocalNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Local Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessLocalNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessLocalNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        <br />
        <asp:Label ID="lblBusiCPNo" runat="server" Text="Business Cellphone No. (i.e. 0916-1234-567)" CssClass="labellarge"></asp:Label><br>
        <asp:TextBox ID="txtbusinessCPNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Cellphone Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessCPNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessCPNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-">
            </asp:FilteredTextBoxExtender>
        <br />
        <asp:Label ID="lblBusinessFaxNo" runat="server" Text="Business Fax No. (i.e. (032)123-45-67)" CssClass="labellarge"></asp:Label><br>
        <asp:TextBox ID="txtbusinessFaxNo" runat="server" CssClass="input-xlarge" 
                placeholder="Business Fax Number"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtbusinessFaxNo_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtbusinessFaxNo" 
                ClientIDMode="Static" FilterMode="ValidChars" ValidChars="1234567890-()">
            </asp:FilteredTextBoxExtender>
        <h3>Contact Person Information</h3>
        <hr />
        <span style="float: left; width: 150px;"><asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtFN" runat="server" placeholder="First Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtFN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="0123456789!@#$%^&amp;*()_+=[]{};'\:&quot;|,/&lt;&gt;?~`" 
            TargetControlID="txtFN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvFN" runat="server" ClientIDMode="Static" ControlToValidate="txtFN" CssClass="label-important" ErrorMessage="Input First Name" ForeColor="White"></asp:RequiredFieldValidator>    
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtLN" runat="server" placeholder="Last Name" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtLN_FilteredTextBoxExtender" runat="server" 
            ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars"
            InvalidChars="`1234567890=~!@#$%^&amp;*()_+[]{};'\:&quot;|,./&lt;&gt;?" 
            TargetControlID="txtLN">
        </asp:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="rfvLN" runat="server" ClientIDMode="Static" ControlToValidate="txtLN" CssClass="label-important" ErrorMessage="Input Last Name" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <span style="float: left; width: 150px;"><asp:Label ID="lblEmailAdd" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtEmailAddress" runat="server" placeholder="Email Address" CssClass="width250"></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtEmailAddress_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="`~!#$%^&amp;*()+={}[];'\:&quot;|,&lt;&gt;/?" 
            TargetControlID="txtEmailAddress">
        </asp:FilteredTextBoxExtender>
        <br />
        <br /><hr />
        <asp:Button ID="btnRegister" runat="server" Text="Register" 
            CssClass="btn btn-large btn-primary pull-right" onclick="btnRegister_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    </div>
    </div>
    </div>
    </div>
    </div>
        
    <div class="container invisible">
        
    </div>

    <!-- Footer
    ================================================== -->
      <div id="footer">
      <div class="container">
        <p class="muted credit text-center">&copy; 2013 Oversea Plastic Manufacturing designed by <a href="http://localhost:12345/FINAL%20CAPSTONE/TeamCReMe.aspx">Team CReMe</a></p>
      </div>
    </div>
    </form>
    <!-- Le javascript================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/jquery.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-transition.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-alert.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-modal.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-scrollspy.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-tab.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-popover.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-button.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-collapse.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-carousel.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-typeahead.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/bootstrap-affix.js" type="text/javascript"></script>

    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/holder/holder.js" type="text/javascript"></script>
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>

    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/application.js"></script>

    <!-- Analytics================================================== -->
    <script>
        var _gauges = _gauges || []; (function () { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();
    </script>     
  </body>
</html>