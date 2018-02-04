<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>

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
						</li>				
					</ul>
				</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Change Email</h1>
				</div><!--heading-->
				<form method="POST" action="./EditUserEmail" onsubmit="return Validate()" name="vform" >
					<div id="email_div">
						<label>Old Email: </label><%= request.getAttribute("email") %><br>
					</div>
					<br>
					<div id="email_div">
						<label>New Email</label> <br>
						<input type="email" name="email" class="textinput">
						<div id="email_error"></div>
					</div>
					<input type="submit" value="Change" class="btn">	
				</form>
			</div><!--main-->
			<div id="footer">
				<a href="UserHome.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->


</body>
</html>
<!-- adding Javascript -->
<script>

	var email = document.forms['vform']['email'];
	
	var email_error = document.getElementById('email_error');
	
	email.addEventListener('blur', emailVerify, true);
	
	// validation function
	function Validate() {
		// validate email
		if (email.value == "") {
			email.style.border = "1px solid red";
			document.getElementById('email_div').style.color = "black";
			email_error.textContent = "Email is required";
	 		email.focus();
			return false;
		}
	}
		
	// event handler functions

	function emailVerify() {
		if (email.value != "") {
			email.style.border = "1px solid #5e6e66";
			document.getElementById('email_div').style.color = "#5e6e66";
			email_error.innerHTML = "";
			return true;
		}
	
	}

</script>