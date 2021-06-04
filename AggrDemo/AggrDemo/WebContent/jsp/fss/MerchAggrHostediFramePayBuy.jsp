 
<%@page import="com.fss.plugin.iPayPipe"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Studio">
</HEAD>
<body>
<%@ page language="java" session="true" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.*" %>
<%
try 
{
Random rnd = new Random(System.currentTimeMillis());
String comment = request.getParameter("comment");
String action = request.getParameter("action");
String amount = request.getParameter("AMOUNT");
String udf5   = request.getParameter("udf5");
String trackid = String.valueOf(Math.abs(rnd.nextInt()));
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
String hashFlag =  null;
String headerCount="";
BufferedReader br = new BufferedReader (new FileReader(usersFile));

while ((str = br.readLine()) != null) {
		if ( str.substring(0,str.indexOf("=")) .equals("tran.currency") )
			currency	=	str.substring(str.indexOf("=")+1);
		if ( str.substring(0,str.indexOf("=")) .equals("consumer.language") )
			language	=	str.substring(str.indexOf("=")+1);
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
		if ( str.substring(0,str.indexOf("=")) .equals("aggr.tranprtl.password") )
			tranportalPW	=	str.substring(str.indexOf("=")+1);
		if ( str.substring(0,str.indexOf("=")) .equals("aggr.webaddr") )
			webaddr	=	str.substring(str.indexOf("=")+1);
		if ( str.substring(0,str.indexOf("=")) .equals("aggr.hash.flag") )
			hashFlag	=	str.substring(str.indexOf("=")+1);
		}
		
System.out.println("key:" + key);
System.out.println("tranportalID:" + tranportalID);
System.out.println("Tran Password::" + tranportalPW);
System.out.println("Udf 5:" + udf5);
//pipe.setResourcePath(resourcePath);
//pipe.setKeystorePath(resourcePath);
//pipe.setAlias(aliasName);
pipe.setAction( action ); //purchase
//pipe.setAction( "17" ); //IMPS
pipe.setWebAddress(webaddr);
pipe.setHashFlg(hashFlag);
pipe.setCurrency(currency);
pipe.setLanguage(language);
pipe.setResponseURL(receiptURL);
pipe.setErrorURL(errorURL);
pipe.setAmt(amount);
pipe.setTransId(comment);
pipe.setTrackId(trackid);
//pipe.setTermkey(Long.parseLong(key));
pipe.setTranportalId(tranportalID);
pipe.setTranportalPW(tranportalPW);
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
pipe.setCustid("201502889575740");//Customer Id for faster checkout
if(pipe.performMerchAggrInitializationHTTP(key)!=0)
{
  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
  return;
}
System.out.println("web address: " + pipe.getWebAddress());

%>
<form name="samp" action="TranportalFrame.jsp" method="post">
<input type="hidden" name="webaddr" id="webaddr" value=<%=pipe.getWebAddress() %>>
<script type="text/javascript">
alert(document.getElementById("webaddr").value);
document.samp.submit();
</script>
</form>
<%
//response.sendRedirect(pipe.getWebAddress());
}

catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</HTML>
