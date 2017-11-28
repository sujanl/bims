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
					<h1>Register</h1>
				</div><!--heading-->
				<div id="register">
					<form name="register" method="post" action="./UserRegister">
						<input type = "text" name = "fullName" placeholder = "Full Name"/><br><br>
						Blood Group:
						<select name = "bloodGroup">
							<option value= "a+">A+</option>
							<option value= "a-">A-</option>
							<option value= "b+">B+</option>
							<option value= "b-">B-</option>
							<option value= "ab+">AB+</option>
							<option value= "ab-">AB-</option>
							<option value= "o+">O+</option>
							<option value= "o-">O-</option>
						</select><br><br>
						Sex:<input type="radio" name="sex" value="male">Male      <input type="radio" name="sex" value="female">Female<br><br>
						Date Of Birth:<br><input type="date" name="dob" placeholder="DateOfBirth"><br><br>
						<input type = "text" name = "address" placeholder = "Address"/><br><br>
						<input type = "text" name = "phone" placeholder = "Phone Number"/><br><br>
						<input type = "text" name = "email" placeholder = "Email"/><br><br>
						<input type = "text" name = "userName" placeholder = "UserName"/><br><br>
						<input type = "password" name = "password" placeholder = "Password"/>
						<input type = "password" name = "repassword" placeholder = "ReEnter Password"/><br><br>
						<input type="submit" value ="Register">
					</form><br>
					Click <a href="login.jsp">HERE</a> to login.
				</div><!--register-->
			</div><!--main-->
			<div id="footer">
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->

</body>
</html>