<%@ Page Title="Error 404" Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="TeamCReMe" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8" />
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Team CReMe</title>

    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet" />

    <style>/* GLOBAL STYLES-------------------------------------------------- */
        /* Padding below the footer and lighter body text */
        html, body { height: 100%;color: #5a5a5a;padding-top: 56px;}
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
        .style1
        {
            color: #FF0000;
        }
        .auto-style1 {
            width: 870px;
            height: 603px;
        }
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
                <li class="active"><a href="http://localhost:12345/FINAL%20CAPSTONE/AboutUs.aspx">About Us</a></li>
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


<!-- Masthead================================================== -->
    <header class="jumbotron subhead" id="overview">
      <div class="container">
        <center><h1 style="font-family: Segoe Print; color: #0000FF">&nbsp;</h1>
        <h1 style="font-family: 'Sakkal Majalla'; font-size: 40pt;" class="style1"><strong>
            ERROR 404!</strong></h1>
            <p style="font-family: 'Sakkal Majalla'; color: #FF0066; font-size: 40pt;">PAGE COULD NOT BE FOUND!</p>
            <p style="font-family: 'Sakkal Majalla'; color: #FF0066; font-size: 40pt;">
                <img alt="" class="auto-style1" src="assets/img/404.jpg" /></p>
        </center>
    <br />
      </div>
    </header>
    </div>

<!-- Footer================================================== -->
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