<!DOCTYPE html>
<html>
<head>
	<title>Blood Info Management System</title>
	<link rel="stylesheet" type="text/css" href="blood.css">
</head>
<body>
	<div id="Wrap">
		<div  id="header">
			<div id="logo">
				<a href="blood.jsp"><img src="images/logo.jpg" height="100px" width="200px;"></a>
			</div><!--logo-->
			<div id="navigation">
				<div class="menu">
					<ul>
						<li><a href="blood.jsp">Home</a></li>
						<li><a href="bloodbank.jsp">Blood Bank</a></li>
						<li><a href="bloodsearch.jsp">Search Blood</a></li>
						<li><a href="aboutus.jsp">About us</a></li>
					</ul>
				</div><!--menu-->
			</div><!--navigation-->
				<div id="user">
				<ul>
					<li><a href="login.jsp" class="button">Login</a>
					</li>
					<li><a href="register.jsp" class="button">Register</a></li>
				</ul>
			</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Login</h1>
				</div><!--heading-->
				<div id="login">
					<form name="login" method="post" action="./UserLogin">
						<input type="text" name="userName" placeholder="UserName"><br><br>
						<input type="password" name="password" placeholder="Password"><br><br>
						<input type="submit" name="Login" value="Login">
					</form><br>
					Click <a href="register.jsp">HERE</a> to register.
				</div>
			</div><!--main-->
			<div id="footer">
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->

</body>
</html>