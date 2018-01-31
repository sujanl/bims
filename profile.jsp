<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<li><a href="./BloodBank">Blood Bank</a></li>
						<li><a href="bloodsearch.jsp">Search Blood</a></li>
						<li><a href="aboutus.jsp">About us</a></li>
					</ul>
				</div><!--menu-->
			</div><!--navigation-->
				<div id="user">
				<ul>
					<li><c:if test="${not empty uname}">
						<li><a href = "./UserProfile">${uname}</a></li>
						<li><a href="./Logout" class="button">logout</a></li>	
					</c:if>
					<c:if test="${empty uname}">
						<li><a href="login.jsp" class="button">login</a></li>
						<li><a href="register.jsp" class="button">Register</a></li>
					</c:if>
					</li>				
				</ul>
			</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Profile</h1>
				</div><!--heading-->
				
				<c:forEach items = "${urlist}" var = "gg">
					Name: ${gg.fullName}<br>
					Blood Group: ${gg.bloodGroup}<br>
					Sex: ${gg.sex}<br>
					DOB: ${gg.dob}<br>
					Address: ${gg.address}<br>
					Phone: ${gg.phone}<br>
					Username: ${gg.userName}<br>
					Email: ${gg.email}<br>
					<br>
					<a href="./EditUserProfile">Edit your profile</a><br>
						<a href="">Change Email</a><br>
						<a href="">Change Password</a><br>
				</c:forEach>
			</div><!--main-->
		<div id="footer">
			<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
		</div><!--footer-->
	</div><!--Wrap-->

</body>
</html>