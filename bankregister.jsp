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
				<li><c:if test="${not empty uname}">
						<li><a href = "profile.jsp">${uname}</a></li>
						<li><a href="./Logout" class="button">logout</a></li>	
					</c:if>
					<c:if test="${empty uname}">
						<li><a href="login.jsp" class="button">login</a></li>
						<li><a href="register.jsp" class="button">Register</a></li>
					</c:if></li>				
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
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->


</body>
</html>