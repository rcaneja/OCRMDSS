﻿<%@ Page Title="Products Info" Language="C#" AutoEventWireup="true" CodeFile="ProductInfo.aspx.cs" Inherits="ProductInfo" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Product Information</title>

    <!-- Le styles -->
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet">

    <style>/* GLOBAL STYLES-------------------------------------------------- */
    /* Padding below the footer and lighter body text */
    html,body {height: 100%;color: #5a5a5a;padding-top: 65px;}
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
                <li class="active"><a href="http://localhost:12345/FINAL%20CAPSTONE/Products.aspx">Products</a></li>
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
    </div>


      
<!-- Masthead
================================================== -->  
    <header class="jumbotron subhead" id="overview">
      <div class="container">
          <h1>Products Information</h1>
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
              <asp:Button ID="btnBack" runat="server" CssClass="btn btn-large pull-right marginBoth width150px" Text="Back" OnClick="btnBack_Click" />
              <button ID="btnModal" runat="server" type="button" class="btn btn-primary btn-large pull-right" data-toggle="modal" data-target="#AddToCart">Add To Cart</button>
              <br />
              <br />
              <br />
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <br />
                <b><asp:Label ID="lblNoti" runat="server" CssClass="alert alert-danger alert-block lineheight40 text-center" Visible="false"></asp:Label></b>
          
          <br /><br /><br />
          </div>
      </div>
            <!-- Modal -->
            <div id="AddToCart" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header" style="color: black; background-color: #00ff90; border-radius:5px;">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove-sign"></i></button>
            <h3 id="myModalLabel">Add Product to Cart</h3>
            </div>
            <div class="modal-body">
            <asp:ListView ID="lvProducts" runat="server" >
             <ItemTemplate>
                 <div class="pull-left"><img src="<%# Eval("productImage") %>" style="height:275px; width:225px;" alt="" class="img-rounded" /><br /></div>
                 <div class="pull-right">
                 <center style="color:black; width: 300px;">
                     Product Name: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productName") %></label><br />
                     Product Serial Number: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productSerialNo") %></label><br />
                     Product Class: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productClassName") %></label><br />
                     Product Type: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productSubClass") %></label><br />
                     Product Description: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productDescription") %></label><br />
                     Product Unit Price: <br />
                     <label class="label label-success font14 lineheight20"><%# Eval("productUnitPrice") %></label><br />
                 </center></div>
             </ItemTemplate>
            </asp:ListView>
            </div>
            <div class="modal-footer">
             <span class="sizeh3" style="margin-left:100px; color: black;">Quantity:</span>
              <div class="input-append">
                  <asp:TextBox ID="txtQuantity" runat="server" CssClass="span2 text-info input-large text-right"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txtQuantity_FilteredTextBoxExtender" 
                    runat="server" ClientIDMode="Static" Enabled="True" 
                    TargetControlID="txtQuantity" FilterMode="ValidChars" ValidChars="1234567890">
                    </asp:FilteredTextBoxExtender>
                  <span class="add-on fontColorBlack"><b>kg.</b></span>
              </div>
            <hr />
            <button class="btn btn-large width150px" data-dismiss="modal" aria-hidden="true">Close</button>
            <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-large pull-right width150px" Text="Add To Cart" OnClick="btnAddToCart_Click" />
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

    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/application.js" type="text/javascript"></script>

    <!-- Analytics
    ================================================== -->
    <script>var _gauges = _gauges || [];(function () {var t = document.createElement('script');t.type = 'text/javascript';t.async = true;t.id = 'gauges-tracker';t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013');t.src = '//secure.gaug.es/track.js';var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();</script>    
  </body>
</html>
