<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" session="true" %>
<%@ page import="java.text.DecimalFormat" %>

<title>FSS merchant</title>
<link href="<%=request.getContextPath()%>/css/TranPageStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Custom Theme files -->
<!--theme style-->
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
  response.setHeader("Cache-Control", "no-cache");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("max-age", 0);
  response.setDateHeader("Expires", 0);
%>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0);}, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="<%=request.getContextPath()%>/js/simpleCart.min.js"> </script>

<script type="text/javascript">
function hidedetails(value){
	$("#details").hide();
	}

	function showPayPage()
	{
	$("#details").show();
	}
	
	function trandetail(form){
		 if(document.checkout.udf5.value == "trackid"){
			document.getElementById('tran').style.display='none';
			document.getElementById('track').style.display='';
			document.getElementById('text').style.display='';

			}
			else if(document.checkout.udf5.value == "tranid"){
			document.getElementById('tran').style.display='';
			document.getElementById('text').style.display='';
			document.getElementById('track').style.display='none';
			}
			else if(document.checkout.udf5.value == "Select"){
			document.getElementById('tran').style.display='none';
			document.getElementById('text').style.display='none';
			document.getElementById('track').style.display='none';
			}
			}
	
	function Tranbuy()
	{
		if(document.checkout.trantype.value=="tranportal"){
			 document.checkout.method="post";
			 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/Merchaggrnotification.jsp.jsp";
			 document.checkout.submit();	 
		 
		}
		else if(document.checkout.trantype.value=="tranTCPIP")
		{ 
		document.checkout.method="post";
		document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrTranPaymentBuy.jsp";
		document.checkout.submit();		 
		}
		else if(document.checkout.trantype.value=="merchantotp")
		{ 
		document.checkout.method="post";    
		document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchantAggrOtp.jsp";
		document.checkout.submit();		 
		}
		else{		 
			document.checkout.method="post";
			document.checkout.action="<%=request.getContextPath()%>/jsp/fss/Merchaggrnotification.jsp";
			document.checkout.submit();		 
			}
	}
	
	function transactiontype(form){
		
		 if(document.checkout.trantype.value == "hosted"){
			document.getElementById('email').style.display='';
			document.getElementById('mobnum').style.display='';
			document.getElementById('customername').style.display='';
			document.getElementById("expirydate").style.display='';
			/* document.getElementById("cardType").style.display='none';
			 document.getElementById("cust_vpa").style.display='none'; */
			}
	}


</script>

</head>
<body>
<form action="" name="checkout">

<!-- <input type="hidden" name="AMOUNT" id="AMOUNT" /> -->
<!-- header -->
<div class="header-top">
	 <div class="header-bottom">			
        <div class="logo">
            <h1><a href="HostedPaymentIndex.jsp"><img src="<%=request.getContextPath()%>/images/sp-store_logo.png" title="Simply Payment Store"></a></h1>					
        </div>
        <div class="cart box_1">
             <a href="#">
                <div class="total">
                <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div>
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
            </a>
            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
     </div>
	 <div class="clearfix"> </div>
</div>
<!-- check out -->
<div class="container content-area">
	<div class="check-sec">	 
		
			<script>
				$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
					});	  
				});
		    </script>
<div id="details" class="group col-lg-12 cart-items form" style="clear:both;">


<h1><b>Enter Payment Details</b></h1>			
				
						<TABLE width="50%" cellspacing="20" border="0" align="center">
						<tr>
						<td><b>Transaction Type</b></td>
						<td><select class="tBox-medium" name="trantype" id="trantype"    onchange="transactiontype(this.value);">
					
			<option value="hosted">Hosted</option> 
			</select>
		</TD></tr>
			
			<tr id="issuerCodelbl" class="text1" style="display: none;">
		<td><b>Bank ID</b></td>
		<td><input class="tBox-medium" size="20" type="text" name="issuerCode" id="issuerCode" maxlength="11">
</td></tr>
							<TR>
								<TD><b>Action Type</b></TD>
								<TD>
									<select name="action" id="action"  class="tBox-medium" onchange="typeoftransaction(this.value);">
									<option value="1" selected> 1 - Purchase </option> 
									<option value="2"> 2 - Credit  </option> 
						            <option value="3"> 3 - Void Purchase </option> 
							        <option value="4"> 4 - Authorization </option> 
									<option value="5"> 5 - Capture   </option> 
									<option value="6"> 6 - Void Credit </option> 
									<option value="7"> 7 - Void Capture </option> 
									<option value="8"> 8 - Inquiry </option> 
									<option value="9"> 9 - Void Authorization </option> 
									</select>
								</TD>
						    </TR>
						    
						    
							<tr id="email">
								<td width="40%"><b>Email</b></td>
								<td width="30%"> <input type="text" name="email"   id="email"  size="25" value="" placeholder="Test"> </td>
							</tr>
							<tr id="mobnum">
								<td width="40%"><b>MobNumber</b></td>
								<td width="30%"> <input type="text" name="mobnum"  id="mobnum" size="25" value="" placeholder="Test"> </td>
							</tr>
							
							<tr id="expirydate">
								<td width="40%"><b>Expiry Date</b></td>
								<td width="30%"> <input type="text" name="expirydate"  id="expirydate" size="25" value="" placeholder="Test"> </td>
							</tr>
	
							<tr>
								<td width="40%"><b>UDF1</b></td>
								<td width="30%"> <input type="text" name="udf1" size="25" value="" placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF2</b></td>
								<td width="30%"> <input type="text" name="udf2" size="25" value="" placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF3</b></td>
								<td width="30%"> <input type="text" name="udf3" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF4</b></td>
								<td width="30%"> <input type="text" name="udf4" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<TR>
						<TD  class="text1"><b>UDF5</b></TD>
							<TD align="left">
								<select class="tBox-medium" name="udf5" id="udf5" onchange="trandetail(this.value);" >
							<option value="Select">SELECT</option>
							<option value="trackid">Merchant Track ID</option> 
							<option value="tranid">Transaction ID</option>
							</select>
							</TD>
						</TR>
						<tr>
								<td width="40%"><b>UDF6</b></td>
								<td width="30%"> <input type="text" name="udf6" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF7</b></td>
								<td width="30%"> <input type="text" name="udf7" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF8</b></td>
								<td width="30%"> <input type="text" name="udf8" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF9</b></td>
								<td width="30%"> <input type="text" name="udf9" size="25" value=""  placeholder="Test"> </td>
							</tr>
							<tr>
								<td width="40%"><b>UDF10</b></td>
								<td width="30%"> <input type="text" name="udf10" size="25" value=""  placeholder="Test"> </td>
							</tr>

								<TR >
									<TD  id="pymt" class="text1" style="display: none;" ><b>Payment ID</b></TD>
									<TD  id="track" class="text1" style="display: none;" ><b>Merchant Track ID</b></TD>
									<TD  id="tran" class="text1" style="display: none;" ><b>Transaction ID</b></TD>
									<TD  id="text" class="text1" style="display: none;"><input  class="tBox-medium" type="text" name="comment" ></TD>
								</TR>
								
						
						<tr id="cust_vpa" style="display: none;">
						<td><b>Customer VPA</b></td>
						<td><input type="text" name="vpa" id="vpa"  placeholder="Enter Customer VPA"></td>
						</tr>
						
							<tr id = "account_no" style="display: none;">
						<td><b>Account Number</b></td>
						<td><input type="text" name="accountnumber" id="accountnumber" onkeypress="return isNumber(event)" value="" class="only-numeric"  placeholder="Account Number" ></td>
						</tr>
						<tr id="customername">
								<td width="40%"><b>CustomerName</b></td>
								<td width="30%"> <input type="text" name="customername" id="customername" size="25" value="" placeholder="Test"> </td>
							</tr>			
						<tr>
						<td><b>Amount</b></td>
						<td><input type="text" name="AMOUNT" id="AMOUNT" class="tBox-medium" value="1"></td>
						</tr>
						<tr>
						<td><br><br></td>	
						</tr>						
							<TR>
<!-- 								<TD width="100%" colspan="4"><input type="Submit" value="Buy(UAT)" class="button1" onclick="return Tranbuy();" ></TD> -->
							 <TD width="100%" colspan="4"><input type="Submit" value="Buy(UAT)" class="button1" onclick="Tranbuy();" ></TD>
									<TD width="100%" colspan="4"><input type="Submit" value="Buy(Prod)" class="button1" onclick="Tranbuyprod();" ></TD>
								<TD width="100%" colspan="4"><input type="Submit" value="Buy(iFrame)" class="button1" onclick="hostiframe();" ></TD> 
								<!-- <TD width="100%" colspan="4"><input type="Submit" value="FlipKart" class="button1" onclick="FlipKartReq();" ></TD> -->
							</TR>
						</TABLE>    
						</div>	
</div> 
			</div> 			
						<div class="copywrite">
	 <div class="container">
		 <div class="copy">
			 <p>© 2020 FSS ShoppingCart. All Rights Reserved </p>
		 </div>
		
	 </div>
</div>
</form>    
</body>
</html>