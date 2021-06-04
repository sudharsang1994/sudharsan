 
<%@page import="com.fss.plugin.iPayPipe"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Studio">
</HEAD>
</HTML>
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
String trackid = String.valueOf(Math.abs(rnd.nextInt()));
String tranportalID ="";
String key= "'";
iPayPipe pipe = new iPayPipe();
File basePath = new File(pageContext.getServletContext().getRealPath("/"));
File usersFile = new File(basePath+"/WEB-INF/", "merchant_aggr_netbanking.txt");
String str = "", str1="",  resourcePath="", aliasName="", aggrValue="gateway.header=";
String currency="", language="", receiptURL="", errorURL="", notifyURL="",webaddr="";
int index =0;

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
		if ( str.substring(0,str.indexOf("=")) .equals("aggr.webaddr") )
			webaddr	=	str.substring(str.indexOf("=")+1);

		}
		
System.out.println("key:" + key);
System.out.println("tranportalID:" + tranportalID);
//pipe.setResourcePath(resourcePath);
//pipe.setKeystorePath(resourcePath);
//pipe.setAlias(aliasName);
pipe.setAction( action ); //purchase
//pipe.setAction( "17" ); //IMPS
pipe.setCurrency(currency);
pipe.setWebAddress(webaddr);
pipe.setLanguage(language);
pipe.setResponseURL(receiptURL);
pipe.setErrorURL(errorURL);
pipe.setAmt(amount);
pipe.setTransId(comment);
pipe.setTrackId(trackid);
//pipe.setTermkey(Long.parseLong(key));
pipe.setTranportalId(tranportalID);
//pipe.setUdf1("0");
//pipe.setUdf2("8681F6DEAB81434EFE33F9F591CF09F9");
pipe.setUdf3("8681F6DEAB81434E2B8E695FC76E4DA8");
pipe.setUdf4("FC");//Transaction mode for faster checkout
pipe.setUdf5("Tidal5");
//Merchant aggregator Change Starts
pipe.setUdf6("");
pipe.setUdf7("");
pipe.setUdf8("");
pipe.setUdf9("");
pipe.setUdf10("");
pipe.setUdf11("");
pipe.setUdf12("");
pipe.setUdf13("");
pipe.setUdf14("");
pipe.setUdf15("");
//Merchant aggregator Change Ends
pipe.setCustid("201502889575739");//Customer Id for faster checkout
if(pipe.performMerchAggrInitializationHTTP(key)!=0)
{
  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
  return;
}
System.out.println("web address: " + pipe.getWebAddress());
response.sendRedirect(pipe.getWebAddress());
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

