<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.fss.utils.Browser"%> --%>
<%@page import="com.fss.plugin.iPayPipe"%>
<% 
response.setHeader("Access-Control-Allow-Origin","GET");
response.setHeader("Access-Control-Allow-Origin","POST");
response.setHeader("X-Content-Type-Options","nosniff"); 
iPayPipe pipe = new iPayPipe();
pipe.setWebAddress(request.getParameter("webaddr"));
System.out.println("webaddr::"+pipe.getWebAddress());
%>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
         <meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="-1" />
		<meta http-equiv="CACHE-CONTROL" content="max-age=0"/>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Payment Page</title>
		
		<!--[if IE]>
			<script src="<%=request.getContextPath()%>/js/html5.js"></script>
		<![endif]-->
	<%--   <script src="<%=request.getContextPath()%>/js/iframe-paypage-action.js"></script>
		<link href="<%=request.getContextPath()%>/css/paypage.css" rel="stylesheet" type="text/css" />--%>
		<link href="<%=request.getContextPath()%>/css/iframe-paypage.css" rel="stylesheet" type="text/css" /> 
  
     </head>
  
  <body>
	
	<iframe   style="width: 100%; height: 100%; border: margin: 0px;" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes" name="output_frame" src="<%=pipe.getWebAddress()%>" id="output_frame">
	</iframe>
	
  </body>
</html>
