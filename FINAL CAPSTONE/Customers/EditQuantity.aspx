<%@ Page Title ="Edit Quantity" Language="C#" AutoEventWireup="true" CodeFile="EditQuantity.aspx.cs" Inherits="Customers_EditQuantity" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Oversea Plastic Manufacturing</title>

    <!-- Le styles -->
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet">

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
    #wrap {min-height: 100%;height: auto !important;height: 100%;/* Negative indent footer by it's height */margin: -60px auto auto auto;}
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
    .auto-style1 {height: 50px;}
    .auto-style2 {width: 51px;}
    .auto-style3 {float: right;height: 40px;}
    .auto-style4 {width: 51px;height: 24px;}
    .auto-style5 {height: 24px;}
    .textBold {font-weight: bolder;line-height: 30px;color: black;}
    </style>
     
  </head>

  <body>      
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
                <li><asp:LinkButton ID="lblLoginStatus" runat="server" onclick="lblLoginStatus_Click" CssClass="nodeco"></asp:LinkButton></li>
                </ul>
          </div>
        </div>
      </div>
    </div>

      
<!-- Masthead
================================================== -->
    <header class="jumbotron subhead" id="overview">
      <div class="container">
          <h1>Update Quantity</h1>
          <br />
          <div class="span3 height100"> 
          <asp:Image ID="imgProduct" runat="server" class="img-rounded pull-right" alt="" style="height:270px; width:360px; margin: 0 auto 0 auto;"/>
          </div>
          <div class="span7 paddingBoth">
            <dl class="dl-horizontal">
            <dt><label class="sizeh3">Product Name:</label></dt>
            <dd><asp:Label ID="lblProductName" runat="server" CssClass="sizeh3" Text=""></asp:Label></dd>

            <dt><label class="sizeh3">Product Class:</label></dt>
            <dd><asp:Label ID="lblProductClass" runat="server" CssClass="sizeh3"></asp:Label></dd>

            <dt><label class="sizeh3">Serial Number:</label></dt>
            <dd><asp:Label ID="lblSerialNo" runat="server" CssClass="sizeh3 " Text=""></asp:Label></dd>

            <dt><label class="sizeh3">Description:</label></dt>
            <dd><asp:Label ID="lblDescription" runat="server" CssClass="sizeh3" Text=""></asp:Label></dd>

            <dt><label class="sizeh3">Unit Price:</label></dt>
            <dd><asp:Label ID="lblUnitPrice" runat="server" CssClass="sizeh3" Text=""></asp:Label></dd>

            </dl>
              <hr />
              <span class="sizeh3" style="margin-left:100px;">Quantity:</span>
              <div class="input-append">
                <asp:Label ID="lblCurrentQuantity" runat="server" CssClass="span label label-important text-center" Width="150px"></asp:Label>                  
                <asp:TextBox ID="txtUpdatedQuantity" runat="server" CssClass="span2 text-info input-large text-right textBold"></asp:TextBox>
                  <span class="add-on fontColorBlack"><b>kg.</b></span>
              </div>
              <br />
              <asp:Button ID="btnCancelShoppingCart" runat="server" CssClass="btn btn-primary btn-large pull-right text-center" Text="Cancel" OnClick="btnCancelShoppingCart_Click" Width="120px" />
              <asp:Button ID="btnUpdateShoppingCart" runat="server" CssClass="btn btn-primary btn-large pull-right text-center marginBoth" Text="Update Shopping Cart" OnClick="btnUpdateShoppingCart_Click" Width="230px" />
             <p style="margin-bottom:110px;"></p>
          </div>
      </div>
        </header>

    <!-- Footer
    ================================================== -->
     <div id="footer">
      <div class="container">
        <p class="muted credit text-center">&copy; 2013 Oversea Plastic Manufacturing designed by <a href="http://localhost:12345/FINAL%20CAPSTONE/TeamCReMe.aspx">Team CReMe</a></p>
      </div>
    </div>
    </div>
        </form>
    <!-- Le javascript
    ================================================== -->
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