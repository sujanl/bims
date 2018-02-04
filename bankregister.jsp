<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<htm lang="en">
<head>
	<meta charset="utf-8">
	<title>Blood Info Management System</title>
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
				<li><a href = "profile.jsp">${uname}</a></li>
				<li><a href="./Logout" class="button">logout</a></li>			
			</ul>
			</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Blood Bank Register</h1>
				</div><!--heading-->
				<div id="register">
		<form method="POST" action="./BloodBankReg" onsubmit="return Validate()" name="vform" >
			<div id="name_div">
			<label>Bank Name</label><br>
						<input type = "text" name = "name" class="textinput" />
					</div>
					<div id="location_div">
						<label>location</label><br>
						<input type = "text" name = "location" class="textinput" />
					</div>
			<div id="contact_div">
				<label>Contact</label> <br>
				<input type="text" name="contact" class="textinput">
			</div>
			<div id="email_div">
				<label>Email</label> <br>
				<input type="email" name="email" class="textinput">
				<div id="phone_error"></div>
			</div><br>
	
			<div>
			<input type="submit" name="register" value="Register" class="btn">
			</div>
		</form>
		</div><!--register-->
			</div><!--main-->
			<div id="footer">
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
	</div><!--Wrap-->


</body>
</html>