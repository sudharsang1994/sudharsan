<%@page import="com.fss.plugin.iPayPipe"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" session="true"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.io.*"%>
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/css/TranPageStyle.css"
			rel="stylesheet" type="text/css" />
			
			<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Custom Theme files -->
<!--theme style-->
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>


<!--//theme-style-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="<%=request.getContextPath()%>/js/simpleCart.min.js"> </script>


    
</head>
<body>
<!-- header -->
<div class="header-top">
	 <div class="header-bottom">			
       <div class="header-bottom">			
			<div class="logo">
				<h1><a href="HostedPaymentIndex.jsp"><img src="<%=request.getContextPath()%>/images/sp-store_logo.png" title="Simply Payment Store"></a></h1>
			</div>
	 </div>
       
        <div class="clearfix"> </div>
     </div>
	 <div class="clearfix"> </div>
</div>
<!-- check out -->
<div class="container">
	<div class="check-sec">	 
		
		<div class="col-md-12 cart-items" style="min-height:550px;">
			<h1>Payment Status Information </h1>
			<div>
			<TABLE align=left border="0"  >		
	<tr><td class="height20"></td>
	</tr>
						<%@page import="com.fss.plugin.iPayPipe"%>
						<%@ page import="java.util.Random" %>
						<%@page import="java.text.DecimalFormat"%>
				<%@ page import="java.io.*" %>
				<%@ page import="java.util.Enumeration" %>


<%try{
		iPayPipe pipe = new iPayPipe();
		pipe.setOtp(request.getParameter("otp"));
		pipe.setTranportalId(request.getParameter("tranportalID"));
		pipe.setTranportalPW(request.getParameter("tranportalPW"));
		pipe.setTrackId(request.getParameter("trackid"));
		pipe.setTransId(request.getParameter("tranid"));
		pipe.setTermkey(Long.parseLong(request.getParameter("key")));
		pipe.setWebAddress(request.getParameter("webaddr"));
		pipe.setErrorURL(request.getParameter("errorURL"));
		pipe.setResponseURL(request.getParameter("responseURL"));
		//pipe.setAmt(request.getParameter("amt"));
		pipe.setUdf1(request.getParameter("udf1"));
		pipe.setUdf2(request.getParameter("udf2"));
		pipe.setUdf3(request.getParameter("udf3"));
		pipe.setUdf4(request.getParameter("udf4"));
		pipe.setUdf5(request.getParameter("udf5"));
		pipe.setUdf6(request.getParameter("udf6"));
		pipe.setUdf7(request.getParameter("udf7"));
		pipe.setUdf8(request.getParameter("udf8"));
		pipe.setUdf9(request.getParameter("udf9"));
		pipe.setUdf10(request.getParameter("udf10"));
		
		System.out.println("Amount :: "+request.getParameter("amt"));
		System.out.println("tranportalID:" +request.getParameter("tranportalID"));
		if(pipe.performMerchAggrTranOtpSend(request.getParameter("key"))!=0)
		{
		  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
		  return;
		}
		System.out.println("web address: " + pipe.getWebAddress());
		
		System.out.println("web address: " + pipe.getWebAddress());%>
		<TR>

			<TD class="text1">
				<% if(pipe.getResult().equals("CAPTURED") || pipe.getResult().equals("SUCCESS"))
						{
						System.out.println("custid"+pipe.getCustid());%> Your
				Transaction for amount &nbsp; <span
				class="textblue">INR&nbsp;<%=pipe.getAmt()%> <span
				class="text1"> is Successful. </span>
			</TD>
		</TR>
		<tr>
			<td class="height10"></td>
		</tr>
		<TR>
			<TD class="text1">Please note your <span class="textblue">
					Transaction ID : <%=pipe.getTransId()%></span> <%System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId()); %>
				<%if((!pipe.getCustid().equals("") && pipe.getCustid()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
							  %> <span class="textblue">,Customer ID : <%=pipe.getCustid()%></span>
				<%} %> <%if(!pipe.getCustid().equals("") && pipe.getCustid()!=null){%>
				<span class="text1">and </span> <span class="textblue">Customer
					ID : <%=pipe.getCustid()%></span> <%} %> <%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
							  %> <label class="text1">and </label> <label
				class="textblue">Payment ID : <%=pipe.getPaymentId()%>.
			</label> <%} %>

			</td>
		</TR>
		<%} 
					else if((!pipe.getResult() .equals("") && pipe.getResult()!=null)&& pipe.getResult().equals("APPROVED")||pipe.getResult().equals("VOIDED")){
					%><tr>
			<td><label class="text1">Your Transaction has been</label></td>
			<td><label class="textblue"><%=pipe.getResult()%></label></td>
		</tr>
		<tr>
			<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
					%><td><label class="text1">for</label></td>
			<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
			<label class="textblue"> Transaction ID : <%=pipe.getTransId()%></label>
			<% } %>
			<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
					 %>
			<td><label class="text1"> and </label></td>
			<%} %>
			<%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
						  %>
			<td><label class="textblue">Payment ID : <%=pipe.getPaymentId()%>.
			</label></td>
		</tr>
		<%
					 }%>
		<% }
					}
					 else {%>
		<TR>
			<TD class="text1">Your Transaction</TD>
			<TD><label class="errortxt">&nbsp; Failed-<%=pipe.getErrorcode()%>
			</label></td>
			<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
					System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId());
					%>
			<td><label class="text1">&nbsp;for&nbsp;</label></td>
			<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
			<td><label class="textblue"> Transaction ID : <%=pipe.getTransId()%></label>
				<%} %></TD>
				<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
					 %> <td><label class="text1">&nbsp;and&nbsp; </label></td> <%} %>
					 
					  <%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ %>
				<td><label class="textblue">Payment ID : <%=pipe.getPaymentId()%>
			</label></TD> <% 
					}%> <% }
					 }%> </TR>
		
		<%}
						catch(Exception e)
					{											
							e.printStackTrace();
					}
					%>
		

	</table>



</div>
<br />
<br>
<br />
<br />

<div>
	<table>
		<tr>
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<<
				Continue Shopping</a>
		</tr>
	</table>
</div>





</div>


</div>



</div>






<div class="copywrite">
<div class="container">
<div class="copy">
<p>© 2015 FSS ShoppingCart. All Rights Reserved</p>
</div>

</div>
</div>



</body>
</html>