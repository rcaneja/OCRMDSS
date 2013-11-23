<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Oversea Plastic Manufacturing</title>

    <!-- CSS -->
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet" />
    
    <style type="text/css">
    /* Sticky footer styles-------------------------------------------------- */
    html,body {height: 100%;/* The html and body elements cannot have any padding or margin. */}
    /* GLOBAL STYLES-------------------------------------------------- */
    /* Padding below the footer and lighter body text */
    /* CUSTOMIZE THE NAVBAR-------------------------------------------------- */
    /* Special class on .container surrounding .navbar, used for positioning it into place. */
    .navbar-wrapper {position: absolute;top: 0;left: 0;right: 0;z-index: 10;margin-top: 20px;margin-bottom: -90px; /* Negative margin to pull up carousel. 90px is roughly margins and height of navbar. */}
    .navbar-wrapper .navbar {}
    /* Remove border and change up box shadow for more contrast */
    .navbar .navbar-inner {border: 0;-webkit-box-shadow: 0 2px 10px rgba(0,0,0,.25);-moz-box-shadow: 0 2px 10px rgba(0,0,0,.25);box-shadow: 0 2px 10px rgba(0,0,0,.25);}
    /* Downsize the brand/project name a bit */
    .navbar .brand {/*padding: 14px 20px 16px;  Increase vertical padding to match navbar links */font-size: 16px;font-weight: bold;text-shadow: 0 -1px 0 rgba(0,0,0,.5);}
    /* Navbar links: increase padding for taller navbar */
    .navbar .nav > li > a {padding: 15px 20px;}
    /* Offset the responsive button for proper vertical alignment */
    .navbar .btn-navbar {margin-top: 10px;}
    /* CUSTOMIZE THE CAROUSEL-------------------------------------------------- */
    /* Carousel base class */
    .carousel {margin-bottom: 60px;top: 0px;left: 0px;height: 499px;}
    .carousel .container {position: relative;z-index: 9;}
    .carousel-control {height: 80px;margin-top: 0;font-size: 120px;text-shadow: 0 1px 1px rgba(0,0,0,.4);background-color: transparent;border: 0;z-index: 10;}
    .carousel .item {height: 500px;}
    .carousel img {position: absolute;top: 0;left: 0;min-width: 100%;height: 500px;}
    .carousel-caption {background-color: transparent;position: static;max-width: 550px;padding: 0 20px;margin-top: 200px;}
    .carousel-caption h1,
    .carousel-caption .lead {margin: 0;line-height: 1.25;color: #fff;text-shadow: 0 1px 1px rgba(0,0,0,.4);}
    .carousel-caption .btn {margin-top: 10px;}
    /* RESPONSIVE CSS-------------------------------------------------- */
    @media (max-width: 979px) {.container.navbar-wrapper {margin-bottom: 0;width: auto;}
    .navbar-inner {border-radius: 0;margin: -20px 0;}
    .carousel .item {height: 500px;}
    .carousel img {width: auto;height: 500px;}
    .featurette {height: auto;padding: 0;}
    .featurette-image.pull-left,
    .featurette-image.pull-right {display: block;float: none;max-width: 40%;margin: 0 auto 20px;}}
    @media (max-width: 767px) {.navbar-inner {margin: -20px;}
    .carousel {margin-left: -20px;margin-right: -20px;}
    .carousel .container {}
    .carousel .item {height: 300px;}
    .carousel img {height: 300px;}
    .carousel-caption {width: 65%;padding: 0 70px;margin-top: 100px;}
    .carousel-caption h1 {font-size: 30px;}
    .carousel-caption .lead,.carousel-caption .btn {font-size: 18px;}
    .marketing .span4 + .span4 {margin-top: 40px;}
    .featurette-heading {font-size: 30px;}
    .featurette .lead {font-size: 18px;line-height: 1.5;}
    /* Wrapper for page content to push down footer */
    #wrap {min-height: 100%;height: auto !important;height: 100%;/* Negative indent footer by it's height */margin: 0 auto -60px;}
    /* Set the fixed height of the footer here */
    #push,#footer {height: 60px;}
    #footer {background-color: #f5f5f5;
    /* Lastly, apply responsive CSS fixes as necessary 
    @media (max-width: 767px) {#footer {margin-left: -20px;margin-right: -20px;padding-left: 20px;padding-right: 20px;}}
    /* Custom page CSS-------------------------------------------------- */*/
    /* Not required for template or sticky footer method. */
    #wrap > .container }}{padding-top: 60px;}
    .container .credit {margin: 20px 0;}
    code {font-size: 80%;}
    #push1,#push2,#push3 {height: 60px;}
    </style>
  </head>

  <body>
    <form ID="frmHome" runat="server">
    <!-- Part 1: Wrap all page content here -->
    <div id="wrap">

       <!-- NAVBAR
    ================================================== -->
    <div class="navbar-wrapper">
      <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
        <div class="container">
        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <a class="brand" href="http://localhost:12345/FINAL%20CAPSTONE/Home.aspx" style="width:300px; padding-left: 5px;">
            <img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/OPM.jpg" alt="" style="height:40px; width:45px;" class="img-rounded"/>&nbsp;Oversea Plastic Manufacturing</a>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="http://localhost:12345/FINAL%20CAPSTONE/Home.aspx">Home</a></li>
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/Products.aspx">Products</a></li>
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/AboutUs.aspx">About Us</a></li>
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/ContactUs.aspx">Contact Us</a></li>
                <!-- Read about Bootstrap dropdowns at http://twitter.github.com/bootstrap/javascript.html#dropdowns -->
                </ul>
                <ul class="nav pull-right">
                <li><asp:LinkButton ID="myProfile" runat="server" Text="My Profile" OnClick="myProfile_Click"></asp:LinkButton></li>
                <li></li>
                <li><asp:LinkButton ID="lblLoginStatus" runat="server" onclick="lblLoginStatus_Click" CssClass="nodeco"></asp:LinkButton></li>
                </ul>
            </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->



    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide1-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide2-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide3-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide4-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide5-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide6-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide7-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide8-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide9-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>          
        <div class="item"><img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/slide10-overseaplastic.jpg" alt=""/><div class="container"><div class="carousel-caption"></div></div></div>              
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
    </div><!-- /.carousel -->  
      

    <div id="footer">
      <div class="container">
        <p class="muted credit text-center">&copy; 2013 Oversea Plastic Manufacturing designed by <a href="http://localhost:12345/FINAL%20CAPSTONE/TeamCReMe.aspx">Team CReMe</a></p>
      </div>
    </div>
        </form>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
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
    <script>
        !function ($) {$(function () {$('#myCarousel').carousel()})}(window.jQuery)</script>
    <script src="assets/js/holder/holder.js"></script>
  </body>
</html>
