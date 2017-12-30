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
							<li><a href = "AdminProfile.jsp">${uname}</a></li>
							<li><a href="./UserLogout" class="button">Logout</a></li>
						</ul>
				</div><!--user-->	
			</div><!--header-->
			<div id = "main">
				<c:if test="${not empty urlist}">
					<table>
						<tr>
							<td>FullName</td>
							<td>Blood Group</td>
							<td>Sex</td>
							<td>DOB</td>
							<td>Phone</td>
							<td>Address</td>
							<td>Email</td>
							<td>UserName</td>
							<td>Password</td>
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
								<td>${gg.password}</td>
								<td><a href="./DeleteUser?id=${gg.userName}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>	
				</c:if>
				<!--array list is empty condition -->
				<c:if test ="${empty urlist}">
					<p>No Users found.</p>
				</c:if>
			</div><!--main-->

			
			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>