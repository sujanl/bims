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
						<li><a href = "./UserProfile">${uname}</a></li>
						<li><a href="./Logout" class="button">logout</a></li>			
					</ul>
				</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Change Password</h1>
				</div><!--heading-->
 	
				<form method="POST" action="./EditUserPassword" onsubmit="return Validate()" name="vform" >
					<div id="old_password">
						<label>Old Password</label> <br>
						<input type="password" name="old_password" class="textinput"><br>
						<div id="old_password_error"></div>
					</div>
					<div id="password_div">
						<label>New Password</label> <br>
						<input type="password" name="new_password" class="textinput">
					</div>
					<div id="pass_confirm_div">
						<label>Retype New Password</label> <br>
						<input type="password" name="repassword" class="textinput">
						<div id="password_error"></div>
					</div><br>
					<div>
					<input type="submit" name="change" value="Change" class="btn">
					</div>
				</form>
		
			</div><!--main-->
			<div id="footer">
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->


</body>
</html>

<!-- adding Javascript -->
<script>

	// SELECTING ALL TEXT ELEMENTS
	var old_pass = document.forms['vform']['old_password'];

	var password = document.forms['vform']['new_password'];
	var password_confirm = document.forms['vform']['repassword'];

	// SELECTING ALL ERROR DISPLAY ELEMENTS
	var password_error = document.getElementById('password_error');

	// SETTING ALL EVENT LISTENERS
	password.addEventListener('blur', passwordVerify, true);

	// validation function
	function Validate() {
		// validate password
		if(old_pass.value !== "<%= request.getAttribute("pass") %>"){
			document.getElementById("old_password_error").textContent = "password is incorrect";
			old_password.focus();
			return false;
		}

		// validate password
		if (password.value == "") {
			password.style.border = "1px solid red";
			document.getElementById('password_div').style.color = "black";
			password_confirm.style.border = "1px solid red";
			password_error.textContent = "Password is required";
			password.focus();
			return false;
		}

		// check if the two passwords match
		if (password.value != password_confirm.value) {
			password.style.border = "1px solid red";
			document.getElementById('pass_confirm_div').style.color = "black";
			password_confirm.style.border = "1px solid red";
			password_error.innerHTML = "The two passwords do not match";
			return false;
		}
		
	}

	// event handler functions
	function passwordVerify() {
		if(old_password.value == "<%= request.getAttribute("pass") %>"){
			return true;
		}
		if (password.value != "") {
			password.style.border = "1px solid #5e6e66";
			document.getElementById('pass_confirm_div').style.color = "#5e6e66";
			document.getElementById('password_div').style.color = "#5e6e66";
			password_error.innerHTML = "";
			return true;
		}

		if (password.value == password_confirm.value) {
			password.style.border = "1px solid #5e6e66";
			document.getElementById('pass_confirm_div').style.color = "#5e6e66";
			password_error.innerHTML = "";
			return true;
		}
	}

</script>