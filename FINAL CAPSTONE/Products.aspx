<%@ Page Title="Products" Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" Debug="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://localhost:12345/FINAL%20CAPSTONE/assets/ico/favicon.ico" type="image/ico" />
    <title>Products</title>

    <!-- Le styles -->
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/css/docs.css" rel="stylesheet">
    <link href="http://localhost:12345/FINAL%20CAPSTONE/assets/js/google-code-prettify/prettify.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="http://localhost:12345/FINAL%20CAPSTONE/haccordion.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/haccordion.js"></script>

    <style>
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
    #wrap {min-height: 100%; height: auto !important; height: 100%;/* Negative indent footer by it's height */margin: -60px auto auto auto ;}
    /* Set the fixed height of the footer here */
    #push,#footer {height: 60px;}
    #footer {background-color: #f5f5f5;}
    /* Lastly, apply responsive CSS fixes as necessary */
    @media (max-width: 767px) {
    #footer {margin-left: -20px;margin-right: -20px;padding-left: 20px;padding-right: 20px;}}
    /* Custom page CSS-------------------------------------------------- */
    /* Not required for template or sticky footer method. */
    #wrap > .container {}
    .container .credit {margin: 0 0;padding: 20px;}
    code {font-size: 80%;}
    /*STYLE ACCORDION*/
    #accordion {list-style: none;margin: 30px 0;padding: 0;height: 220px;overflow: hidden;padding-left:275px;}
    #accordion li {float: left;display: block;height: 170px;width: 150px;padding: 15px 0;overflow: hidden;color: #fff;text-decoration: none;font-size: 16px;line-height: 20px;border-left: 1px solid #fff; border-radius: 5px;}
    #accordion li img {border: none;border-right: 1px solid #fff;float: left;margin: -15px 15px 0 0; height:220px;}
    #accordion li.active {width: 320px;}
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
                <li><asp:LinkButton ID="myProfile" runat="server" Text="My Profile" OnClick="myProfile_Click"></asp:LinkButton></li>
                <li><asp:LinkButton ID="lblLoginStatus" runat="server" onclick="lblLoginStatus_Click" CssClass="nodeco"></asp:LinkButton></li>                
                </ul>
          </div>
        </div>
    </div>
    </div>
     

      
<%--<!-- Masthead
================================================== -->
    <header class="jumbotron subhead" id="overview">
      <div class="container">
        <h1>Products</h1>
        <p class="lead">We offer varieties of plastic pellets. Check it out.</p>
      </div>
    </header>--%>
           
    <div class="container">
    <div class="row-fluid">
<div class="span12 width100">

    <ul id="accordion">
        <asp:ListView ID="lvProductClass" runat="server" >
            <ItemTemplate>
                <li><a href="http://localhost:12345/FINAL%20CAPSTONE/Products.aspx?productClassID=<%# Eval("productClassID") %>">
                    <img src="http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/<%# Eval("productClassID") %>.jpg" class="img-rounded"/>
                </a></li>    
            </ItemTemplate>
        </asp:ListView>
    </ul>
    </div>
    </div>
        
           
    <div class="row-fluid">  
        <div class="span3 pull-left borRad5 displayblock height100" id="divCart" runat="server">
        <div class="width100 borRad5 pull-left">
        <h5><i class="icon-shopping-cart"></i> Shopping Cart <span class="badge badge-important pull-right"><asp:Label ID="lblItemCount" runat="server" CssClass="pull-right"></asp:Label></span></h5>
            <hr />
            <asp:GridView ID="grdShoppingCart" runat="server" CssClass="table-condensed borRad5 table-bordered width100" AutoGenerateColumns="False" DataSourceID="dsShoppingCart">
                <Columns>
                    <asp:BoundField DataField="quantity" HeaderText="Qty" SortExpression="quantity" />
                    <asp:ImageField DataImageUrlField="productImage" HeaderText="Image">
                        <ControlStyle Height="50px" Width="50px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" />
                    <asp:BoundField DataField="productClass" HeaderText="Class" SortExpression="productClass" />
                    <asp:BoundField DataField="productSubClass" HeaderText="Type" SortExpression="productSubClass" />
                </Columns>
                <EmptyDataTemplate>
                    <label class="text-center alert alert-info">There&#39;s no items in your Shopping Cart</label> 
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <span class="pull-right"><b><asp:Label ID="lblTQuantity" runat="server"/></b><br />
            <b><asp:Label ID="lblTPrice" runat="server"/></b></span>
            <br /><br /><br />
            <asp:Button ID="btnViewShoppingCart" runat="server" CssClass="btn btn-primary btn-block" Text="View Cart" OnClick="btnViewShoppingCart_Click"/>
            <asp:Button ID="btnCheckout" runat="server" CssClass="btn btn-primary btn-block" Text="Checkout" OnClick="btnCheckout_Click"/>
            <hr />

            <asp:SqlDataSource ID="dsShoppingCart" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" 
                    SelectCommand="SELECT B.productImage, B.productName, C.productClass, D.productSubClass, A.quantity
                    FROM ShoppingCart AS A INNER JOIN 
                    Products AS B ON A.productID = B.productID INNER JOIN
                    ProductClass AS C ON B.productClassID = C.productClassID INNER JOIN
                    ProductSubClass AS D ON B.productSubClassID = D.productSubClassID WHERE A.userID=@userID AND A.cartStatus=@cartStatus">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" />
                    <asp:Parameter DefaultValue="Pending" Name="cartStatus" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div> 
                  
    <div class="span9 pull-right ">
         <ul class="thumbnails width100 column3">
            <asp:ListView ID="lvProducts" runat="server" 
                 onselectedindexchanged="lvProducts_SelectedIndexChanged" >
             <ItemTemplate>
              <li class="span4 table-hover" style="margin: 5px 5px 5px 5px;">
                <div class="thumbnail">
                 <a href="http://localhost:12345/FINAL%20CAPSTONE/ProductInfo.aspx?productID=<%# Eval("productID") %>">
                  <img src="<%# Eval("productImage") %>" style="height:250px; width:368px;" alt="" class="img-rounded" /></a>
                  <div class="caption">
                    <p class="text-center font20 boldFont"><%# Eval("productName") %></p>
                    <p class="text-center"><asp:Label ID="lblProdClassName" runat="server" CssClass="label label-success"><%# Eval("productClassName") %></asp:Label></p>                      
                    <p class="text-center"><asp:Label ID="lblProdSubClassName" runat="server" CssClass="label label-success"><%# Eval("productSubClass") %></asp:Label></p>
                    <p class="text-center"><asp:Label ID="lblProdSerial" runat="server" CssClass="label label-success"><%# Eval("productDescription") %></asp:Label></p>
                    <a href="http://localhost:12345/FINAL%20CAPSTONE/ProductDetails.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right marginBoth">View Details</a>
                    <a href="http://localhost:12345/FINAL%20CAPSTONE/ProductInfo.aspx?productID=<%# Eval("productID") %>" class="btn btn-primary text-center pull-right">Add to Cart</a>
                    <br />
                  </div>
                </div>
              </li>
             </ItemTemplate>
            </asp:ListView>
            </ul>
          </div>                  
        </div>
        </div>
    </div>

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
      
    <script src="http://localhost:12345/FINAL%20CAPSTONE/assets/js/Collapse.js"></script>

    <!-- Analytics
    ================================================== -->

    <script>
        var _gauges = _gauges || []; (function () { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();
    </script>
  </body>
</html>