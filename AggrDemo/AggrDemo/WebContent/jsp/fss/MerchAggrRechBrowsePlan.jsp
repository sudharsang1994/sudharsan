<!-- Added by arun  for Merchant OTP On 10/10/18 -->
<%@page import="com.fss.plugin.*"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" session="true"%>
<%@page import="java.util.*"%>


<HTML>

<head>
<style>
table { 
                border-collapse: collapse; 
            } 
            th { 
                background-color:grey; 
                Color:white; 
            } 
            th, td { 
                width:150px; 
                text-align:center; 
                border:2px solid grey; 
                padding:5px 
              
            } 
            .geeks { 
                border-right:hidden; 
            } 
            .gfg { 
                border-collapse:separate; 
                border-spacing:0 15px; 
            } 
            h1 { 
                color:green; 
            } 

</style>
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
			<div class="logo">
				<h1>
					<a href="HostedPaymentIndex.jsp"><img
						src="<%=request.getContextPath()%>/images/sp-store_logo.png"
						title="Simply Payment Store"></a>
				</h1>
			</div>
			<div class="cart box_1">
				<a href="#">
					<div class="total">
						<span class="simpleCart_total"></span> (<span
							id="simpleCart_quantity" class="simpleCart_quantity"></span>)
					</div> <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
				</a>
				<p>
					<a href="javascript:;" class="simpleCart_empty">Empty Cart</a>
				</p>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- check out -->
	<div class="container content-area">
		<div class="check-sec">
			<script>
				$(document).ready(function(c) {
					$('.close1').on('click', function(c) {
						$('.cart-header').fadeOut('slow', function(c) {
							$('.cart-header').remove();
						});
					});
				});
			</script>
			<!-- </div> -->
			<div class="clearfix"></div>
		</div>


		<!-- <div class="col-md-12 cart-items" style="min-height: 550px;">
			<h1>Status</h1>
			<div>
				 -->

					<%
						try {
							
				
							String amt="",RRnId="";
							   
							amt=request.getParameter("rechargeAmount");
								 
							if(amt!=null){
								
					
								BrowsePlan browsePlan = (BrowsePlan) session
										.getAttribute("browsePlan");
									
								browsePlan.setAmount(amt);
								
								
								Random rnd = new Random(System.currentTimeMillis());
								
								RRnId=String.valueOf(Math.abs(rnd.nextInt()));
								
								browsePlan.setTransId(RRnId);
								
								
								if(browsePlan.performMerchAggrInitializationRecharge()!=0)
								{
								   out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
								  return;  
									
								}
								if (browsePlan.getResult().equals("SUCCESS")){
									
									%>
										<tr>
							<td class="height20"></td>
							<td> <h1>        </h1></td>
						</tr>
						
					
					<tr>
							<td class="height20"></td>
							<td> <p><b> <font color="green">Recharge done successfully</font></b> </p></td>
							<tr>
							<td><p>Please note your Transaction ID :<font color="blue"><%= browsePlan.getTransId() %></font>, Merchant Track Id  :<font color="blue"><%= browsePlan.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= browsePlan.getMobileNumber() %></font></p></td>
							</tr>
						</tr>	
	<div>
	
	<br />
				<br>
				<br />
				<br />
					<table>
						<tr>
							<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<<
								Continue Shopping</a>
						</tr>
					</table>
				</div>
<% } %>
								<% if (browsePlan.getResult().equals("FAILURE") || browsePlan.getResult().equals("Checksum Validation Failed.") ){  %>

		<tr>
							<td class="height20"></td>
							<td> <h1>        </h1></td>
						</tr>
						
					
					<tr>
							<td class="height20"></td>
							<td> <p><b>Recharge Failure -<font color="RED"><%= browsePlan.getResult() %> - <%= browsePlan.getError() %></font></b> </p></td>
							<tr>
							<td><p>Please note your  Merchant Track Id  :<font color="blue"><%= browsePlan.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= browsePlan.getMobileNumber() %></font></p></td>
							</tr>
						</tr>

<div>
	<table align="left">
		</br>
		</br>
		</br>
		</br>
		</br>
	<tr>
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"><<<
				CONTINUE Recharge</a>
		</tr>
		
	</table>

</div> 
							<%   }
							
							}// CLOSING NULL
							
					
							BrowsePlan browsePlan = (BrowsePlan) session
									.getAttribute("browsePlan");
							
							ArrayList  arrlistResult =(ArrayList)session
									.getAttribute("arraylistResult"); 

							if (browsePlan != null) {
								System.out.println(" result" + browsePlan);
								
								if (browsePlan.getType().equals("B")) {
									System.out.println(" -" + browsePlan);
								
												%>
												
			 <div class="col-md-12 cart-items" style="min-height: 550px;">
			     <h1><b>Please find the Browse Plan details</b></h1>
			<div>
			
			</br>
						
					
	<table> 
    <tr>
    <th>Plan Id </th>
    <th>Recharge Validity </th>
    <th>Recharge TalkTime</th>
     <th>Recharge Description</th>
     <th>Recharge Amount  </th>
  </tr> 
   </table> 
												<% 
												
												
												if (arrlistResult != null) {
												
												
												 Iterator itr=arrlistResult.iterator();  

												   //traverse elements of ArrayList object  
												   while(itr.hasNext()){  
													   
													  
																BrowsePlan browsePlan2=(BrowsePlan)itr.next();  
														
																System.out.println("result page output -------"+browsePlan2.getPlanId());
												  				
							%>
 
 
 
 <table class = "gfg">  

            <tr> 
                <td class = "geeks"><%=  browsePlan2.getPlanId() %></td> 
                <td><%=  browsePlan2.getRechargeVldty() %>  </td> 
                <td> <%=  browsePlan2.getRechargeTlktime() %> </td> 
                <td><%=  browsePlan2.getRechargeDesc() %>  </td> 
                <td><%=  browsePlan2.getRechargeAmt() %>   </td> 
            </tr> 
            </table> 
 

<%  } %>


      </br>
  

      <form action="" name="browsePlan" id="browsePlan" method="post">
                <TR>
					<tr>
						<td class="col-md-12 cart-items" style="min-height: 550px;" ><h1><b>Enter Recharge Amount</b></h1></td>



						<td width="30%"><input type="text" id="rechargeAmount"

							name="rechargeAmount" value=""></td>
						
						
						<td><input type="submit" value="Submit"  onclick="changeType(this.value)" /><td>
						
					</tr>

					<TR>
					</br>
					</br>
					</br>
					</form>
      
							<%										   
								}
								
								}
								
								if (browsePlan.getType().equals("R")) {
									
							
									browsePlan.setAmount(amt);
									
									session.setAttribute("browsePlan",browsePlan);
									System.out.println("  set attribute browse result _________   "+browsePlan);
									
									%>
									
									
									
							 <!-- <script type="text/javascript">
										alert("working");
								var jspcall = "MerchAggrRechargeResult.jsp"
								
								window.location.href = jspcall
								
								
							</script>  -->
					
						<%		}
							
								
							}
										
							%>

				
							<!-- <div class="copywrite">
								<div class="container">
									<div class="copy">
										<p>© 2015 FSS ShoppingCart. All Rights Reserved</p>
									</div>

								</div>
		
							</div> -->
							
							
</body>
</html>


<script type="text/javascript">

function changeType(){
	


	<%  
	browsePlan.setType("R");

	session.setAttribute("browsePlan",browsePlan);
	System.out.println("  set attribute browse result _________   "+browsePlan);

	%>
	
 	/*  var jspcall="MerchAggrRechargeResult.jsp" 
		window.location.href=jspcall
	  document.checkout.submit();  
	 
	 */

		<%  

	browsePlan.getType().equals("R");
			
			
			browsePlan.setAmount(amt);
			
			session.setAttribute("browsePlan",browsePlan);
			System.out.println("  set attribute browse result _________   "+browsePlan);
			%>
	 document.browsePlan.action="<%=request.getContextPath()%>/jsp/fss/MerchAggrRechBrowsePlan.jsp";
	
	 document.browsePlan.submit();
	     
  }


</script>


<%
	
	} catch (Exception e) {
		e.printStackTrace();
		 out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
	}
%>
