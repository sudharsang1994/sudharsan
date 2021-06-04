<!-- Added by Jeeva D for Tranportal TCPIP Refund & Inquiry On 28/12/17 -->
<%@page import="com.fss.plugin.iPayPipe"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" session="true"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.io.*"%>
<HTML>

<head>
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/css/TranPageStyle.css"
	rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script src="<%=request.getContextPath()%>/js/simpleCart.min.js">
	
</script>

</head>
<body>

	<div class="header-top">
		<div class="header-bottom">
			<div class="header-bottom">
				<div class="logo">
					<h1>
						<a href="HostedPaymentIndex.jsp"><img
							src="<%=request.getContextPath()%>/images/sp-store_logo.png"
							title="Simply Payment Store"></a>
					</h1>
				</div>
			</div>

			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- check out -->
	<div class="container">
		<div class="check-sec">

			<div class="col-md-12 cart-items" style="min-height: 550px;">
				<h1>Payment Status Information</h1>
				<div>
					<TABLE align=left border="0">
						<tr>
							<td class="height20"></td>
						</tr>

						<% 
						try 
						{
						Random rnd = new Random(System.currentTimeMillis());
						String comment = request.getParameter("comment");
						String action = request.getParameter("action");
						String amount = request.getParameter("AMOUNT");
						String udf5   = request.getParameter("udf5");
						String trackid = String.valueOf(Math.abs(rnd.nextInt()));
						trackid = trackid+"_"+String.valueOf(new Random().nextInt(8686));
						String tranportalID ="";
						String tranportalPW ="";
						String cardName = request.getParameter("name");
						String key= "'";
						iPayPipe pipe = new iPayPipe();
						File basePath = new File(pageContext.getServletContext().getRealPath("/"));
						File usersFile = new File(basePath+"/WEB-INF/", "merchant_aggr.txt");
						String str = "", str1="",  resourcePath="", aliasName="", aggrValue="gateway.header=";
						String currency="", language="", receiptURL="", errorURL="", notifyURL="",webaddr="";
						int index =0;
						String cvv    = request.getParameter("cvv");
						String expmm  = request.getParameter("expmm");
						String expyy  = request.getParameter("expyy");
						String pan    = request.getParameter("pan");
						String cardType = request.getParameter("cardType");
						String bankId = request.getParameter("issuerCode");
						String hashFlag = null;
						String headerCount="";
						BufferedReader br = new BufferedReader (new FileReader(usersFile));

						while ((str = br.readLine()) != null) {
								if ( str.substring(0,str.indexOf("=")) .equals("tran.currency") )
									currency	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("consumer.language") )
									language	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.receiptURL") )
									receiptURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.errorURL") )
									notifyURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.errorURL") )
									errorURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.terminal.key") )
									key	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.id") )
									tranportalID	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.password") )
										tranportalPW	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.webaddr") )
									webaddr	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.hash.flag") )
									hashFlag	=	str.substring(str.indexOf("=")+1);
								}
								
						System.out.println("tranportalID:" + tranportalID);
						System.out.println("Tran Password::" + tranportalPW);
						System.out.println("Udf 5:" + udf5);
						//pipe.setResourcePath(resourcePath);
						//pipe.setKeystorePath(resourcePath);
						//pipe.setAlias(aliasName);
						pipe.setAction( action ); //purchase
						//pipe.setAction( "17" ); //IMPS
						pipe.setWebAddress(webaddr);
						pipe.setCurrency(currency);
						pipe.setLanguage(language);
						pipe.setHashFlg(hashFlag);
						pipe.setResponseURL(receiptURL);
						pipe.setErrorURL(errorURL);
						pipe.setAmt(amount);
						pipe.setTransId(comment);
						pipe.setTrackId(trackid);
						pipe.setTranportalPW(tranportalPW);
						pipe.setTermkey(Long.parseLong(key));
						pipe.setTranportalId(tranportalID);
						//pipe.setUdf1("0");
						//pipe.setUdf2("8681F6DEAB81434EFE33F9F591CF09F9");
						pipe.setUdf3("8681F6DEAB81434E2B8E695FC76E4DA8");
						pipe.setUdf4("FC");//Transaction mode for faster checkout
						pipe.setUdf5(udf5);
						//Merchant aggregator Change Starts
						pipe.setUdf6(request.getParameter("udf6"));
						pipe.setUdf7(request.getParameter("udf7"));
						pipe.setUdf8(request.getParameter("udf8"));
						pipe.setUdf9(request.getParameter("udf9"));
						pipe.setUdf10(request.getParameter("udf10"));
						pipe.setUdf11("");
						pipe.setUdf12("");
						pipe.setUdf13("");
						pipe.setUdf14("");
						pipe.setUdf15("");
						System.out.println("Name::"+cardName);
						pipe.setMember(cardName);
						pipe.setCard(pan);
						pipe.setCvv2(cvv);
						pipe.setExpMonth(expmm);
						pipe.setExpYear(expyy);
						pipe.setType(cardType);
						pipe.setBankCode(bankId);
						System.out.println("Type::"+cardType);
						//Merchant aggregator Change Ends
						pipe.setCustid("201502889575739");//Customer Id for faster checkout
						if(pipe.performMerchAggrInitializationTCPIP(key)!=0)
						{
						  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
						  return;
						}
						System.out.println("web address: " + pipe.getWebAddress());%>
						<TR>

							<TD class="text1">
								<% if(pipe.getResult().equals("CAPTURED") || pipe.getResult().equals("SUCCESS") || pipe.getResult().equals("SUCCESS - AUTO REVERSAL"))
										{
										System.out.println("custid"+pipe.getCustid());%> Your
								Transaction for amount &nbsp; <%if(currency.equals("356")){ %> <span
								class="textblue">INR&nbsp;<%=pipe.getAmt()%></span> <%}else{ %> <span
								class="textblue"> USD&nbsp;<%=pipe.getAmt()%></span> <%} %> <span
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