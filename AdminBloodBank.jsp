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
					</div><!--menu-->
				</div><!--navigation-->
				<div id="user">
						<ul>
							<li><a href = "AdminProfile.jsp">${uname}</a></li>
							<li><a href="./Logout" class="button">Logout</a></li>
						</ul>
				</div><!--user-->	
			</div><!--header-->
			<div id = "main">
				<div id="heading">
					<h1> BloodBanks</h1>
				</div><!--heading-->
				<c:if test="${not empty bblist}">
						<h3>List of all Blood Banks:</h3>
						<table border="1" width="303">
							<tr>
								<td>Name</td>
								<td>Location</td>
								<td>Contact</td>
								<td>Email</td>
							</tr>
							<c:forEach items = "${bblist}" var = "gg">
								<tr>
									<td>${gg.name}</td>
									<td>${gg.location}</td>
									<td>${gg.contact}</td>
									<td>${gg.email}</td>
									<td><a href="./DeleteBank?id=${gg.name}">Delete</a></td>
									<td><a href="">Edit</a></td>
								</tr>
							</c:forEach>
						</table>	
					</c:if>
					<!--array list is empty condition -->
					<c:if test ="${empty bblist}">
						 No bloodbank registered.
					</c:if>
			</div><!--main-->

			
			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>