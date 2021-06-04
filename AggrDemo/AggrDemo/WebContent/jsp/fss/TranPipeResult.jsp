<!DOCTYPE html>
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
						<%
							String instituteId	=	request.getParameter("InstituteID");
						Enumeration params = request.getParameterNames(); 
						while(params.hasMoreElements()){
						String paramName = (String)params.nextElement();
						System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
						}
				Random rnd = new Random(System.currentTimeMillis());
				String amount = request.getParameter("AMOUNT");
				String trackid = String.valueOf(Math.abs(rnd.nextInt()));
				iPayPipe pipe = new iPayPipe();
				String tranportalID ="";
				String key= "'";
				String hashFlag = null;
							File basePath = new File(pageContext.getServletContext().getRealPath("/"));

							File usersFile = new File(basePath+"/WEB-INF/", "merchant_aggr.txt");
							String str = "", str1="",  resourcePath="", aliasName="", instituteValue="gateway.header=";
							String currency="", language="", action="", receiptURL="", errorURL="", notifyURL="";
							int index =0;
							String headerCount="",Error="";
							BufferedReader br = new BufferedReader (new FileReader(usersFile));
							if (  instituteId != null )
							instituteValue	=	instituteValue+instituteId;
							while ((str = br.readLine()) != null) {
								if ( str.substring(0,str.indexOf("=")) .equals("tran.currency") )
									currency	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("consumer.language") )
									language	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("tran.action") )
									action	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.receiptURL") )
									receiptURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.notifyURL") )
									notifyURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("merchant.errorURL") )
									errorURL	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.terminal.key") )
									key	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.id") )
									tranportalID	=	str.substring(str.indexOf("=")+1);
								if ( str.substring(0,str.indexOf("=")) .equals("aggr.hash.flag") )
									hashFlag	=	str.substring(str.indexOf("=")+1);

								}
							
							
							System.out.println("resourcePath : " +resourcePath);
							System.out.println("aliasName : " +aliasName);
							pipe.setKeystorePath(resourcePath);
							pipe.setAlias(aliasName);
							pipe.setResourcePath(resourcePath);
							pipe.setHashFlg(hashFlag);
							System.out.println(",,,>>>>request url<--> :"+request.toString());
							

			   String amt=null;
			    DecimalFormat df;
			    try{
			   df=new DecimalFormat("#.00");
     		  	amt=df.format(Double.parseDouble(request.getParameter("amt")));
							        
				}
				catch(Exception e)
				{
				}
										System.out.println("result "+request.getParameter("result"));
										System.out.println("ErrorText"+request.getParameter("ErrorText"));
										System.out.println("tran ::"+request.getParameter("trandata"));
										System.out.println("error"+request.getParameter("Error"));
										if(request.getParameter("ErrorText") != null && !request.getParameter("ErrorText").equals("")&&pipe.parseEncryptedMerchAggrResult(request.getParameter("trandata"),key)!=0){
											String error = request.getParameter("ErrorText");
											System.out.println("ErrorText : " +error);
					%>
							<TR>
									<TD class="text1">
										Your Transaction
									</TD>
									<TD>
									<label  class="errortxt">&nbsp;&nbsp;
										Failed-<%=request.getParameter("ErrorText")%>
										</label>

									<%if((request.getParameter("tranid") !=null && request.getParameter("tranid").length()>0)){ 
									%>
									<label class="text1"> for </label>
									<%if((request.getParameter("tranid") !=null && request.getParameter("tranid").length()>0)){ %>
									<label class="textblue">Transaction ID : <%=request.getParameter("tranid")%></label>
									<%} %>
									<%-- <%if((request.getParameter("tranid") !=null && request.getParameter("tranid").length()>0) && (request.getParameter("paymentid")!=null && request.getParameter("paymentid").length()>0)){
									 %>
									<label class="text1"> and </label>
									<%} %> --%>
									<%-- <%if((request.getParameter("paymentid")!=null && request.getParameter("paymentid").length()>0)){ %>
									<label class="textblue">Payment ID : <%=request.getParameter("paymentid")%> </label> --%>
									<% 
									}%>
									
								</TD>
							</TR>
					<%	}	
						else{
						System.out.println("trandata"+request.getParameter("trandata"));
						if((request.getParameter("trandata")!=null && !request.getParameter("trandata").equals("") && pipe.parseEncryptedMerchAggrResult(request.getParameter("trandata"),key)!=0 ))
						{
					%>
							<TR>
									<TD class="text1">
										Your Transaction
									</TD>
									<TD>
									<label  class="errortxt">&nbsp;&nbsp;
									<% if(!"".equals(pipe.getResult()))
											{
											out.print(pipe.getResult());
										}
										else if(!pipe.getError() .equals(""))
										{
											out.print(pipe.getError());
										}
										else if(!pipe.getError_text().equals(""))
										{
											out.print(pipe.getError_text());
										}
										
										%>
										</label>
									<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
									System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId());
									%>
									<label class="text1">for</label>
									<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
									<label class="textblue">	Transaction ID : <%=pipe.getTransId()%></label>
									<%} %>
									<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
									 %>
									<!-- <label class="text1"> and </label> -->
									<%} %>
									<%-- <%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ %>
									<label class="textblue">Payment ID : <%=pipe.getPaymentId()%> </label> --%>
									<% }
									%>
									
								</TD>
							</TR>
					<%		
						}	
						
						else{
					%>					
							<TR>
									
									<TD class="text1">
										
										<% if(pipe.getResult().equals("CAPTURED") || pipe.getResult().equals("SUCCESS") || pipe.getResult().equals("SUCCESS - AUTO REVERSAL"))
										{
										System.out.println("custid"+pipe.getCustid());%>
										
										Your Transaction for amount &nbsp;
											
											<%if(currency.equals("356")){ %>
											<span class="textblue">INR&nbsp;<%=pipe.getAmt()%></span>
											<%}else{ %>
											<span class="textblue">
											USD&nbsp;<%=pipe.getAmt()%></span>
											<%} %>
											
											<span class="text1">
											 is Successful. </span></TD></TR>
											 <tr><td class="height10"></td></tr>
											<TR>
									<TD class="text1">	 Please note your 
											<span class="textblue"> Transaction ID : <%=pipe.getTransId()%></span>
											<%System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId()); %>
											<%if((!pipe.getCustid().equals("") && pipe.getCustid()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
											  %>
											  <span class="textblue">,Customer ID : <%=pipe.getCustid()%></span>
											  <%} %>
											  <%if(!pipe.getCustid().equals("") && pipe.getCustid()!=null){%>
											  <span class="text1">and </span>
											  <span class="textblue">Customer ID : <%=pipe.getCustid()%></span>
											  <%} %>
											 <%-- <%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
											  %>
											 <label class="text1">and </label>
											 <label class="textblue">Payment ID : <%=pipe.getPaymentId()%>. </label>
											 <%} %> --%>
										
										</td>
								</TR>
									<%} 
									else if((!pipe.getResult() .equals("") && pipe.getResult()!=null)&& pipe.getResult().equals("APPROVED")||pipe.getResult().equals("VOIDED")){
									%><tr><td>
									<label class="text1">Your Transaction has been</label></td><td>
									<label class="textblue"><%=pipe.getResult()%></label></td></tr><tr> 
								    <%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
									%><td>
								    <label class="text1">for</label></td>
								    <%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
								    <label class="textblue"> Transaction ID : <%=pipe.getTransId()%></label>
								   <% } %>
								   <%-- <%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
									 %>
									 <td>
									<label class="text1"> and </label></td>
									<%} %>
								     <%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
										  %>
									<td><label class="textblue">Payment ID : <%=pipe.getPaymentId()%>. </label></td></tr> --%>
										 <%
									 }%>
									<% }
									 else {%>
									<TR>
									<TD class="text1">
										Your Transaction
									</TD>
									<TD>
									<label  class="errortxt">&nbsp;
										<%if(!pipe.getResult().equals(""))
										{
											out.print(pipe.getResult());
										}
										else if(!pipe.getError().equals(""))
										{
											out.print(pipe.getError());
										}
										else if(!pipe.getError_text().equals(""))
										{
											out.print(pipe.getError_text());
										}
										%>
										</label></td>
									<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) || (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ 
									System.out.println("pipe.getTransId() :"+pipe.getTransId()+"pipe.getPaymentId() :"+pipe.getPaymentId());
									%>
									<td><label class="text1">&nbsp;for&nbsp;</label></td>
									<%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null)){ %>
									<td><label class="textblue">	Transaction ID : <%=pipe.getTransId()%></label>
									<%} %><%-- <%if((!pipe.getTransId() .equals("") && pipe.getTransId()!=null) && (!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){
									 %>
									<label class="text1"> and </label>
									<%} %>
									<%if((!pipe.getPaymentId().equals("") && pipe.getPaymentId()!=null)){ %>
									<label class="textblue">Payment ID : <%=pipe.getPaymentId()%> </label> --%>
									<% 
									}%>
									<% }
									%>	
								</TD>
							</TR>
							
					<%
						}
						}
					%>
						
					</table>



			</div>
			<br/><br><br/><br/>
			
			<div>
			<table>
			<tr>
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<< Continue Shopping</a>
			</tr>
			</table>
			</div>
			
	
			
			
      
	</div>
	
	
</div>



</div>



	


<div class="copywrite">
	 <div class="container">
		 <div class="copy">
			 <p>© 2015 FSS ShoppingCart. All Rights Reserved </p>
		 </div>
		
	 </div>
</div>




</body>
</html>