<!-- Added by arun  for Merchant OTP On 10/10/18 -->
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
<style type="text/css">

.customButton {
display: block;
width: 228px;
height: 35px;
background: #218c0f;
padding: 32px;
text-align: center;
border-radius: 27px;
color: white;
font-weight: bold;
cursor:pointer;
}

</style>
<script type="text/javascript">

function Tranbuy()
{
	
	
	document.VPAForm.method="post";
	 document.VPAForm.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrUPICollectMoneyPaymentPage.jsp";
	 document.VPAForm.submit();	
	
	
	
}

</script>
<script type="text/javascript">
	/* function performUPIIntent()
	{
	//	alert("alert");
		//alert(document.vpaurlform.value);
		document.vpaurlform.submit()
	} */
	function performUPIIntent()
	{
		//alert("alert");
		//alert("=== !!! Android Device !!! ===");
    	//var intentData = "${intentResponse}"; 
    	//window.location.href = intentData;
    	
    	 var a = document.createElement('a');  
        var link = document.createTextNode("This is UPI Intent link"); 
        a.appendChild(link);  
       // a.title = "This is UPI INTENT Link To get Tray";  
       // a.id = "upiIntentid";
      //  a.href = "${intentResponse}"; 
       // document.body.appendChild(a);  
        //alert("done 11");
       // alert(document.getElementById("upiIntentid").click())
        document.getElementById("upiIntentid").click(); 
       // alert("done 2")
       // document.getElementById("yourLink").click(); //yourLink 
    	//window.open(intentData);
    	//window.location.replace(intentData);
		//document.vpaurlform.submit()
	}
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
							//trackid="1252277505_1445";
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
							String custvpa = request.getParameter("vpa");
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
							pipe.setCustvpa(custvpa);
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
							
							if(pipe.performMerchAggrTranUPIIntent(key)!=0)
							{
							  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
							  return;
							}
							System.out.println("web address: " + pipe.getWebAddress());
							//System.out.println("VPA URL"+pipe.getVpaurl());					
						if(pipe.getResult().equals("Customer VPA Validated Successfully"))
						{
						%>
						
						 <TR>
							<TD class="text1">
								<form  id="VPAForm" name ="VPAForm" >
									<%-- VPA URL <input type="text" name="vpaurl" id="vpaurl" value=<%=pipe.getVpaurl()%>> --%>
								<!-- 	<a id="upiIntentid" href= class="customButton" >
								<span style="color: white;" onclick="performUPIIntent()">CLICK HERE TO SEE UPI SUPPORTED APPS</span></a>
									 -->
									<!-- <input type="submit"  value="Submit" onclick="performUPIIntent()" > -->
									
									<a id="upiIntentid"   >
								<span style="color: red;" ><%=pipe.getResult() %></span></a>
									 
							<TABLE width="50%" cellspacing="20" border="0" align="center">
							<tr>
								<td width="40%"><b>Transaction id</b></td>
								<td width="30%"> 
								<input type="text" name="tranid" size="25" value="<%=pipe.getTransId()%>" placeholder=""> </td>
							</tr>
							<tr>
								<td width="40%"><b>Amount</b></td>
								<td width="30%"> <input type="text" name="amount" size="25" value="<%=pipe.getAmt()%>" placeholder=""> </td>
							</tr>
												
							<TR>
								<TD width="100%" colspan="4"><input type="Submit" value="Buy(UAT)" class="button1" onclick="Tranbuy();" ></TD>
							</TR>
						</TABLE>
									
									
									
									
							</form>
						
							</TD>
						</TR>
						<%}
						else {
							%>

						<TR>
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
							</label></TD>
						</TR>
						<% 
									}%>
						<% }%>

						



						<%
						
						}
						}
						
									catch(Exception e)
									{											
											e.printStackTrace();
									}
									%>


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
				<p>? 2015 FSS ShoppingCart. All Rights Reserved</p>
			</div>

		</div>
	</div>
</body>
</html>