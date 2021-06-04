<%@page import="java.util.*"%>
<%@page import="com.fss.plugin.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<%@ page import="java.util.Random"%>
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

$(window).bind("pageshow", function() {
	  // update hidden input field
	});


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

<div class="header-top">
			<div class="header-bottom">
				<div class="logo">
					<h1>
						<a href="HostedPaymentIndex.jsp"><img
							src="<%=request.getContextPath()%>/images/sp-store_logo.png"
							title="Simply Payment Store"></a>
					</h1>
				</div>
			
			
				<div class="col-md-12 cart-items" style="min-height: 550px;">
				<h1> Status </h1>
				</br>
				<div> 

</head>



	<% 	

	try{
String  type=" ", mode="  ", Number=" " ,transactionId=" ",
operator=" ",circleCode=" ", rechargeType=" " ,udf1=" " ,
udf2=" " ,udf3=" ", udf4=" ",udf5=" ", BankCode=" ",amount=" " ,trackid=" ", tranportalID=" ",tranportalPW =" ",
str = " ", RRnId=" ", name=" ",receiptURL=" ", errorURL=" ", notifyURL=" ",webaddr=" ", key=" ", value=" ",hashFlag="";


// for mobile
						Random rnd = new Random(System.currentTimeMillis());
		
		
						 mode = request.getParameter("mode");
						 System.out.println(" starting  _________"+mode);
		if(mode.equals("mobile")){
		
		
						 type = request.getParameter("actiontype");
						 Number = request.getParameter("Mobile Number");
						 operator   = request.getParameter("Operator");
						 circleCode   = request.getParameter("Circle Code");
						 rechargeType   = request.getParameter("rechargeType");
						 udf1   = request.getParameter("UDF1");
						 udf2   = request.getParameter("UDF2");
						 udf3   = request.getParameter("UDF3");
						 udf4   = request.getParameter("UDF4");
						 udf5   = request.getParameter("UDF5");
				         BankCode= request.getParameter("BANKCODE");
				         amount=request.getParameter("Amount");
				         transactionId =request.getParameter("transactionId");
						 trackid = String.valueOf(Math.abs(rnd.nextInt()));
							
		}	 
			// for DTH
	
			if(mode.equals("DTH")){
			             type = request.getParameter("Dactiontype");
						 mode = request.getParameter("mode");//need to check
						 Number = request.getParameter("DTH Number");
						 operator   = request.getParameter("DTHOperator");
						 rechargeType   = request.getParameter("DTHplanType");
						 circleCode   = request.getParameter("DTHCircle Code");
						 udf1   = request.getParameter("DUDF1");
						 udf2   = request.getParameter("DUDF2");
						 udf3   = request.getParameter("DUDF3");
						 udf4   = request.getParameter("DUDF4");
						 udf5   = request.getParameter("DUDF5");
				         BankCode= request.getParameter("DBANKCODE");
				         transactionId =request.getParameter("DtransactionId");
				         amount=request.getParameter("DAmount");
						 trackid = String.valueOf(Math.abs(rnd.nextInt())); 
					
			}
			
			
						RechargePipe rechargePipe=new RechargePipe();
						
						File basePath = new File(pageContext.getServletContext().getRealPath("/"));
						File usersFile = new File(basePath+"/WEB-INF/", "merchant_recharge.txt");
						
				
						BufferedReader br = new BufferedReader (new FileReader(usersFile));

						while ((str = br.readLine()) != null) {
							
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.terminal.key") )
									key	=	str.substring(str.indexOf("=")+1);
								
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.id") )
									tranportalID	=	str.substring(str.indexOf("=")+1);
								
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.password") )
										tranportalPW	=	str.substring(str.indexOf("=")+1);
								
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.Recharge.Webaddr") )
									webaddr	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.hash.flag") )
									hashFlag	=	str.substring(str.indexOf("=")+1);
								
								 System.out.println(" _________   "+key+" ________"+tranportalID+" ____"+tranportalPW+"____"+webaddr);
								
								}
								
						rechargePipe.setTrackId(trackid);
						rechargePipe.setTranportalPW(tranportalPW);
						rechargePipe.setTranportalId(tranportalID);
						rechargePipe.setUdf1(udf1);
						rechargePipe.setUdf2(udf2);
						rechargePipe.setUdf3(udf3);
						rechargePipe.setUdf4(udf4);
 						rechargePipe.setUdf5(udf5);
						rechargePipe.setType(type);
						rechargePipe.setMode(mode);
						rechargePipe.setMobileNumber(Number);
						rechargePipe.setRechargeOperator(operator);
						rechargePipe.setRechargeCircle(circleCode);
						rechargePipe.setRechargeType(rechargeType);
						rechargePipe.setTranportalId(tranportalID);
						rechargePipe.setTranportalPW(tranportalPW);
						rechargePipe.setKey(key);
						rechargePipe.setErrorURL(errorURL);
						rechargePipe.setResponseURL(receiptURL);
						rechargePipe.setWebAddress(webaddr);
						rechargePipe.setBankCode(BankCode);
						rechargePipe.setAmount(amount);
						rechargePipe.setTransId(transactionId);
						rechargePipe.setHashFlg(hashFlag);
				
						if(rechargePipe.getType().equals("Select"))
						{
							out.println("Invalid request type");
							
							  return;
						}
						 if(rechargePipe.getType().equals("R")){
								
								RRnId=String.valueOf(Math.abs(rnd.nextInt()));
										
								rechargePipe.setTransId(RRnId);
						
								     }
						
			 if(rechargePipe.getType().equals("R")||rechargePipe.getType().equals("VR")||rechargePipe.getType().equals("IR")){
				
						 if(rechargePipe.performMerchAggrInitializationRecharge()!=0)
						{
						  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
						  
						  return;
							 
						  } 
						 	 
				 }  
			
			 
				 if(rechargePipe.getType().equals("B")){
					
						BrowsePlan browsePlan=new BrowsePlan();
						
						browsePlan.setTrackId(trackid);
						browsePlan.setTranportalPW(tranportalPW);
						browsePlan.setTranportalId(tranportalID);
						browsePlan.setUdf1(udf1);
						browsePlan.setUdf2(udf2);
						browsePlan.setUdf3(udf3);
						browsePlan.setUdf4(udf4);
						browsePlan.setUdf5(udf5);
						browsePlan.setType(type);
						browsePlan.setMode(mode);
						browsePlan.setMobileNumber(Number);
						browsePlan.setRechargeOperator(operator);
						browsePlan.setRechargeCircle(circleCode);
						browsePlan.setRechargeType(rechargeType);
						browsePlan.setTranportalId(tranportalID);
						browsePlan.setTranportalPW(tranportalPW);
						browsePlan.setKey(key);
						browsePlan.setErrorURL(errorURL);
						browsePlan.setResponseURL(receiptURL);
						browsePlan.setWebAddress(webaddr);
						browsePlan.setBankCode(BankCode);
						browsePlan.setAmount(amount);
						browsePlan.setHashFlg(hashFlag);
						

						 if(browsePlan.performMerchAggrInitializationRecharge()!=0)
						{
						   out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
						   
						  return;
						  
					  } 
						 
						 //browsePlan.setResult("SUCCESS");
					//	 if(browsePlan.getResult().equals("SUCCESS")){
						
					
						if(browsePlan.getPlanId()!=null &&!browsePlan.getResult().equals("FAILURE")){
							
						
							 ArrayList<BrowsePlan>	listResult= browsePlan.parseBrowseResponse();
						 
							  session.setAttribute("browsePlan",browsePlan);
							 	
								session.setAttribute("arraylistResult",listResult);
								
								System.out.println(" o/p "+listResult);
								
								System.out.println(" o/p2  "+rechargePipe);
								
								System.out.println(" o/p2"+browsePlan);
								
								
								%>
							
								
								<script type="text/javascript">	
								
						        var jspcall="MerchAggrRechBrowsePlan.jsp" 
						        	window.location.href=jspcall
									
							    </script> 
							
		
							 
					<% }//closing success
					
					
						if(browsePlan.getResult().equals("FAILURE") || browsePlan.getResult().equals("Checksum Validation Failed.")){
							System.out.println(" br   _________"+browsePlan);
							%>
							<tr>
							<td> <p>Your Transaction <font color="red"><%= browsePlan.getResult() %> - <%= browsePlan.getError() %></font></p></td>
							</tr>
						
					
				<% 
						}
						
						else{  %>
						
			               <tr>
							<td> <p>Your Transaction <font color="red"><%= browsePlan.getError() %></font></p></td>
							</tr>
						
						
						
				<%  	}
					
				 }	
			
	
	if(rechargePipe.getResult().equals("SUCCESS") || rechargePipe.getResult().equals("Request Pending")){
					
		if(rechargePipe.getType().equals("R")){
			
			session.setAttribute("rechargePipe",rechargePipe);
		
	
			%>
			
      <script type="text/javascript">	
	
        var jspcall="MerchAggrRechargeResult.jsp" 
        	window.location.href=jspcall
			
	</script> 
	
  <% 
  } 	
	if(	rechargePipe.getType().equals("VR")){ 
		session.setAttribute("rechargePipe",rechargePipe);
		%>
	
		
		<script type="text/javascript">	
        var jspcall="MerchantAggrRechargeRequestResult.jsp" 
        	window.location.href=jspcall
	     </script> 
	
		
		<%  }
	
	
	if(rechargePipe.getType().equals("IR")){
	
		session.setAttribute("rechargePipe",rechargePipe);
		
		  %>
	

		 <script type="text/javascript">	
			
	        var jspcall="MerchAggrRechargeResult.jsp" 
	        	window.location.href=jspcall
				
		</script>
	
	
<% 	}// closing IR 
		}// closing success
		%>
		
		<% 
		if(rechargePipe.getResult().equals("FAILURE")|| rechargePipe.getResult().equals("Checksum Validation Failed.") ||  rechargePipe.getResult().equals("Request Pending")){
			if(rechargePipe.getType().equals("R")){
				
				session.setAttribute("rechargePipe",rechargePipe);
				
				
				%>
			
	<script type="text/javascript">	
	
        var jspcall="MerchAggrRechargeResult.jsp" 
        	window.location.href=jspcall
			
	</script> 
	
	
			
	<% 		}
			
if(rechargePipe.getType().equals("VR")){
	
	session.setAttribute("rechargePipe",rechargePipe);
	 System.out.println(" vr   _________"+rechargePipe);
	
	
				%>
			
	<script type="text/javascript">	
	
        var jspcall="MerchAggrRechargeResult.jsp" 
        	window.location.href=jspcall
			
	</script> 
	
	
			
<% 		}
			
if(rechargePipe.getType().equals("IR")){
				
	session.setAttribute("rechargePipe",rechargePipe);
	
				%>
 <script type="text/javascript">	
	
        var jspcall="MerchAggrRechargeResult.jsp" 
        	window.location.href=jspcall
			
	</script> 


<% 			
		}  }
		
		
		else {
			if(!rechargePipe.getType().equals("B")){
				
				System.out.println(" r   _________"+rechargePipe);	
		%>
			               <tr>
							<td> <p>Your Transaction <font color="red"><%= rechargePipe.getResult() %></font></p></td>
							</tr>
			                	
	<%	}		 
		}
		%>

	   <% 
	   
}
catch(Exception e){
        		
        		e.printStackTrace();
        		out.println("exception occured at merchaAggrRecharge.jsp");
        	}%>
	
	
	<table align="left">
	</br>
	</br>

      <tr>
		<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<<
			CONTINUE Recharge</a>
	</tr>
	
</table>

</div> 
	