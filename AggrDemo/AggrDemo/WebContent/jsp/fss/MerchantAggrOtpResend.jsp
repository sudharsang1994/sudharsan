<%@page import="com.fss.plugin.iPayPipe"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" session="true"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.io.*"%>
						<%@page import="java.text.DecimalFormat"%>
				<%@ page import="java.util.Enumeration" %>
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
					

		
<%


		iPayPipe pipe = new iPayPipe();
		pipe.setTransId(request.getParameter("tranid"));
		pipe.setResponseURL(request.getParameter("responseURL"));
		pipe.setAmt(request.getParameter("amt"));
		
		
		
							
							
						
						%>
						
						<%-- <jsp:forward page="/jsp/fss/MerchantAggrOtp.jsp" /> --%>
						<%-- <jsp:forward page="/MerchantAggrOtpSend.jsp" /> --%>
						<TR>
				<input type="hidden" name="AMOUNT" id="AMOUNT" value=<%=pipe.getAmt()%>>
				<input type="hidden" name="comment" id="comment" value=<%=pipe.getTransId()%>>
							<%--  <TD class="text1">
								 <form  id="otpform" action="MerchantAggrOtpSend.jsp">
									enter OTP: <input type="text" name="otp" id="otp">
									<input type="hidden" name="trackid" id="" value=pipe.getTrackId()>>
									<input type="hidden" name="tranportalID" id="tranportalID" value=<%=pipe.getTranportalId()%>>
									<input type="hidden" name="tranportalPW" id="tranportalPW" value=<%=pipe.getTranportalPW()%>>
									<input type="hidden" name="key" id="key" value=<%=pipe.getKeystorePath()%> >
									<input type="hidden" name="webaddr" id="webaddr" value=<%=webaddr%>>
									<input type="hidden" name="responseURL" id="responseURL" value=<%=pipe.getResponseURL() %>>
									<input type="hidden" name="errorURL" id="errorURL" value=<%=pipe.getErrorURL() %>>
									<input type="hidden" name="amt" id="amt" value=<%=amount%>>
									<input type="hidden" name="udf1" id="udf1" value=<%=pipe.getUdf1()%>>
									<input type="hidden" name="udf2" id="udf2" value=<%=pipe.getUdf2()%>>
									<input type="hidden" name="udf3" id="udf3" value=<%=pipe.getUdf3()%>>
									<input type="hidden" name="udf4" id="udf4" value=<%=pipe.getUdf4()%>>
									<input type="hidden" name="udf5" id="udf5" value=<%=pipe.getUdf5()%>>
									<input type="hidden" name="udf6" id="udf6" value=<%=pipe.getUdf6()%>>
									<input type="hidden" name="udf7" id="udf7" value=<%=pipe.getUdf7()%>>
									<input type="hidden" name="udf8" id="udf8" value=<%=pipe.getUdf8()%>>
									<input type="hidden" name="udf9" id="udf9" value=<%=pipe.getUdf9()%>>
									<input type="hidden" name="udf10" id="udf10" value=<%=pipe.getUdf10()%>>
									<input type="submit"  value="Submit">
									
							</form> 
							<form  id="otpform" action="MerchantAggrOtp.jsp">
									<input type="hidden" name="tranid" id="tranid" value=<%=pipe.getTransId()%>>
									<input type="hidden" name="trackid" id="" value=<%=pipe.getTrackId()%>>
									<input type="hidden" name="tranportalID" id="tranportalID" value=<%=pipe.getTranportalId()%>>
									<input type="hidden" name="tranportalPW" id="tranportalPW" value=<%=pipe.getResponseURL() %>>
									<input type="hidden" name="key" id="key" value=<%=pipe.getKeystorePath()%> >
									<input type="hidden" name="webaddr" id="webaddr" value=<%=webaddr%>>
									<input type="hidden" name="responseURL" id="responseURL" value=<%=pipe.getResponseURL() %>>
									<input type="hidden" name="errorURL" id="errorURL" value=<%=pipe.getErrorURL() %>>
									<input type="hidden" name="amt" id="amt" value=<%=pipe.getAmt()%>>
									<input type="hidden" name="udf1" id="udf1" value=<%=pipe.getUdf1()%>>
									<input type="hidden" name="udf2" id="udf2" value=<%=pipe.getUdf2()%>>
									<input type="hidden" name="udf3" id="udf3" value=<%=pipe.getUdf3()%>>
									<input type="hidden" name="udf4" id="udf4" value=<%=pipe.getUdf4()%>>
									<input type="hidden" name="udf5" id="udf5" value=<%=pipe.getUdf5()%>>
									<input type="hidden" name="udf6" id="udf6" value=<%=pipe.getUdf6()%>>
									<input type="hidden" name="udf7" id="udf7" value=<%=pipe.getUdf7()%>>
									<input type="hidden" name="udf8" id="udf8" value=<%=pipe.getUdf8()%>>
									<input type="hidden" name="udf9" id="udf9" value=<%=pipe.getUdf9()%>>
									<input type="hidden" name="udf10" id="udf10" value=<%=pipe.getUdf10()%>> 
									<input type="submit" value="Resend OTP">
									</form>
							</TD>
						</TR> --%>
						<%

						System.out.println("tranid: AMOUNT " + request.getParameter("tranid")+ request.getParameter("amt"));
					 RequestDispatcher rd = request.getRequestDispatcher("/jsp/fss/MerchantAggrOtp.jsp");
					 rd.forward(request, response);
						
							%>

						<%-- <TR>
							<TD class="text1">Your Transaction</TD>
							<TD><label class="errortxt">&nbsp; Failed-<%=pipe.getError()%>
							</label></td>
							<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
									System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId());
									%>
							<td><label class="text1">&nbsp;for&nbsp;</label></td>
							<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
							<td><label class="textblue"> Transaction ID : <%=pipe.getTransId()%></label>
								<%} %></TD>
							<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
									 %>
							<td><label class="text1">&nbsp;and&nbsp; </label></td>
							<%} %>

							<%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ %>
							<td><label class="textblue">Payment ID : <%=pipe.getPaymentId()%>
							</label></TD> --%>
						</TR>


					</table>
				</div>
				<br /> <br> <br /> <br />

			
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