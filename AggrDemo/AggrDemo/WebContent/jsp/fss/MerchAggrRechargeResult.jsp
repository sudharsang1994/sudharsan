<!-- Added by arun  for Merchant OTP On 10/10/18 -->
<%@page import="com.fss.plugin.*"%>
<%@page import="javax.sound.midi.SysexMessage"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" session="true"%>
<%@ page import="java.util.Random"%>

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
						</div> <span class="glyphicon glyphicon-shopping-cart"
						aria-hidden="true"></span>
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
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
					});	  
				});
		    </script>
				<!-- </div> -->
				<div class="clearfix"></div>
			</div>
 

			<div class="col-md-12 cart-items" style="min-height: 550px;">
				<h1> Status </h1>
				<div>
					<TABLE align=left border="0">
						<tr>
							<td class="height20"></td>
						</tr>

						<% 
						try 
						{
			
							 
			
								 RechargePipe rechargePipe = (RechargePipe)session.getAttribute("rechargePipe"); 
					
								 System.out.println("MerchAggrRechargeResult.jsp " +rechargePipe);

							if(rechargePipe!=null){
								
							
								if(rechargePipe.getResult().equals("SUCCESS")){
									if(rechargePipe.getType().equals("R")){
										%>
							
							<tr>
							<td> <p>Your Recharge  for amount <font color="blue"><%= rechargePipe.getAmount() %></font>  is Successful </p></td>
							</tr>
							<tr>
							<td><p>Please note your Transaction ID :<font color="blue"><%= rechargePipe.getTransId() %></font>, Merchant Track Id  :<font color="blue"><%= rechargePipe.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= rechargePipe.getMobileNumber() %></font></p></td>
							</tr>
								
	<div>
									
	<div>
	<table align="left">
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
							
							
									
									
				<% 	}	
									if(rechargePipe.getType().equals("IR")){ %>
								<tr>
							<td> <p>Your Recharge  for amount <font color="blue"><%= rechargePipe.getAmount() %></font>  is Successful </p></td>
							</tr>
							<tr>
							<td><p>Please note your Transaction ID :<font color="blue"><%= rechargePipe.getTransId() %></font>, Merchant Track Id  :<font color="blue"><%= rechargePipe.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= rechargePipe.getMobileNumber() %></font></p></td>
							</tr>		
							
                           
	<div>
						
						
	<div>
	<table align="left">
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



							<%		}	
									
									if(rechargePipe.getType().equals("VR")){
									%>
									
						
											<tr>
										<td class="height20"></td>
										<td> <h1>        </h1></td>
									</tr>
									
								
								<tr>
										<td class="height20"></td>
										<td> <p><b> validation success </b> </p></td>
									</tr>
								
							
							<div>
	<table>

		<tr>
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"  ><<<
				Click to Recharge</a>
		</tr>
		
	</table>

</div> 
							
				
									<% 	rechargePipe.setType("R");
									
										if(rechargePipe.performMerchAggrInitializationRecharge()!=0)
										{
										 /*  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
										  return;  */
											
										}
										
									//	rechargePipe.setResult("FAILURE");
									
											
									
					
							%>		
							
							
								
									
						<% } %>
						
			
					
					<% }
								if(rechargePipe.getResult().equals("FAILURE")|| rechargePipe.getResult().equals("Checksum Validation Failed.")){
									System.out.println("----" +rechargePipe);
									
									if(rechargePipe.getType().equals("IR")){
										System.out.println(" result" +rechargePipe);
									%>
								
					 	    <tr>
							<td> <p>Your Transaction <font color="red"><%= rechargePipe.getError() %></font> 
							<%if(rechargePipe.getTransId()!=null && !"" .equals(rechargePipe.getTransId())){ %>
								
							 for <font color="blue">Transaction ID  :<%= rechargePipe.getTransId() %></font> </p></td>
						<%}%>
							</tr>
							
				 
	<div>
						
						
	<div>
	<table align="left">
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
								<% }
									
									if(rechargePipe.getType().equals("R")){
										
										%>
										
										<tr>
							<td> <p>Your Transaction <font color="red"><%= rechargePipe.getError() %></font> for <font color="blue">Transaction ID  :<%= rechargePipe.getTransId() %></font></p></td>
							</tr>
								   
	<div>
	<table align="left">
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
		
										
									
									
						<% 			}
									
									if(rechargePipe.getType().equals("VR")){  
										
										System.out.println("vr failure page result" +rechargePipe);
										%>
									
							<tr>
							<td> <p>Validation : <font color="red"><%= rechargePipe.getResult() %> -<%= rechargePipe.getError() %></font></p></td>
							</tr>
							
							<div>
	<table align="left">
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
							
										<% 
										}  //closing vr
									}
								
								
								
								if(rechargePipe.getResult().equals("Request Pending")){
									if(rechargePipe.getType().equals("R")){
										%>
							
							<tr>
							<td> <p>Your Recharge  for amount <font color="blue"><%= rechargePipe.getAmount() %></font> <font color="red">Request  is pending</font> </p></td>
							</tr>
							<tr>
							<td><p>Please note your Transaction ID :<font color="blue"><%= rechargePipe.getTransId() %></font>, Merchant Track Id  :<font color="blue"><%= rechargePipe.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= rechargePipe.getMobileNumber() %></font></p></td>
							</tr>
								
	<div>
									
	<div>
	<table align="left">
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
							
							
									
									
				<% 	}	
									if(rechargePipe.getType().equals("IR")){ %>
								<tr>
							<td> <p>Your Recharge  for amount <font color="blue"><%= rechargePipe.getAmount() %></font>  is Successful </p></td>
							</tr>
							<tr>
							<td><p>Please note your Transaction ID :<font color="blue"><%= rechargePipe.getTransId() %></font>, Merchant Track Id  :<font color="blue"><%= rechargePipe.getTrackId() %> </font>, Mobile Number  : <font color="blue"><%= rechargePipe.getMobileNumber() %></font></p></td>
							</tr>		
							
                           
	<div>
						
						
	<div>
	<table align="left">
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



							<%		}	
									
									if(rechargePipe.getType().equals("VR")){
									%>
									
						
											<tr>
										<td class="height20"></td>
										<td> <h1>        </h1></td>
									</tr>
									
								
								<tr>
										<td class="height20"></td>
										<td> <p><b> validation success </b> </p></td>
									</tr>
								
							
							<div>
	<table>

		<tr>
			<a class="continue col-md-4" href="HostedPaymentIndex.jsp"  ><<<
				Click to Recharge</a>
		</tr>
		
	</table>

</div> 
							
				
									<% 	rechargePipe.setType("R");
									
										if(rechargePipe.performMerchAggrInitializationRecharge()!=0)
										{
										 /*  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
										  return;  */
											
										}
										
									//	rechargePipe.setResult("FAILURE");
									
											
									
					
							%>		
							
							
								
									
						<% } %>
						
			
					
					<% }
								
							} %>
					
					</table>
				</div>
				<br /> <br> <br /> <br />	

	
	
	
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


						<% } catch(Exception e)
									{											
											e.printStackTrace();
									}
									%>