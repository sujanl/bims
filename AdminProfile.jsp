<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
					<ul>
						<li><a href="bankregister.jsp">Bloodbank Registration</a></li>
						<li><a href="./AdminBloodBank">BloodBanks</a></li>
						<li><a href="./UserInfo">User Info</a></li>
					</ul>
				</div><!--menu-->
			</div><!--navigation-->

			<div id="user">
				<ul>
					<li><a href = "./AdminProfile">${uname}</a></li>
					<li><a href="./Logout" class="button">Logout</a></li>
				</ul>
			</div><!--user-->

			</div><!--header-->
			<div id = "main">
				<div id="heading">
					<h1> Profile</h1>
				</div><!--heading-->

				Name: <%= request.getAttribute("full_name") %><br>
				Address: <%= request.getAttribute("address") %><br>
				Phone: <%= request.getAttribute("phone") %><br>
				Username: <%= request.getAttribute("user_name") %><br>
				Email: <%= request.getAttribute("email") %><br>
				<br>
				<hr>
				<a href="">Edit your profile</a><br>
				<a href="">Change Email</a><br>
				<a href="">Change Password</a><br>

			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>