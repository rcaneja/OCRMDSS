<%@ Page Title="About Us" Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>About Us</title>

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
              
<%--<!-- Masthead================================================== -->
    <header class="jumbotron subhead" id="overview">
      <div class="container">
        <h1>About Us</h1>
        <p class="lead">Learn our story. Learn our history.</p>
      </div>
    </header>--%>

           
    <div class="container">
        <br />
        <span class="label label-success text-center" style="width: 100%; background-color:#26972D"><h2>About Us</h2><h4>Learn our story. Learn our history.</h4></span>
  
    <div class="row-fluid">
    <div class="span6 pull-left borRad5 displayblock height100">
        <h3>Company Profile</h3>
        <hr />
        <p class="justified"><b><span class="font20">O</span>VERSEA PLASTIC MANUFACTURING</b> is in the industry of manufacturing plastic pellets. 
        The company is a supplier of quality plastic pellets to firms which uses recycled plastic pellets as raw materials in their production processes.</p>
        <br />
        <p class="justified">The company strives to be the pioneer supplier of recycled plastic pellets to firms engaged in manufacturing recycled and environment-friendly household plastic items, thereby contributing to the reduction of plastics in landfills.</p>
        <br />
        <p class="justified">The company prides itself with balancing affordability with quality by ensuring that production processes remain effective and efficient. More so, customers see the company as being resilient and adaptive in delivering their requests and orders as timely and as cost effective as possible.</p>   
        <br />
        <p class="justified">The company is committed to maintain and further improve the quality of their products and services that they provide while also adhering to environmental and safety guidelines.</p>
        <br /><br />
        <h3>History</h3>
        <hr />
        <p class="justified">Oversea Plastic Manufacturing started as a small factory founded by Mr. and Mrs. Hou. At first, the business was only focused on producing plastic sando bags, but later on the company shifted to manufacturing plastic pellets. </p>
        <br />
        <p class="justified">Since then, plastic pellets became the main product of the business. The sando bags business was originally the business of the father of Mrs. Hou. Financial need has caused Mrs. Hou’s father to diversify the business to more than sando bags. </p>
        <br />
        <p class="justified">The sando bags business then was transferred to Mr. and Mrs. Hou, who had difficulty continuing the said business due to liquidity and cash flow issues.</p>
        <br />
        <p class="justified">More so, the margins derived from manufacturing sando bags do not justify the debts carried by the company, not even the daily operating expenses, due to poor product differentiation and intense competition. </p>
        <br />
        <p class="justified">The decision was made then to discontinue sando bags and shift its manufacturing business to plastic pellets, its core business today. With the current market conditions and operational structure, Oversea stands to sustain its operations while being resilient to business cycle fluctuations.</p>
        <br />
        <p class="justified">Continuous improvement and sustainable production helps to differentiate the company from its competitors, achieving competitive advantage. </p>
        <br />
    </div>

    <div class="span6 pull-right borRad5 displayblock">
        <h3>Location</h3>
        <hr />
        <p>The company is located at <b>5 M. Francisco Street, Lingunan, Valenzuela City</b>. (Location Map as shown below)</p>
        <img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/map.jpg" style="height:auto; width:auto/2;"/>
    </div></div></div>
    
    <div class="container">
    <div class="row-fluid">
    <div class="span6 pull-right borRad5 displayblock paddingBoth form-actions" style="height: 230px">
        <hr />
        <h3 class="pull-left">Mission</h3>
        <br /><br />
        <blockquote class="pull-left"><p>We strive ourselves in committing to:</p>
            <br />
            <p><ol>
                <li>Produce high quality plastic pellets;</li>
                <li>Be affordable even to small scale plastic manufacturing firms; </li>
                <li>Adhere to strict environmental and safety standards in our manufacturing to best answer the needs of every household. </li>
            </ol></p>
        </blockquote>
    </div>

    <div class="span6 pull-left borRad5 displayblock paddingBoth form-actions" style="height: 230px">
     <hr />
        <h3 class="pull-right">Vision</h3>
        <br /><br />       
        <blockquote class="pull-right"><p><i>"PRODUCER OF QUALITY PLASTIC PELLETS"</i></p>
        <br /><p>To be the leading producer of high quality recycled plastic pellets in the NCR region in the next 10 years.</p></blockquote>
    </div></div></div></div>

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
        var _gauges = _gauges || [];(function () { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();
    </script>    
  </body>
</html>