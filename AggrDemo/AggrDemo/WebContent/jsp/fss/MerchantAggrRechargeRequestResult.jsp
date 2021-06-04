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
                background-color:green; 
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
		
		<div class="col-md-12 cart-items" style="min-height: 550px;">
				<h1> <b> Status</b></h1>
				</br>
				<div> 
		
		
	
					<%
						try {
							
						
							RechargePipe rechargePipe = (RechargePipe) session
									.getAttribute("rechargePipe");

							System.out.println("MerchantAggrRechargeRequestResult.jsp---- " + rechargePipe);
							
							
							if (rechargePipe != null) {
								System.out.println(" result" + rechargePipe);
								if (rechargePipe.getResult().equals("SUCCESS")) {

									if (rechargePipe.getType().equals("VR")) {
															
					%>


			               <tr>
							<td> <p> Validation <font color="blue"><%= rechargePipe.getResult() %></font></p></td>
							</tr>
					<div>
						<table>
							<table align="left">
								</br>
								</br>
								</br>
								</br>
								
								<a class="continue col-md-4" onclick="settype(this.value);"
									href="MerchantAggrRechargeRequestResult.jsp"> Click to
									Recharge</a>
								

							</table>

							</div>

							<%
								}

											if (rechargePipe.getType().equals("R")) {
												String RRnId=" ";
												Random rnd = new Random(System.currentTimeMillis());
												RRnId=String.valueOf(Math.abs(rnd.nextInt()));
												rechargePipe.setTransId(RRnId);

												if (rechargePipe.performMerchAggrInitializationRecharge() != 0) {
													  out.println("ERROR OCCURED! SEE CONSOLE FOR MORE DETAILS");
													 return;  

												}		
							%>


							<script type="text/javascript">
								var jspcall = "MerchAggrRechargeResult.jsp"
								window.location.href = jspcall
							</script>


							<%
											}	
												}%>
												
		
      
							<%										   
												   
												   }
										if (rechargePipe.getResult().equals("FAILURE") || rechargePipe.getResult().equals("Checksum Validation Failed.")) {

											if (rechargePipe.getType().equals("VR")) {
							%>

							<tr>
								<td class="height20"></td>
								<td>
									<h1></h1>
								</td>
							</tr>


							<tr>
								<td class="height20"></td>
								<td>
									<p>
										<b> Validation Failure </b>
									</p>
								</td>
							</tr>


							<table>
								<table align="left">
									</br>
									</br>
									</br>
									</br>
									</br>
									<a class="continue col-md-4" href="HostedPaymentIndex.jsp">
										Back</a>
									</tr>

								</table>

								</div>


								<%
									}
								%>



								<%
									}
								%>

							
							</div>
							<br />
							<br>
							<br />
							<br />

							</div>

							</div>

							</div>

						
							
</body>
</html>

<script type="text/javascript">

function settype(){
	
	<%   rechargePipe.setType("R"); 
	
	System.out.println("set type  to  R " + rechargePipe);
	session.setAttribute("rechargePipe",rechargePipe);
	System.out.println("  set attribute result _________   "+rechargePipe);
	
	%>	
}
						
								
</script>




<%
	
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(" error result _________   "+e);
		out.println("exception occured at merchaAggrRechargeRequestResult.jsp");
	}
%>
