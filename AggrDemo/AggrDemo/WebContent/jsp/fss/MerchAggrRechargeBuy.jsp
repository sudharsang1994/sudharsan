
<%@page import="com.fss.plugin.*"%>

<%@ page import="java.io.*"%>


<!DOCTYPE html>

<html>


<head>

<style>

.button {

	background-color: #4CAF50;

	border: none;

	color: white;

	padding: 15px 32px;

	text-align: center;

	text-decoration: none;

	display: inline-block;

	font-size: 16px;

	margin: 4px 2px;

	cursor: pointer;

}


.button2 {

	background-color: #008CBA;

}

</style>

<%@ page language="java" session="true"%>

<%@ page import="java.text.DecimalFormat"%>


<title>FSS merchant</title>

<link href="<%=request.getContextPath()%>/css/TranPageStyle.css"

	rel="stylesheet" type="text/css" media="all" />

<link href="<%=request.getContextPath()%>/css/bootstrap.css"

	rel="stylesheet" type="text/css" media="all" />

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->


<!-- Custom Theme files -->

<!--theme style-->

<link href="<%=request.getContextPath()%>/css/style.css"

	rel="stylesheet" type="text/css" media="all" />

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

<script type="application/x-javascript">

	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0);}, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>

<script src="<%=request.getContextPath()%>/js/simpleCart.min.js"> </script>


<script type="text/javascript">


function hideForm()

{

	

	 document.getElementById("DTHDetails").style.display = 'none';//to hide both DTH 

	 document.getElementById("mobileDetails").style.display = 'none';// to hide mobile

	 document.getElementById("DTH").style.color = ""; 

	 document.getElementById("Mobile").style.color = ""; 

}

function Rechargemode(mode){

	

	 if(mode=="Mobile"){

		
		 document.getElementById("Mobile").style.color = "block"; 

		 document.getElementById("DTH").style.color = "";                        

		 document.getElementById("mobileDetails").style.display = 'block';//show only mobile

		 document.getElementById("DTHDetails").style.display = 'none';

		 document.getElementById("transactionIdname").style.display = 'none';//block

		 document.getElementById("transactionId").style.display = 'none';//block

		 document.getElementById("idselectedname").style.display ='none';// block
		 
		 document.getElementById("idselected").style.display ='none';// block
		 

	 }

	 else if(mode=="DTH") {

		

			document.getElementById("DTHDetails").style.display = 'block';//show

			 document.getElementById("mobileDetails").style.display = 'none';

			 document.getElementById("Mobile").style.color = ""; 

			   document.getElementById("DTH").style.color = "black"; 
			   
			   document.getElementById("DtransactionIdname").style.display = 'none';//block

				 document.getElementById("DtransactionId").style.display = 'none';//block

				 document.getElementById("Didselectedname").style.display ='none';// block
				 
				 document.getElementById("Didselected").style.display ='none';// block

			 
		}

		 

}

 function  hideAmount(typeofRequest){

	//alert(typeofRequest);
	 if(typeofRequest=="R"){

		 document.getElementById("BANKCODE").style.display = '';//show bank code

		 document.getElementById("bankcodename").style.display = '';//block bankcodename

		 document.getElementById("transactionIdname").style.display = 'none';//block

		 document.getElementById("transactionId").style.display = 'none';//block

	 }

	 if(typeofRequest=="IR"){

		
		 document.getElementById("BANKCODE").style.display = 'none';//block bank code

		 document.getElementById("bankcodename").style.display = 'none';//block bankcodename
		  
		 document.getElementById("Operator").style.display = 'none';//block operator
		 
		 document.getElementById("operatorname").style.display = 'none';//block operatorname

		 document.getElementById("Circle Code").style.display = 'none';//block circle code
		 
		 document.getElementById("circlename").style.display = 'none';
		     
		 document.getElementById("rechargeType").style.display = 'none';//block recharge type
		 
		 document.getElementById("planname").style.display = 'none';
		 
		 document.getElementById("Operator").value=" ";//make value null
		  
		 document.getElementById("Circle Code").value=" ";//make value null
		
		 document.getElementById("rechargeType").value=" ";//make value null
		
		 document.getElementById("idselectedname").style.display ='block';// block
		 
		 document.getElementById("idselected").style.display ='block';// block
		 
	 }

if(typeofRequest=="VR"){

		document.getElementById("transactionIdname").style.display ='none';//block

		 document.getElementById("transactionId").style.display ='none';//

	 }

if(typeofRequest=="B"){

	 document.getElementById("amountname").style.display ='none';//block 

	 document.getElementById("Amount").style.display ='none';// block

 }
if(typeofRequest=="transid"){

	document.getElementById("transactionIdname").style.display = 'block';//show transction id

	 document.getElementById("transactionId").style.display = 'block';//show transction id
	
	 document.getElementById("idselectedname").style.display ='none';// block
	 
	 document.getElementById("idselected").style.display ='none';// block
	 
	 document.getElementById("UDF5").value="transid";
	 
}
if(typeofRequest=="trackid"){

	 document.getElementById("UDF5").value="trackid";
	 
     document.getElementById("idselectedname").style.display ='none';// block
	 
	 document.getElementById("idselected").style.display ='none';// block
	 
	 document.getElementById("UDF5").value="trackid";
	 
	document.getElementById("transactionIdname").style.display = 'block';//show transction id

	 document.getElementById("transactionId").style.display = 'block';//show transction id

}

 }
 function  hideDAmount(typeofRequest){
	//alert("typeofRequest")
	 
	 if(typeofRequest=="R"){

		 document.getElementById("DBANKCODE").style.display = '';//block bank code

		 document.getElementById("Dbankcodename").style.display = '';//block bankcodename

		 document.getElementById("DtransactionIdname").style.display = 'none';//block

		 document.getElementById("DtransactionId").style.display = 'none';//block

	 }

	 if(typeofRequest=="IR"){

		 document.getElementById("DBANKCODE").style.display = 'none';//block bank code

		 document.getElementById("Dbankcodename").style.display = 'none';//block bankcodename

	      document.getElementById("DTHOperator").style.display = 'none';//block operator
		 
		 document.getElementById("doperatorname").style.display = 'none';//block operatorname
     
		 document.getElementById("DTHplanType").style.display = 'none';//block recharge type
		 
		 document.getElementById("dplanname").style.display = 'none';
		 
		 document.getElementById("Didselectedname").style.display = 'block';//

		 document.getElementById("Didselected").style.display = 'block';//
 		document.getElementById("DTHCircle Code").style.display = 'none';//block circle code
		 
		 document.getElementById("dcirclename").style.display = 'none';
		 document.getElementById("DTHCircle Code").value=" ";//make value null
		 
		 
	 }

if(typeofRequest=="VR"){

		document.getElementById("DtransactionIdname").style.display ='none';//block

		 document.getElementById("DtransactionId").style.display ='none';//

	 }

if(typeofRequest=="B"){

	 document.getElementById("Damountname").style.display ='none';//block 

	 document.getElementById("DAmount").style.display ='none';// block

 }
if(typeofRequest=="transid"){

	document.getElementById("DtransactionIdname").style.display = 'block';//show transction id

	 document.getElementById("DtransactionId").style.display = 'block';//show transction id
	
	 document.getElementById("Didselectedname").style.display ='none';// block
	 
	 document.getElementById("Didselected").style.display ='none';// block
	 
	 document.getElementById("DUDF5").value="transid";
	 
}
if(typeofRequest=="trackid"){

	 document.getElementById("DUDF5").value="trackid";
	 
     document.getElementById("Didselectedname").style.display ='none';// block
	 
	 document.getElementById("Didselected").style.display ='none';// block
	  
	document.getElementById("DtransactionIdname").style.display = 'block';//show transction id

	 document.getElementById("DtransactionId").style.display = 'block';//show transction id

}
 
 
 
 

 }
 

  function  validateMobile(){

	  
 if (/(6|7|8|9)\d{9}/.test(document.getElementById("Mobile Number").value)) {

		    return true;

		    } 

	 else {
		     document.getElementById("Mobile Number").value="";

		     return false

		 }

 }

 

 function validateDTH(){
	 if (/(1|2|3|6|7|8|9)\d{9}/.test(document.getElementById("DTH Number").value)) {
			   
		 return true;

			    } 

		 else {
			     document.getElementById("DTH Number").value="";
			     return false
			 }
	 }

 

 function collectDetails(){
	 
	
	 if(document.getElementById("actiontype").value==""){
		
		alert("plese select type");
		
		return false;
	}
	
	if( document.getElementById("Mobile Number").value==""){
		
		alert("plese enter mobile number");
		return false;

	  }
	
	       document.getElementById("mode").value="mobile";

			 document.checkout.method="post";

			 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrRecharge.jsp";
			 
		}

  function collectDetailsDTH(){
	  
		if( document.getElementById("DTH Number").value==""){
			
			alert(" enter valid DTH number")
			return false;
		}
		
		if( document.getElementById("Dactiontype").value==""){
		
			return false;
		} 
		 document.getElementById("mode").value="DTH";
		
		 document.checkout.method="post";

		 document.checkout.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrRecharge.jsp";
		
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

	

	var HeaderHeight = $(".header-top").height();

	//alert(HeaderHeight);

	var FooterHeight = $(".copywrite").height();

	//alert(FooterHeight);

	var ContentAreaHeight = PageHeight - (HeaderHeight+FooterHeight);

	//alert(ContentAreaHeight);

	$(".content-area").css("min-height",ContentAreaHeight-28);

});

</script>



</head>

 <body onpageshow="hideForm();"> 

  <body onload="javascript:validateRequestMethod()">

 <div class="header-top">

			<div class="header-bottom">

				<div class="logo">

					<h1>

						<a href="HostedPaymentIndex.jsp"><img

							src="<%=request.getContextPath()%>/images/sp-store_logo.png"

							title="Simply Payment Store"></a>

					</h1>

				</div>

				<div class="cart box_1">

					<a href="#">

						<div class="total">

							<span class="simpleCart_total"></span> (<span

								id="simpleCart_quantity" class="simpleCart_quantity"></span>)

						</div> <span class="glyphicon glyphicon-shopping-cart"

						aria-hidden="true"></span>

					</a>

					<p>

						<a href="javascript:;" class="simpleCart_empty">Empty Cart</a>

					</p>

					<div class="clearfix"></div>

				</div>

				<div class="clearfix"></div>

			</div>

			<div class="clearfix"></div>

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


				<div class="clearfix"></div>

			</div>

 

 

	<form action="" name="checkout" id="recharge">

	

    <!-- <input type="hidden"  id="dropmode" name="dropmode" value="" > -->

    
			<div class="right-div">

				<h2>

					<b>Enter Recharge Details</b>

				</h2>

			</div>

			<br> </br>

			

			<div  id="Choosetype" name="choosetype"    class="center-right">

				<button type="button" class="button" bgcolor="white" name="Mobile"

					id="Mobile" value="Mobile" onclick="Rechargemode(this.value);">Mobile</button>


				<button type="button" class="button" bgcolor="lightgrey" name="DTH"

					id="DTH" value="DTH" onclick="Rechargemode(this.value);">DTH</button>


			</div>

			<div id="mobileDetails" value="mobileDetails"

				class="group col-lg-12 cart-items form"

				style="background-color: white" style="clear: both;">

				<TABLE width="50%" cellspacing="20" border="0" align="left">

         
						<TR>

						<TD class="text1"><b>Type</b></TD>

						<TD align="left"><select class="tBox-medium"

							name="actiontype" id="actiontype" value=""

							onchange="hideAmount(this.value);">

                                     <option >Select</option>

								<option value="VR" select>Validate Request</option>

								<option value="B" select>Browse Plan </option>

								<option value="IR" select>Inquiry</option>

								<option value="R" select>recharge</option>

						</select></TD>						

					</tr>
				
					<tr>
						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>
					</tr>
							
	
		
					<TR>
						<td width="40%"><b>Mobile Number</b></td>

						<td width="30%"><input type="text" id="Mobile Number"

							name="Mobile Number" value=""

							onchange="validateMobile(this.value);"></td>
					</tr>

					<TR>

					    <input type="hidden"  id="mode" name="mode" value="mobile">

				   <TR>


					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

					<TR>

						<TD width="40%" id="operatorname" name="operatorname"><b>operator Type</b></TD>

						<TD><select name="Operator"  type="text"   id="Operator"  value=""  class="tBox-medium">

								

								<option >Select</option>

								<option value="1">Vodafone</option>

								<option value="2">AIRTEL</option>

								<option value="3">IDEA</option>

								<option value="5">BSNL</option>

								<option value="6">DOCOMO</option>

								<option value="7">MTS</option>

								<option value="10">JIO</option>

								<option value="12">TELENOR</option>

								<option value="13">MTNL</option>
								
								<option value="25">BSNL SPL</option>
								
								<option value="252">VodafoneIdea Ltd.</option>

						</select></TD>
					</TR>



					<tr>
						<td width="40%"><b></b></td>
						<td width="30%"> <font color="white">This is some text!</font> </td>
					</tr>


					<TR>
					<TD width="40%" id="circlename" name="circlename" ><b>Circle Codes</b></TD>
					<TD align="left"><select  id="Circle Code" 
					name="Circle Code"  value=""  type="text" >
					
					
						<option >Select</option>

							<option value="2">CHENNAI</option>

							<option value="1">ANDHRA PRADESH</option>

							<option value="3">DELHI</option>

							<option value="4">GUJRAT</option>

							<option value="5">HARYANA</option>

							<option value="6">KARNATAKA</option>

							<option value="7">KERALA</option>

							<option value="8">KOLKATA</option>

							<option value="9">MAHARASHTRA & GOA</option>

							<option value="10">MUMBAI</option>

							<option value="11">PUNJAB</option>

							<option value="12">RAJASTHAN</option>

							<option value="13">WEST BENGAL</option>

							<option value="14">TAMILNADU</option>

							<option value="15">UP EAST</option>

							<option value="16">UP WEST</option>

							<option value="17">HIMACHAL PRADESH</option>

							<option value="18">MADHYA PRADESH</option>

							<option value="19">ASSAM</option>

							<option value="20">BIHAR</option>

							<option value="21">JAMMU KASHMIR</option>

							<option value="22">NORTH EAST</option>

							<option value="23">ORISSA</option>

							<option value="51">UNKNOWN</option>
					</select></TD>

					</TR>


					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>



					<TR>

						<TD width="40%" id="planname" name="planname" ><b>Plan type</b></TD>

						<TD align="left"><select 

					 type="text" name="rechargeType"  id="rechargeType"  value=""  >

								<option >Select</option>

								<option value="top">Get Top Up options</option>

								<option value="full">Get Full Talktime offers</option>

								<option value="SMS">Get SMS recharge Plans</option>

								<option value="2g">List of 2G offers</option>

								<option value="3g">List of 3G offers</option>

								<option value="Local">Local offers</option>

								<option value="STD">STD related offers</option>

								<option value="ISD">International calling offers</option>

								<option value="Roaming">Roaming offers</option>

								<option value="Other">Other Recharge Plans</option>

								<option value="Validity">Validity extension offers</option>

								<option value="Plan ">Plan extension offers</option>
								
								<option value="spl ">special  offers</option>


						</select></TD>

					</TR>

				
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>
					
						<tr>

						<td width="40%"><b>UDF 1</b></td>

						<td width="30%"><input type="text" id="UDF1" name="UDF1"  value="" ></td>

							</tr>

					
					<tr>
						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>


					<TR>

						<td width="40%"><b>UDF 2</b></td>

						<td width="30%"><input type="text" id="UDF2" name="UDF2"  value=""></td>

					</TR>

					
	
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>


					<TR>

						<td width="40%"><b>UDF 3</b></td>

						<td width="30%"><input type="text" id="UDF3" name="UDF3"  value=""></td>
					</TR>

					

					

					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

					

		
					<TR>

						<td width="40%"><b>UDF 4</b></td>

						<td width="30%"><input type="text" id="UDF4" name="UDF4"  value=""></td>

					</TR>

					
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>


					<TR>

						<td width="40%"><b>UDF 5</b></td>

						<td width="30%"><input type="text" id="UDF5" name="UDF5"  value=""></td>

					</TR>

					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

		
				   <tr>

						<td width="40%" id="bankcodename" name="bankcodename" ><b>Biller Code</b></td>

						<td width="30%"><input type="text" name="BANKCODE" id="BANKCODE"

							size="25"></td>

					</tr>

					
					<tr>

						<td width="40%" id="transactionIdname" name="transactionIdname" ><b>Id</b></td>

						<td width="30%"><input type="text" name="transactionId" id="transactionId"

							size="25" onchange="hideAmount(IR); "></td>

					</tr>
					
					
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

                     <tr>

								<TD id="idselectedname" name="idselectedname" ><b>Type</b></TD>

						<TD align="left"><select 

							name="idselected" id="idselected" value="" 

							onchange="hideAmount(this.value); ">

                                <option >Select ID</option>

								<option value="transid" select>Transaction ID</option>

								<option value="trackid" select>Track ID</option>


						</select></TD>

					</tr>


<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>



				   <tr>

						<td width="40%" id="amountname" name="amountname" ><b>Amount</b></td>

						<td width="30%"><input type="text" name="Amount" id="Amount"

							size="25" value=""></td>

					</tr>			

						<TD class="text1"><b></b></TD>

						<TD align="left"><b> </br>

						</b> </br> </br></TD>


			

					<TR>

					

						<TD class="text1"><b></b></TD>

						<TD align="left"><button onclick="collectDetails(this.value)">Click To Proceed</button></TD>

					</TR>

                


				</TABLE>

			</div>



			<div id="DTHDetails" value="DTHDetails"

				class="group col-lg-12 cart-items form" align="left"

				style="background-color: white" style="clear: both;">

				<TABLE width="50%" cellspacing="20" border="0">

	       <TR>

						<TD class="text1"><b>Type</b></TD>

						<TD align="left"><select class="tBox-medium"

							name="Dactiontype" id="Dactiontype" value=""

							onchange="hideDAmount(this.value);">

                                     <option >Select</option>

								<option value="VR" select>Validate Request</option>

								<option value="B" select>Browse Plan </option>

								<option value="IR" select>Inquiry</option>

								<option value="R" select>recharge</option>

						</select></TD>	
							
						</tr>
						
										
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>
					</tr>



					<tr>

						<td width="40%"><b>DTH Number</b></td>

						<td width="30%"><input type="text" id="DTH Number"

							name="DTH Number" value="" onchange="validateDTH(this.value);"></td>
					</tr>



					<tr>
						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>
					</tr>


					<TR>
    <input type="hidden"  id="mode" name="mode" value="DTH">

					</tr>
					
					<TR>
                    <TD width="40%" id="doperatorname" name="doperatorname"><b>operator Type</b></TD>
					
						<TD><select name="DTHOperator" id="DTHOperator"

							class="tBox-medium" value="" >

                                <option >Select</option>


                                 <option value="14">AIRTEL DTH</option>

								<option value="15">RELIANCE DIGITAL TV</option>

								<option value="16">DISH TV</option>

								<option value="17">SUN DIRECT</option>

								<option value="18">VIDEOCOND2H</option>

								<option value="19">Tatasky</option>

						</select></TD>

					</tr>


					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					

					</tr>

					<TR>
		
					<TD width="40%" id="dcirclename" name="dcirclename" ><b>Circle Codes</b></TD>
					<TD align="left"><select type="text" name="DTHCircle Code"  id="DTHCircle Code"   value="" >
					
					
						<option >Select</option>

							<option value="2">CHENNAI</option>

							<option value="1">ANDHRA PRADESH</option>

							<option value="3">DELHI</option>

							<option value="4">GUJRAT</option>

							<option value="5">HARYANA</option>

							<option value="6">KARNATAKA</option>

							<option value="7">KERALA</option>

							<option value="8">KOLKATA</option>

							<option value="9">MAHARASHTRA & GOA</option>

							<option value="10">MUMBAI</option>

							<option value="11">PUNJAB</option>

							<option value="12">RAJASTHAN</option>

							<option value="13">WEST BENGAL</option>

							<option value="14">TAMILNADU</option>

							<option value="15">UP EAST</option>

							<option value="16">UP WEST</option>

							<option value="17">HIMACHAL PRADESH</option>

							<option value="18">MADHYA PRADESH</option>

							<option value="19">ASSAM</option>

							<option value="20">BIHAR</option>

							<option value="21">JAMMU KASHMIR</option>

							<option value="22">NORTH EAST</option>

							<option value="23">ORISSA</option>

							<option value="51">UNKNOWN</option>
					</select></TD>

					</TR>
						<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					

					</tr>
					
					
					<tr>
                       <TD width="40%" id="dplanname" name="dplanname"><b>Plan type</b></TD>
						

						<TD align="left"><select type="text"   name="DTHplanType" id="DTHplanType"  value="" >

                                       <option >Select</option>

								<option value="Monthly Pack" select>Details of monthly pack</option>

								<option value="3 Month Packs">Details of quaterly pack</option>

								<option value="6 Month Packs">Details of half yearly pack</option>

								<option value="Annual Packs">Details of annual pack </option>

						</select></TD>

					</tr>



					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

						

						<tr>

						<td width="40%"><b>UDF 1</b></td>

						<td width="30%"><input type="text" id="DUDF1" name="DUDF1"  value="" ></td>

							</tr>

			
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>


					<TR>

						<td width="40%"><b>UDF 2</b></td>

						<td width="30%"><input type="text" id="DUDF2" name="DUDF2"  value=""></td>

					</TR>

					
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

					<TR>

						<td width="40%"><b>UDF 3</b></td>

						<td width="30%"><input type="text" id="DUDF3" name="DUDF3"  value=""></td>

					</TR>

					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>


					<TR>

						<td width="40%"><b>UDF 4</b></td>

						<td width="30%"><input type="text" id="DUDF4" name="DUDF4"  value=""></td>

					</TR>

					
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>



					<TR>

						<td width="40%"><b>UDF 5</b></td>

						<td width="30%"><input type="text" id="DUDF5" name="DUDF5"  value=""></td>

					</TR>

				
					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>

					
	
				 <tr>

						<td width="40%" id="Dbankcodename" name="Dbankcodename" ><b>Biller Code</b></td>

						<td width="30%"><input type="text" name="DBANKCODE" id="DBANKCODE"

							size="25"></td>

					</tr>

				
			

					<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

			
					</tr>


                     <tr>  

								<TD id="Didselectedname" name="Didselectedname" ><b>Type</b></TD>

						<TD align="left"><select 

							name="Didselected" id="Didselected" value="" 

							onchange="hideDAmount(this.value); ">

                                <option >Select ID</option>

								<option value="transid" select>Transaction ID</option>

								<option value="trackid" select>Track ID</option>


						</select></TD>

					</tr>


<tr>

						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>

					</tr>
			

<tr>
						<td width="40%" id="DtransactionIdname" name="DtransactionIdname" ><b>Id</b></td>

						<td width="30%"><input type="text" name="DtransactionId" id="DtransactionId"></td>
</tr>


<tr>
						<td width="40%"><b></b></td>

						<td width="30%"> <font color="white">This is some text!</font> </td>
					</tr>



				   <tr>

						<td width="40%" id="Damountname" name="Damountname" ><b>Amount</b></td>

						<td width="30%"><input type="text" name="DAmount" id="DAmount"

							size="25" value=""></td>

					</tr>			


						<TD class="text1"><b></b></TD>

						<TD align="left"><b> </br>

						</b> </br> </br></TD>

					<TR>

						<TD class="text1"><b></b></TD>

						<TD align="left"><button onclick="collectDetailsDTH(this.value)">Click To Proceed</button></TD>

					</TR>
					
				</TABLE>

	</form>
	</div>
