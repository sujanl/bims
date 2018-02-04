<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>

<% String message = (String)request.getAttribute("alertMsg");
	request.removeAttribute("alertMsg");
%>

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
							<li><a href = "AdminProfile.jsp">${uname}</a></li>
							<li><a href="./Logout" class="button">Logout</a></li>
						</ul>
				</div><!--user-->	
			</div><!--header-->
			<div id = "main">
				<div id="heading">
					<h1>User Information</h1>
				</div><!--heading-->
				<h3>Search Users</h3>
				<div id="bsearch">
					<form name="userSearch" method="post" action="./UserSearch">
						<label>Search By:</label><br>
						<select name="type">
							<option value="full_Name">Full Name</option>
							<option value="blood_group">Blood Group</option>
							<option value="sex">Sex</option>
							<option value="adddress">Address</option>	
							<option value="phone">Phone</option>
							<option value="user_name">UserName</option>
							<option value="email">Email</option>
						</select>
						<input type="text" name="key">
						<input type="submit" value="Search">
					</form>
					<hr>
				</div>
				<h3>List of all Users:</h3>
				<c:if test =  "${not empty urlist}">
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
							<td>Password</td>
							<td>Action</td>
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
								<td><a href="./UserDelete?id=${gg.userName}">Delete</a></td>		
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