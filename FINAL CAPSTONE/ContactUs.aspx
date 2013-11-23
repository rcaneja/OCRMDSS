<%@ Page Title="Contact Us" Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Contact Us</title>

    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet" />

    <style>/* GLOBAL STYLES-------------------------------------------------- */
    /* Padding below the footer and lighter body text */
    html,body {height: 100%;color: #5a5a5a;padding-top: 56px;}
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
    .navbar .btn-navbar {margin-top: 10px;} 
    /* Wrapper for page content to push down footer */
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
    .auto-style2 {width: 239px;}
    .auto-style4 {width: 239px;height: 50px;}
    .auto-style5 {height: 50px;}
    </style>
     
  </head>

  <body>      
    <form id="frmRegistration" runat="server">
    <div id="wrap">
    <!-- Navbar================================================== -->
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
                <li class="active"><a href="http://localhost:12345/FINAL%20CAPSTONE/ContactUs.aspx">Contact Us</a></li>
                </ul>
                <ul class="nav pull-right">
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/Customers/MyProfile.aspx"><asp:Label ID="myProfile" runat="server" Text="My Profile"></asp:Label></a></li>
                <li><asp:LinkButton ID="lblLoginStatus" runat="server" onclick="lblLoginStatus_Click" CssClass="nodeco"></asp:LinkButton></li>
                </ul>
          </div>
        </div>
    </div>
    </div>

      
<%--<!-- Masthead================================================== -->
    <header class="jumbotron subhead" id="overview">
      <div class="container">
        <h1>Contact Us</h1>
      </div>
    </header>--%>
           
    <div class="container">
        <br />
        <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h2>Contact Us</h2><h4>Keep in touch with us.</h4></span>
    <div class="row-fluid height100">
    <div class="span6 pull-left borRad5 displayblock height100">
       <h3>Please send us your inquiries.</h3>
       <hr />
       <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
       <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
       <br />
       <table>
           <tr>
               <td class="text-right"><asp:Label ID="lblFN" runat="server" Text="First Name:" CssClass="labellarge"></asp:Label></td>
               <td class="auto-style4">
                   <asp:TextBox ID="txtInquiryFN" runat="server" 
                       placeholder="First Name" MaxLength="50"></asp:TextBox>
                   <asp:FilteredTextBoxExtender ID="txtInquiryFN_FilteredTextBoxExtender" 
                       runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
                       InvalidChars="\|`1234567890=~!@#$%^&amp;*()_+[]\{}|;':&quot;,/&lt;&gt;?" 
                       TargetControlID="txtInquiryFN">
                   </asp:FilteredTextBoxExtender>
               </td>
           </tr>
           
           <tr>
                <td class="text-right"><asp:Label ID="lblLN" runat="server" Text="Last Name:" CssClass="labellarge"></asp:Label></td>
               <td class="auto-style4">
                   <asp:TextBox ID="txtInquiryLN" runat="server" 
                       placeholder="Last Name" MaxLength="50"></asp:TextBox>
                   <asp:FilteredTextBoxExtender ID="txtInquiryLN_FilteredTextBoxExtender" 
                       runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
                       InvalidChars="`1234567890=~!@#$%^&amp;*()_+[]{};':&quot;,./&lt;&gt;?\|" 
                       TargetControlID="txtInquiryLN">
                   </asp:FilteredTextBoxExtender>
                </td>
           </tr>
           
           <tr>
                <td class="text-right"><asp:Label ID="lblEmail" runat="server" 
                        Text="Email Address:" CssClass="labellarge"></asp:Label></td>
               <td class="auto-style4">
                   <asp:TextBox ID="txtInquiryEmail" runat="server" 
                       placeholder="Email Address" MaxLength="50"></asp:TextBox>
                   <asp:FilteredTextBoxExtender ID="txtInquiryEmail_FilteredTextBoxExtender" 
                       runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
                       InvalidChars="`~!#$%^&amp;*()+={}[]\|;':&quot;,/&lt;&gt;?" 
                       TargetControlID="txtInquiryEmail">
                   </asp:FilteredTextBoxExtender>
                </td>
           </tr>
           
           <tr>
                <td class="text-right"><asp:Label ID="lblContactNo" runat="server" Text="Contact Number:" CssClass="labellarge"></asp:Label></td>
               <td class="auto-style4">
                   <asp:TextBox ID="txtInquiryContactNo" runat="server" 
                       placeholder="Contact Number" MaxLength="50"></asp:TextBox>
                   <asp:FilteredTextBoxExtender ID="txtInquiryContactNo_FilteredTextBoxExtender" 
                       runat="server" ClientIDMode="Static" Enabled="True" 
                       TargetControlID="txtInquiryContactNo" ValidChars="1234567890()-+">
                   </asp:FilteredTextBoxExtender>
                </td>
           </tr>
           
           <tr>
               <td class="text-right"><asp:Label ID="lblMessage" runat="server" Text="Message:" CssClass="labellarge"></asp:Label></td>
               <td class="auto-style2"><asp:TextBox ID="txtInquiryMessage" runat="server" 
                       placeholder="Message" TextMode="MultiLine" Width="206px"></asp:TextBox></td>
           </tr>
       </table>

        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary btn-large pull-right marginBoth" Text="SEND" OnClick="btnSend_Click" />
        <br />
        <br />
        <br />
        <br />      
    </div>

    <div class="span6 pull-right borRad5 displayblock">
         <h3>OVERSEA PLASTIC MANUFACTURING</h3>
        <hr />
        <table>
            <tr class="lineheight40">
                <td class="text-left"><i class="icon-home"></i> Address:</td>
                <td class="boldFont">5 M. Francisco Street, Lingunan, Valenzuela City</td>
            </tr>
            
            <tr class="lineheight40">
                <td class="text-left"><i class="icon-th"></i> Telephone Number:</td>
                <td class="boldFont">(02) 293-90-34 / (02) 456-92-85</td>
            </tr>

            <tr class="lineheight40">
                <td class="text-left"><i class="icon-envelope"></i> Email Address:</td>
                <td class="boldFont">overseaplastic@yahoo.com</td>
            </tr>
        </table>
    </div></div></div>
    </div>

    <!-- Footer================================================== -->
     <div id="footer">
      <div class="container">
        <p class="muted credit text-center">&copy; 2013 Oversea Plastic Manufacturing designed by <a href="http://localhost:12345/FINAL%20CAPSTONE/TeamCReMe.aspx">Team CReMe</a></p>
      </div>
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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

    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/application.js" type="text/javascript"></script>

    <!-- Analytics
    ================================================== -->
    <script>
        var _gauges = _gauges || [];(function () {var t = document.createElement('script');t.type = 'text/javascript';t.async = true;t.id = 'gauges-tracker';t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013');t.src = '//secure.gaug.es/track.js';var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();
    </script>    
  </body>
</html>
