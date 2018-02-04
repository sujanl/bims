<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
					</c:if></li>
				</ul>
			</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Blood Search</h1>
				</div><!--heading-->	
				<div id="bsearch">
					<form name="bsearch" method="post" action="./BloodSearch">
						<label>Blood Group</label><br>
						<select name = "bloodGroup" class="textinput">
							<option >Blood Group</option>
							<option value= "a+">A+</option>
							<option value= "a-">A-</option>
							<option value= "b+">B+</option>
							<option value= "b-">B-</option>
							<option value= "ab+">AB+</option>
							<option value= "ab-">AB-</option>
							<option value= "o+">O+</option>
							<option value= "o-">O-</option>
							<input type="submit" name="search" value="Search">
						</select>
					</form>
					<hr>
				</div>
				<!-- checks if array list is not empty and display the results in table-->
				<c:if test="${not empty urlist}">
					<table border = 1>
						<tr>
							<td>FullName</td>
							<td>Blood Group</td>
							<td>Sex</td>
							<td>DOB</td>
							<td>Phone</td>
							<td>Address</td>
							<td>Email</td>
							<td>UserName</td>
						</tr>
						<c:forEach items = "${urlist}" var = "gg">
							<tr>
								<td>${gg.fullName}</td>
								<td>${gg.bloodGroup}</td>
								<td>${gg.sex}</td>
								<td>${gg.dob}</td>
								<td>${gg.address}</td>
								<td>${gg.phone}</td>
								<td>${gg.email}</td>
								<td>${gg.userName}</td>
							</tr>
						</c:forEach>
					</table>	
				</c:if>
				<!--array list is empty condition -->
				<c:if test ="${empty urlist}">
					<p>No result found.</p>
				</c:if>
			</div><!--main-->
		<div id="footer">
			<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
		</div><!--footer-->
	</div><!--Wrap-->

</body>
</html>