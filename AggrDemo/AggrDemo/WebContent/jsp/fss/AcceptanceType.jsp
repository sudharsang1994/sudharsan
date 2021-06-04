<!DOCTYPE html>
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
function typeoftransaction(form){

	if((document.checkout.trantype.value == "tranportal"||document.checkout.trantype.value == "tranTCPIP"||document.checkout.trantype.value =="merchantotp")&&(document.checkout.action.value=="8"||document.checkout.action.value=="2"))
		{
		document.getElementById('cardno').style.display='none';
		document.getElementById('cvv').style.display='none';
		document.getElementById('expyear').style.display='none';
		document.getElementById("cardTypelbl").style.display='none';
		document.getElementById("cardType").style.display='none';
		document.getElementById("otpTypelbl").style.display='none';
		}
	if((document.checkout.trantype.value == "tranportal"||document.checkout.trantype.value == "tranTCPIP"||document.checkout.trantype.value =="merchantotp"&& document.checkout.action.value=="1"))
	{
	document.getElementById('cardno').style.display='';
	document.getElementById('cvv').style.display='';
	document.getElementById('expyear').style.display='';

	}
	
	
	else{
		document.getElementById('cardno').style.display='none';
		document.getElementById('cvv').style.display='none';
		document.getElementById('expyear').style.display='none';
		document.getElementById("cardTypelbl").style.display='none';
		document.getElementById("cardType").style.display='none';
	}
}
{
$("#details").show();
}
function Tranbuy()
{
	if(document.checkout.trantype.value=="tranportal"){
		
		/* var vpa = document.getElementById("vpa").value;
		if(vpa == "" || vpa == null)
			{
			alert("Please Enter VPA");
			return false;
			} */
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostedPaymentBuy.jsp";
		 document.checkout.submit();	 
	 
	}
	if(document.checkout.trantype.value=="tranportal" &&  document.checkout.cardType.value=="UPIINTENT"){
		
		
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrUPIIntentTranPaymentBuy.jsp";
		 document.checkout.submit();	 
	 
	}
	else if(document.checkout.trantype.value=="tranportal" &&  document.checkout.cardType.value=="GPAY")
	{
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrUPIIntentTranPaymentBuy.jsp";
		 document.checkout.submit();	 
	 
	}
	 else if(document.checkout.trantype.value=="tranportal" &&  document.checkout.cardType.value=="UPI")
	{
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrUPITranPaymentBuy.jsp";
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
		document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostedPaymentBuy.jsp";
		document.checkout.submit();		 
		}
}

function Tranbuyprod(){
	if(document.checkout.trantype.value=="tranportal"){
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostedPaymentBuyProd.jsp";
		 document.checkout.submit();	 
	 
	}
	else if(document.checkout.trantype.value=="tranTCPIP")
	{ 
	document.checkout.method="post";
	document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrTranPaymentBuyProd.jsp";
	document.checkout.submit();		 
	}
	else{		 
		document.checkout.method="post";
		document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostedPaymentBuyProd.jsp";
		document.checkout.submit();		 
		}
}
function hostiframe(){
	if(document.checkout.trantype.value=="tranportal"){
		 document.checkout.method="post";
		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostediFramePayBuy.jsp";
		 document.checkout.submit();	 
	 
	}
	else if(document.checkout.trantype.value=="tranTCPIP")
	{ 
	document.checkout.method="post";
	document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrTranPaymentBuyProd.jsp";
	document.checkout.submit();		 
	}
	else{		 
		document.checkout.method="post";
		document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrHostediFramePayBuy.jsp";
		document.checkout.submit();		 
		}
}


function showvisa(){
document.checkout.method="post";
document.checkout.action="<%=request.getContextPath()%>/jsp/fss/Choice.jsp";
document.checkout.submit();

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
function transactiontype(form){
	document.getElementById("cardType").selectedIndex = 0;
	 if(document.checkout.trantype.value == "hosted"){
		document.getElementById('cardno').style.display='none';
		document.getElementById('cvv').style.display='none';
		document.getElementById('expyear').style.display='none';
		document.getElementById("cardTypelbl").style.display='none';
		document.getElementById("cardType").style.display='none';
		 document.getElementById("cust_vpa").style.display='none';
		}
		else if(document.checkout.trantype.value == "tranportal"||document.checkout.trantype.value == "tranTCPIP"){
			document.getElementById("cardTypelbl").style.display='';
			document.getElementById("cardType").style.display='';
			document.getElementById('cardno').style.display='';
			document.getElementById('cvv').style.display='';
			document.getElementById('expyear').style.display='';
			document.getElementById("UPI").disabled = true;
			document.getElementById("cust_vpa").style.display='none';
			document.getElementById("otpTypelbl").style.display='none';
			if(document.checkout.trantype.value == "tranportal")
				document.getElementById("UPI").disabled = false; 
		}
		else if(document.checkout.trantype.value == "merchantotp"){
			document.getElementById("merchantOtpType").style.display='';
			document.getElementById("otpTypelbl").style.display='';
			//document.getElementById("cardTypelbl").style.display='none';
			document.getElementById("cardType").style.display='none';
			document.getElementById("cardTypelbl").style.display='none';
			document.getElementById("UPI").disabled = true; 
			document.getElementById("cust_vpa").style.display='none';
/* 			document.getElementById('cardno').style.display='';
			document.getElementById('cvv').style.display='';
			document.getElementById('expyear').style.display=''; */
			tranPymntInstmntOTP(form);	
		}
		else{
			document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none';
			document.getElementById("cardTypelbl").style.display='none';
			document.getElementById("cardType").style.display='none';
			document.getElementById("cust_vpa").style.display='none';
		}
	 tranPymntInstmnt(form);
		}
		
function tranPymntInstmntOTP(form){
	if(document.checkout.merchantOtpType.value == "DP"){
		
		document.getElementById('cardno').style.display='';
		document.getElementById('cvv').style.display='';
		document.getElementById('expyear').style.display='';
		 document.getElementById('issuerCode').style.display='';
		 document.getElementById('issuerCodelbl').style.display='';
		 document.getElementById("cust_vpa").style.display='none';
		}	
		else if(document.checkout.merchantOtpType.value== "C" || document.checkout.merchantOtpType.value == "D")
		{
			document.getElementById('cardno').style.display='';
			document.getElementById('cvv').style.display='';
			document.getElementById('expyear').style.display='';
			 document.getElementById('issuerCode').style.display='none';
			 document.getElementById('issuerCodelbl').style.display='none';
			 document.getElementById("cust_vpa").style.display='none';
		}	
}		
function tranPymntInstmnt(form){
	 if(document.checkout.cardType.value == "DD"){
		 document.getElementById('issuerCodelbl').style.display='';
		 document.getElementById('issuerCode').style.display='';
		 document.getElementById('account_no').style.display='';
		document.getElementById('cardno').style.display='none';
		document.getElementById('cvv').style.display='none';
		document.getElementById('expyear').style.display='none';
		 document.getElementById("cust_vpa").style.display='none';
		}
		else if(document.checkout.cardType.value == "C" || document.checkout.cardType.value == "D")
		{
			document.getElementById('cardno').style.display='';
			document.getElementById('cvv').style.display='';
			document.getElementById('expyear').style.display='';
			 document.getElementById('issuerCode').style.display='none';
			 document.getElementById('issuerCodelbl').style.display='none';
			 document.getElementById("cust_vpa").style.display='none';
			 document.getElementById("account_no").style.display='none';
		}
		else if(document.checkout.cardType.value == "DP")
		{
			document.getElementById('cardno').style.display='';
			document.getElementById('cvv').style.display='';
			document.getElementById('expyear').style.display='';
			 document.getElementById('issuerCode').style.display='';
			 document.getElementById('issuerCodelbl').style.display='';
			 document.getElementById("cust_vpa").style.display='none';
			 document.getElementById("account_no").style.display='none';
		}
		else if(document.checkout.cardType.value == "W")
		{
			document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none';
			 document.getElementById('issuerCode').style.display='';
			 document.getElementById('issuerCodelbl').style.display='';
			 document.getElementById("cust_vpa").style.display='none';
			 document.getElementById("account_no").style.display='none';

		}
		else if(document.checkout.cardType.value == "UPI")
		{
			document.getElementById("cust_vpa").style.display='';
			document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none';
			document.getElementById('account_no').style.display='none';
			document.getElementById('issuerCode').style.display='none';
			document.getElementById('issuerCodelbl').style.display='none';
		}
		else if(document.checkout.cardType.value == "UPIQR")
		{
			document.getElementById("cust_vpa").style.display='none';
			document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none';
			document.getElementById('account_no').style.display='none';
			document.getElementById('issuerCode').style.display='none';
			document.getElementById('issuerCodelbl').style.display='none';
		}
		else if(document.checkout.cardType.value == "EMI")
		{
			document.getElementById("cust_vpa").style.display='none';
			/* document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none'; */
			document.getElementById('account_no').style.display='none';
			/* document.getElementById('issuerCode').style.display='none';
			document.getElementById('issuerCodelbl').style.display='none'; */
		}
		else if(document.checkout.cardType.value == "BQR")
		{
			document.getElementById("cust_vpa").style.display='none';
			/* document.getElementById('cardno').style.display='none';
			document.getElementById('cvv').style.display='none';
			document.getElementById('expyear').style.display='none'; */
			document.getElementById('account_no').style.display='none';
			/* document.getElementById('issuerCode').style.display='none';
			document.getElementById('issuerCodelbl').style.display='none'; */
		}
		}
		
</script>
	<script type="text/javascript">

	//FOR ACCT NUMBER
	function isNumber(evt) {
evt = (evt) ? evt : window.event;
var charCode = (evt.which) ? evt.which : evt.keyCode;
if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    return false;
}
return true;
}
	</script>
<script>
simpleCart.ready(function(){
//$("#details").hide();
    var total = simpleCart.total(); 
    $("#AMOUNT").val(total); 
});
$(document).ready(function(){
	var PageHeight = $(window).height();
	//alert(PageHeight);
	var HeaderHeight = $(".header-top").height();
	//alert(HeaderHeight);
	var FooterHeight = $(".copywrite").height();
	//alert(FooterHeight);
	var ContentAreaHeight = PageHeight - (HeaderHeight+FooterHeight);
	//alert(ContentAreaHeight);
	$(".content-area").css("min-height",ContentAreaHeight-28);
});
</script>

    <%
		String instituteId = request.getParameter("InstituteID");
		String amt = request.getParameter("AMOUNT");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String postalCd = "1";
		System.out.println(" amount:::"+amt);
		System.out.println(" postalCd:::"+postalCd);
		System.out.println(" instituteId::::;"+instituteId);
	%>
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
		<!-- div class="col-md-12 cart-total">
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<< Continue Shopping</a>
			<ul class="total_price col-md-8">
			   <li class="last_price"><div class="text-center">TOTAL<span class="simpleCart_total"></span></div></li>			   
			</ul> 
			
		</div> -->
		<!-- <div class="col-md-12 cart-items"> -->
			<!-- <h1>Card Credentials - Acceptance</h1> -->
			<script>
				$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
					});	  
				});
		    </script>
        <!-- </div> -->
		<div class="clearfix"> </div>
        
         <!--  <div id="features-gateways-visual" class="left">
			<ul id="gatewayDemoList">
            	<li id="featureAmazon" >
					<label for="feature-amazon" class=""><strong>fss pay</strong><input type="radio" name="gateway" id="feature-amazon" value="F" onclick="showPayPage();"></label>
				</li>
				<li id="featurePaypal" onclick="javascript:showPayPage();">
					<label for="feature-paypal" class=""><strong>Paypal</strong><input type="radio" name="gateway" id="feature-paypal" value="V" onclick="showPayPage();"></label>
				</li>
				li id="featureGoogle">
					<label for="feature-google" class=""><strong>Google Checkout</strong><input type="radio" name="gateway" id="feature-google" value="M"></label>
				</li
				
				<li id="featureEmail">
					<label><strong>Email</strong></label>
				</li>
			</ul> -->
			
		
       <!-- <div class="cart-header">
         
            <div class="close1"> </div>
            <div class="cart-sec simpleCart_shelfItem">
         		
         
               <div class="cart-item cyc">
                    <img src="images/p4.jpg" class="img-responsive" alt=""/>
               </div>
               <div class="cart-item-info">
               		
                    
                    
                    
                    <h3><a href="single.html">Rock Light Emergency Lights</a><span>Model No: RL-5511S</span></h3>
                    <ul class="qty">
                        <li><p>Size : 5</p></li>
                        <li><p>Qty : 1</p></li>
                    </ul>
                    <div class="delivery">
                         <span>Delivered in 2-3 bussiness days</span>
                         <div class="clearfix"></div>
                    </div>								
               </div>
               <div class="clearfix"></div>
            </div>
        </div>
		<div class="clearfix"> </div>-->
	
<!--  </div>    -->
</div>


<!-- <div  style="text-align:center">
					<table  cellspacing="10" align="center" border="10">
						<tr bgcolor="Red">
							<td bgcolor="green" >
								<input type="Submit" value="Buy(UAT)" onclick="Tranbuy();">
							</td>
						</tr>
					</table>
		</div> -->



<div id="details" class="group col-lg-12 cart-items form" style="clear:both;">


<h1><b>Enter Payment Details</b></h1>			
				
						<TABLE width="50%" cellspacing="20" border="0" align="center">
						<tr>
						<td><b>Transaction Type</b></td>
						<td><select class="tBox-medium" name="trantype" id="trantype"    onchange="transactiontype(this.value);">
					
			<option value="hosted">Hosted</option> 
			<option value="tranportal">Tranportal</option> 
			<option value="tranTCPIP">Tranportal TCPIP</option>
			<option value="merchantotp">Merchant OTP</option>
			<!-- <option value="tranportal">Tranportal</option> -->
			</select>
		</TD></tr>
			<tr id="cardTypelbl" class="text1" style="display: none;">
		<td><b>Card Type</b></td>
		<td><select class="tBox-medium" name="cardType" id="cardType" onchange="tranPymntInstmnt(this.value);" >
		<option value="" selected>-select-</option> 
			<option value="C">Credit Card</option> 
			<option value="D">Debit Card</option>
			<option value="DP">Debit Card + PIN</option>
			<option Value="DD">InterNet Banking</option>
			<option value="W">Wallet</option>
			<option value="UPI" id="UPI">UPI</option>
			<option value="UPIINTENT" id="UPIINTENT">UPIIntent</option>
			<option value="UPIQR" id="UPIQR">UPIQR</option>
			<option value="EMI" id="EMI">EMI</option>
			<option value="BQR" id="BQR">Bharat QR</option>
			<option value="GPAY" id="GPAY">GOOGLE PAY</option>
			</select></td></tr>
			
			<tr id="otpTypelbl" class="text1" style="display: none;">
				<td><b>Card Type</b></td>
			<td><select class="tBox-medium" name="merchantOtpType" id="merchantOtpType" onchange="tranPymntInstmntOTP(this.value);" >
			<option value="" selected>-Select-</option>
			<option value="C">Credit Card</option>
			<option value="D" >Debit Card</option>
			<option value="DP">Debit Card + PIN</option>
			</select></td></tr>
			<tr id="issuerCodelbl" class="text1" style="display: none;">
		<td><b>Bank ID</b></td>
		<td><input class="tBox-medium" size="20" type="text" name="issuerCode" id="issuerCode" maxlength="11">
<!-- 		<select class="tBox-medium" name="issuerCode" id="issuerCode" >
							<option value="">-Select-</option> 
							<option value="11101370">FSSNET CANARA</option> 
							<option value="11101372">FSSNET UBI</option>
							<option Value="11101371">FSSNET IOB</option>
							<option value="0411">Axis Direct</option>
							<option value="1007">HDFC Bank</option>
                            <option value="1004">Axis Bank(EBS)</option>
                            <option value="1032">State Bank of India</option>
                            <option value="1016">ICICI Bank</option>
                            <option value="1378">Andhra Bank</option>
                            <option value="1229">Bank of Maharashtra</option>
                            <option value="1224">Canara Bank</option>
                            <option value="1272">Catholic Syrian Bank</option>
                            <option value="1147">Central Bank Account</option>
                            <option value="1135">Corporation Bank Account</option>
                            <option value="1273">Dhanalakshmi Bank</option>
                            <option value="1029">Federal Bank Account</option>
                            <option value="1320">Punjab National Bank</option>
                            <option value="1143">Indian Bank Account</option>
                            <option value="1213">Indian Overseas Bank</option>
                            <option value="1431">IndusInd Bank</option>
                            <option value="1015">JK Bank Account [Retail]</option>
                            <option value="1133">Karnataka Bank Account</option>
                            <option value="1148">Kotak Bank Account</option>
                            <option value="1433">Lakshmi Vilas Bank</option>
                            <option value="1154">Oriental Bank of Commerce Account</option>
                            <option value="1381">PNB NetBanking PNB Net Banking [Retail]</option>
                            <option value="1421">PSB Netbanking PSB Netbanking</option>
                            <option value="1380">Saraswat Bank</option>
                            <option value="1439">Tamilnad Mercantile</option>
                            <option value="1383">UCO Netbanking</option>
                            <option value="1216">Union Bank of India</option>
                            <option value="1212">United Bank Of India</option>
                            <option value="1379">Vijaya Bank [Retail]</option>
                            <option value="1146">Yes Bank Account</option>11101381
                            <option value="3311">IOB DP</option>
                            <option value="109">ICICI DP</option>
			</select> --></td></tr>
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
						   <TR  id="cardno" class="text1" style="display: none;" >
		<TD ><b>Card Number</b></TD>
		<TD><input id="cardno" class="tBox-medium" size="20" type="text" name="pan" id="pan" maxlength="19"></TD>
	</TR>

	<TR  id="cvv" class="text1" style="display: none;">
		<TD class="text1"><b>CVV</b></TD>
		<TD><input size="3" class="tBox-medium" type="text" name="cvv" id="cvv" maxlength=3></TD>
	</TR> 


	<TR  id="expyear" class="text1" style="display: none;">
		<TD class="text1"><b>Expiry Month &amp; Year</b></TD>
		<TD class="ex-month">
			<!-- <input class="combo-medium" type="text" name="expmm" id="expmm"> -->
			<select style="width:75px;" name="expmm" id="expmm" >
			
			<option value="" selected >select</option> 
			<option value="01">01</option> 
			<option value="02">02</option> 
			<option value="03">03</option> 
			<option value="04">04</option> 
			<option value="05">05</option> 
			<option value="06">06</option> 
			<option value="07">07</option> 
			<option value="08">08</option> 
			<option value="09">09</option> 
			<option value="10">10</option> 
			<option value="11">11</option> 
			<option value="12">12</option> 
			</select></td>
			
			<!-- <input class="combo-medium" type="text" name="expyy" id="expyy"> -->
			<TD class="ex-year">
			<select style="width:100px;" name="expyy" id="expyy" >
			<option value="">select</option> 
			<option value="2017">2017</option> 
			<option value="2018">2018</option> 
			<option value="2019">2019</option> 
			<option value="2020">2020</option> 
			<option value="2021">2021</option> 
			<option value="2022">2022</option>
			<option value="2023">2023</option>
			<option value="2024">2024</option>
			<option value="2025">2025</option>
			<option value="2026">2026</option>
			<option value="2027">2027</option>
			<option value="2028">2028</option>
			<option value="2029">2029</option>
			<option value="2030">2030</option>
			<option value="2031">2031</option>
			<option value="2032">2032</option>
			<option value="2033">2033</option>
			<option value="2034">2034</option>
			<option value="2035">2035</option>
			
			</select>
		</TD></tr>
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
								<tr>
						<td><b>Cardholder Name</b></td>
						<td><input type="text" name="name"  value="" placeholder="Enter Cardholder Name" ></td>
						</tr>
						
						<tr id="cust_vpa" style="display: none;">
						<td><b>Customer VPA</b></td>
						<td><input type="text" name="vpa" id="vpa"  placeholder="Enter Customer VPA"></td>
						</tr>
						
							<tr id = "account_no" style="display: none;">
						<td><b>Account Number</b></td>
						<td><input type="text" name="accountnumber" id="accountnumber" onkeypress="return isNumber(event)" value="" class="only-numeric"  placeholder="Account Number" ></td>
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
							</TR>
						</TABLE>
<!--<div class="col-lg-3">

	 div class="col-lg-12">
		<label class="col-lg-6" >Card Type</label>
		<div class="sky_form1 col-lg-6">
			<ul>
				<li><label class="radio left"><input type="radio" name="radio" checked="checked" id="type" value="C"><i></i>Credit</label></li>
				<li><label class="radio"><input type="radio" name="radio" id="type" value="D"><i></i>Debit</label></li>								
			</ul>
			<div class="clearfix"></div>
		</div>	
		
	</div 
	
	
	<div class="col-lg-12">
		<label class="col-lg-12" >Action Type</label>
		<div class="col-lg-12">
			<select name="action" id="action" class="full-width" onchange="typeoftransaction(this.value);">
				<option value="1"> 1 - Purchase </option> 
				<option value="2"> 2 - Credit  </option> 
            	<option value="3"> 3 - Void Purchase </option> 
	        	<option value="4"> 4 - Authorization </option> 
				<option value="5"> 5 - Capture   </option> 
				<option value="6"> 6 - Void Credit </option> 
				<option value="7"> 7 - Void Capture </option> 
				<option value="8"> 8 - Inquiry </option> 
				<option value="9"> 9 - Void Authorization </option> 
			</select>
		</div>
    </div>

   <!-- <div class="col-lg-12">
		<label class="col-lg-12">Card Number</label>
		<div  class="col-lg-12" id="cardnumb">
			<input size="20" type="text" name="pan" class="tBox-medium"  id="pan" value="4000000000000009" >
		</div>
	</div>

	<div class="col-lg-12" style="display: inline-block;">
		<label class="cvv-col">CVV</label>
		<label class="ex-month">Expiry Month</label>
		<label class="ex-year">Expiry Year</label>

		<span class="cvv-col">
			<input size="20" type="text" name="cvv" id="cvv" maxlength=4 value="123" style="width:50px;">
		</span>
		<span class="ex-month">
			<select style="width:75px;" name="expmm" id="expmm">
				<option value="">SELECT</option>
				<option value="1">1</option> 
				<option value="2">2</option> 
				<option value="3">3</option> 
				<option value="4">4</option> 
				<option value="5">5</option> 
				<option value="6">6</option> 
				<option value="7">7</option> 
				<option value="8">8</option> 
				<option value="9">9</option> 
				<option value="10">10</option> 
				<option value="11">11</option> 
				<option value="12" selected>12</option> 
			</select>
		</span>
		<span class="ex-year">	
			<select style="width:100px;"  name="expyy"  id="expyy">
			<option value="">SELECT</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015" selected >2015</option>
			</select>
		</span>
	</div>
		<div class="col-lg-12">
		<label class="col-lg-12" >Cardholder's Name</label>
		<div class="col-lg-12"><input size="20" type="text" name="name" class="tBox-medium" id="name" value="Test"></div>
		</div> 
		<div class="col-lg-12">
		<label class="col-lg-12" >UDF1</label>
		<div class="col-lg-12"><input type="text" name="udf1" size="25" value="Test"> </div>
		</div>
		<div class="col-lg-12">
		<label class="col-lg-12" >UDF2</label>
		<div class="col-lg-12"><input type="text" name="udf2" size="25" value="Test"> </div>
		</div>
		<div class="col-lg-12">
		<label class="col-lg-12" >UDF3</label>
		<div class="col-lg-12"><input type="text" name="udf3" size="25" value="Test"> </div>
		</div>
		<div class="col-lg-12">
		<label class="col-lg-12" >UDF4</label>
		<div class="col-lg-12"><input type="text" name="udf4" size="25" value="Test"> </div>
		</div>
		
		<div class="col-lg-12">
		<label class="col-lg-12" >UDF5</label>		
		<div class="col-lg-12"><select class="tBox-medium" name="udf5" onchange="trandetail(this.value);" >
							<option value="Select">SELECT</option>
							<option value="TrackID">Merchant Track ID</option> 
							<option value="tranid">Transaction ID</option>
							</select></div></div>
									<div class="col-lg-12">
									<label class="col-lg-12" id="pymt" style="display: none;" >Payment ID</label>
									<label class="col-lg-12" id="track" style="display: none;" >Merchant Track ID</label>
									<label class="col-lg-12" id="tran" style="display: none;" >Transaction ID</label>
									<div class="col-lg-12" id="text" style="display: none;"><input  class="tBox-medium" type="text" name="comment" ></div>
									</div>-->
						
		<%-- <div class="col-lg-12">
		<label class="col-lg-12" >Amount</label>
		<div class="col-lg-12"><input type="text" name="amount" class="tBox-medium" value="<%= amt %>" ></div>
		</div>
		
		
		<div class="col-lg-12" align="center">
			<input type="Submit" value="Buy" class="button1" onclick="Tranbuy();" >
		</div>	
	</div>
</div>	--%>
    
</div>	
</div> 
    <!-- a href="#" onclick="javascript:showPayPage();" id="features-gateway-checkout"></a-->

<div class="copywrite">
	 <div class="container">
		 <div class="copy">
			 <p>© 2021 FSS ShoppingCart. All Rights Reserved </p>
		 </div>
		
	 </div>
</div>
<input type=hidden name=InstituteID value="<%= instituteId %>" >
<!--<input type=hidden name=action value="1" > -->
<input type=hidden name=currcd value="356" >
<input type=hidden name="addr1"  value="<%=addr1%>">
<input type=hidden name="addr2"  value="<%=addr2%>">
<input type=hidden name="addr3"  value="<%=addr3%>">
<input type=hidden name="city"  value="<%=city%>">
<input type=hidden name="state"  value="<%=state%>">
<input type=hidden name="country"  value="<%=country%>">
<input type=hidden name="postalcd"  value="<%=postalCd%>">
<input type=hidden name="count">


</form>
</body>
