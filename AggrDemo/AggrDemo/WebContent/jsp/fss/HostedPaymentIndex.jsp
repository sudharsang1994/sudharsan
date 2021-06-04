<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<!--theme style-->
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!--//theme style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<script src="<%=request.getContextPath()%>/js/simpleCart.min.js"> </script>
<script>
simpleCart.currency( "Rs" ); 
simpleCart.total();
</script>
</head>
<body> 
<!--header-->	
<div class="header-top">
	 <div class="header-bottom">			
			<div class="logo">
				<h1><a href="HostedPaymentIndex.jsp"><img src="<%=request.getContextPath()%>/images/sp-store_logo.png" title="Simply Payment Store"></a></h1>
			</div>
	 </div>
	 
	<!-- <a href="AcceptanceType.jsp" class="a-btn">
                        <span class="a-btn-text">Proceed to payment</span>
                        <span class="a-btn-slide-text">No hidden costs</span>
                        <span class="a-btn-icon-right"><span></span></span>
      </a> -->
	 
	 
     <div class="cart box_1">
          <a href="AcceptanceType.jsp">
               <div class="total">
               <div class="simpleName"></div>
                    <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)
               </div>
               <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
          </a>
          <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
          <div class="clearfix"> </div>
     </div>			
			<div class="clearfix"> </div>
</div>
<!---->	
<div class="slider">
	  <div class="callbacks_container">
			<img src="<%=request.getContextPath()%>/images/rotation-banner.jpg" width="100%" border="0">
	  </div>
  </div>
<!---->

<div class="items">
	 <div class="container">
		 <div class="items-sec">
			 <div class="col-md-4 feature-grid">
                 <div class="col-md-12 simpleCart_shelfItem">
                      <div class="single-para ">
                      		 <img src="<%=request.getContextPath()%>/images/product-images/mobile-product.jpg" alt=""/>	
                             <div class="arrival-info">
                                 <h2 class="item_name">Samsung ON7</h2>
                             </div>
                            <h5 class="item_price">Rs 9000.00</h5>							
                            <a href="#" class="item_add">ADD TO CART</a>							
                     </div>
                 </div>
			 </div>
			 <div class="col-md-4 feature-grid">
				 <div class="col-md-12 simpleCart_shelfItem">
                      <div class="single-para ">
                      		 <img src="<%=request.getContextPath()%>/images/product-images/refrigrator-product.jpg" alt=""/>	
                             <div class="arrival-info">
                                 <h2 class="item_name">Refrigrator</h2>
                             </div>
                            <h5 class="item_price">Rs 20000.00</h5>							
                            <a href="#" class="item_add">ADD TO CART</a>							
                     </div>
                 </div>
			 </div>
			 <div class="col-md-4 feature-grid">
				 <div class="col-md-12 simpleCart_shelfItem">
                      <div class="single-para ">
                      		 <img src="<%=request.getContextPath()%>/images/product-images/sony-tv-product.jpg" alt=""/>	
                             <div class="arrival-info">
                                 <h2 class="item_name">Sony-TV</h2>
                             </div>
                            <h5 class="item_price">Rs 18000.00</h5>							
                            <a href="#" class="item_add">ADD TO CART</a>							
                     </div>
                 </div>
			 </div>
			 
			 <div class="clearfix"></div>
		 </div>
		 <div class="single-para ">
                <div class="button-wrapper-large">	
                    <a href="AcceptanceType.jsp" class="a-btn">
                        <span class="a-btn-text">Proceed to payment</span>
                        <span class="a-btn-slide-text">No hidden costs</span>
                        <span class="a-btn-icon-right"><span></span></span>
                    </a>
                    
                    <a href="MerchAggrRechargeBuy.jsp" class="a-btn">
                        <span class="a-btn-text">Recharge payment</span>
                        <span class="a-btn-slide-text">No hidden costs</span>
                        <span class="a-btn-icon-right"><span></span></span>
                    </a>
                    
                    <a href="MerchantNotification.jsp" class="a-btn">
                        <span class="a-btn-text">Notification payment</span>
                        <span class="a-btn-slide-text">No hidden costs</span>
                        <span class="a-btn-icon-right"><span></span></span>
                    </a>
                </div>					
         </div>
	 </div>
</div>
<div class="copywrite">
	<div class="container">
		 <div class="copy">
			 <p>&copy; 2015 FSS Simply Payment Store. All Rights Reserved </p>
		 </div>
	</div>
</div>
</body>
</html>