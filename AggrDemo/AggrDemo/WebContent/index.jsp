<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Payment Gateway Demo</title>
    <link href="<%=request.getContextPath()%>/css/TranPageStyle.css"
			rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    <%

response.addHeader("X-FRAME-OPTIONS","deny"); 
response.addHeader("X-FRAME-OPTIONS","sameorigin"); 
response.addHeader("X-FRAME-OPTIONS","Allow-From http://10.44.71.165:9090/"); 
String url = request.getContextPath()+"/jsp/fss/HostedPaymentIndex.jsp" ;
response.sendRedirect(url);
 %>
    function showCardDetails(){
    
    document.getElementById("ShowCardDet").style.display = "block";
    }
    
    </script>
   
    <META HTTP-EQUIV="X-FRAME-OPTIONS" CONTENT="DENY"> 
  </head>
  <body >
    <table align="center" border="0">
     <tr>
		<td align="center" class="text4">ONLINE SHOPPING</td>
	</tr>
	<br><br>
   	<!-- 
    <tr>
    <td>
    <a href="jsp/aci/HostedPaymentIndex.jsp">ACI</a><br></td></tr>
    -->
    <tr><td align="left"  ><br><br>
    <a href="jsp/fss/HostedPaymentIndex.jsp" class="textLink1">Payment Gateway Card Credentials - Acceptance</a><br></td></tr>
    <tr><td></td></tr>
    
    <tr><td></td></tr>
    <tr><td align="left">
    <a href="jsp/fss/TranPipeIndex.jsp" class="textLink1">Merchant Card Credentials - Acceptance</a></td></tr>
    <!-- 
    <tr><td>
    <a href="jsp/fss/aggregatorHostedIndex.jsp">Aggregator</a></td></tr>
     -->
    </table>
    
    <table>
    <tr><td><br></td></tr>
    </table>
    <!--  
    <table align="center">
     <tr><td>
	<a href="javascript:showCardDetails()">Card Details </a>
	</td></tr>
    </table>
    -->
    <table>
    <tr><td></td></tr>
    </table>
    
    <div id="ShowCardDet" style="display: none;">
    <table border="1" align="center" bordercolor="#810081">
    <tr>
    <td><table>
    <tr><td>Credit Card:<br>Card No:4000000000000002<br>CVV: 123</td></tr></table>
    </td>
    <td></td>
    <td><table>
    <tr><td>Debit Card:<br>Card No:5204730000005442<br>ATM PIN: 123<br>ECOM PIN: 123</td></tr></table>
    </td>
    </tr>
    </table>
    </div>
  </body>
</html>
