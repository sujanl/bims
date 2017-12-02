<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>
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
				<div id="navigation">
					<div class="menu">
					</div><!--menu-->
				</div><!--navigation-->
				<div id="user">
						<ul>
							<li><a href = "profile.jsp">${uname}</a></li>
							<li><a href="./UserLogout" class="button">Logout</a></li>
						</ul>
				</div><!--user-->	
			</div><!--header-->
			<div id = "main">
				<ul>
					<li><a href="bankregister.jsp">Blood bank Registration</a></li>
					<li>Add Admin(Comming soon)</li>
					<li>View Users(Comming soon)</li>
					<li>Find Users(Comming soon)</li>
					<li>Others features(Comming soon)</li>
				</ul>
			</div><!--main-->

			
			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>