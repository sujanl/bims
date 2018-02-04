<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>
<% String message = (String)request.getAttribute("alertMsg");%>

<script type="text/javascript">
    var msg = "<%=message%>";
    if(msg!= "null"){
    	alert(msg);	
    }
</script>	


</script>

<html>
	<head>
		<title>AdminHome</title>
		<link rel="stylesheet" type="text/css" href="blood.css">

	</head>

	<body>
	
		<div id="Wrap">
			<div  id="header">
				<div id="logo">
					<a href="AdminHome.jsp"><img src="images/logo.jpg" height="100px" width="200px;"></a>
				</div><!--logo-->

				<div id="user">
					<ul>
						<li><a href = "AdminProfile.jsp">${uname}</a></li>
						<li><a href="./Logout" class="button">Logout</a></li>
					</ul>
				</div><!--user-->	
			</div><!--header-->
			<div id = "main">
				<div id="heading">
					<h1>Welcome to Admin Home.</h1>
				</div><!--heading-->

				<ul>
					<li><a href="bankregister.jsp">Blood bank Registration</a></li>
					<li><a href="./AdminBloodBank">View bloodBanks</a></li>
					<li><a href="./UserInfo">Users Information</a></li>
					<li>Others features(Comming soon)</li>
				</ul>
			</div><!--main-->

			
			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>