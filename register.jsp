<% String message = (String)request.getAttribute("alertMsg");%>

<script type="text/javascript">
    var msg = "<%=message%>";
    if(msg!= "null"){
    	alert(msg);	
    }
</script>

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
					<li>Already have an acount?<a href="login.jsp" class="button">Login</a></li>
				</ul>
			</div><!--user-->
		</div><!--header-->
			<div id="main">
				<div id="heading">
					<h1>Register</h1>
				</div><!--heading-->
				<div id="register">
		<form method="POST" action="./UserRegister" onsubmit="return Validate()" name="vform" >
			<div id="fullname_div">
			<label>Full Name</label><br>
						<input type = "text" name = "fullName" class="textinput" />
						<div id="fullname_error"></div>
					</div>
						<div id="blood_div">
						<label>Blood Group</label><br>
						<select name = "bloodGroup" class="textinput">
							<option value= "a+">A+</option>
							<option value= "a-">A-</option>
							<option value= "b+">B+</option>
							<option value= "b-">B-</option>
							<option value= "ab+">AB+</option>
							<option value= "ab-">AB-</option>
							<option value= "o+">O+</option>
							<option value= "o-">O-</option>
						</select>
					</div>
					<div id="sex_div">
						<label>Sex</label><br>
						<input type="radio" name="sex" value="male">Male <input type="radio" name="sex" value="female">Female
					</div>
					<div id="dob_div">
						<label>Date Of Birth</label><br>
						<input type="date" name="dob" placeholder="DateOfBirth" class="textinput">
					</div>
					<div id="address_div">
						<label>Address:</label><br>
						<input type = "text" name = "address" class="textinput" />
						<div id="address_error"></div>
					</div>
			<div id="username_div">
				<label>Username</label> <br>
				<input type="text" name="userName" class="textinput">
				<div id="name_error"></div>
			</div>
			<div id="phone_div">
				<label>Phone number</label> <br>
				<input type="text" name="phone" class="textinput">
				<div id="phone_error"></div>
			</div>
			<div id="email_div">
				<label>Email</label> <br>
				<input type="email" name="email" class="textinput">
				<div id="email_error"></div>
			</div>
			<div id="password_div">
				<label>Password</label> <br>
				<input type="password" name="password" class="textinput">
			</div>
			<div id="pass_confirm_div">
				<label>Password confirm</label> <br>
				<input type="password" name="repassword" class="textinput">
				<div id="password_error"></div>
			</div><br>
			<div>
			<input type="submit" name="register" value="Register" class="btn">
			</div>
		</form>
		<br>Click <a href="login.jsp">HERE</a> to login.
		</div><!--register-->
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
	var fullname = document.forms['vform']['fullName'];
	var address = document.forms['vform']['address'];
	var username = document.forms['vform']['userName'];
	var phone = document.forms['vform']['phone'];
	var email = document.forms['vform']['email'];
	var password = document.forms['vform']['password'];
	var password_confirm = document.forms['vform']['repassword'];

	// SELECTING ALL ERROR DISPLAY ELEMENTS
	var fullname_error = document.getElementById('fullname_error');
	var address_error = document.getElementById('address_error');
	var name_error = document.getElementById('name_error');
	var phone_error = document.getElementById('phone_error');
	var email_error = document.getElementById('email_error');
	var password_error = document.getElementById('password_error');

	// SETTING ALL EVENT LISTENERS
	fullname.addEventListener('blur', fullnameVerify, true);
	address.addEventListener('blur', addressVerify, true);
	username.addEventListener('blur', nameVerify, true);
	phone.addEventListener('blur', phoneVerify, true);
	email.addEventListener('blur', emailVerify, true);
	password.addEventListener('blur', passwordVerify, true);

	// validation function
	function Validate() {
		// validate username
		if (username.value == "") {
			username.style.border = "1px solid red";
			document.getElementById('username_div').style.color = "black";
			name_error.textContent = "Username is required";
			username.focus();
			return false;
		}
		// validate username
		if (username.value.length < 3 || username.value.length > 15) {
			username.style.border = "1px solid red";
			document.getElementById('username_div').style.color = "black";
			name_error.textContent = "Username must be at least 3 characters and less than 15 characters.";
			username.focus();
			return false;
		}
			/* validate username
		if (username.value.length > 15) {
			username.style.border = "1px solid red";
			document.getElementById('username_div').style.color = "black";
			name_error.textContent = "Username must be less than 15 characters";
			username.focus();
			return false;
		}*/
			// validate fullname
		if (fullname.value == "") {
			fullname.style.border = "1px solid red";
			document.getElementById('fullname_div').style.color = "black";
			fullname_error.textContent = "Full Name is required";
			fullname.focus();
			return false;
		}
		// validate fullname
		if (fullname.value.length < 8 || fullname.value.length > 30) {
			fullname.style.border = "1px solid red";
			document.getElementById('fullname_div').style.color = "black";
			fullname_error.textContent = "Full name must be at least 8 characters and less than 30 characters.";
			fullname.focus();
			return false;
		}
			/* validate fullname
		if (fullname.value.length > 30) {
			fullname.style.border = "1px solid red";
			document.getElementById('fullname_div').style.color = "black";
			fullname_error.textContent = "Full name must be less than 30 characters";
			fullname.focus();
			return false;
		}*/
		// validate phone
		if (phone.value == "") {
			phone.style.border = "1px solid red";
			document.getElementById('phone_div').style.color = "black";
			phone_error.textContent = "phone no. is required";
			phone.focus();
			return false;
		}
		// validate phone
		if (phone.value.length < 10 || phone.value.length > 30) {
			phone.style.border = "1px solid red";
			document.getElementById('phone_div').style.color = "black";
			phone_error.textContent = "Phone no. must be at least 10 characters and less than 30 characters.";
			phone.focus();
			return false;
		}
		/* validate phone
		if (phone.value.length > 30) {
			phone.style.border = "1px solid red";
			document.getElementById('phone_div').style.color = "black";
			phone_error.textContent = "Phone no. must be less than 30 characters";
			phone.focus();
			return false;
		}*/
		// validate email
		if (email.value == "") {
			email.style.border = "1px solid red";
			document.getElementById('email_div').style.color = "black";
			email_error.textContent = "Email is required";
			email.focus();
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
		//validate address
		if (address.value == "") {
			address.style.border = "1px solid red";
			document.getElementById('address_div').style.color = "black";
			address_error.textContent = "Address is required";
			address.focus();
			return false;
		}
		// validate address
		if (address.value.length < 5) {
			address.style.border = "1px solid red";
			document.getElementById('address_div').style.color = "black";
			address_error.textContent = "address must be at least 5 characters";
			address.focus();
			return false;
		}
			// validate address
		if (address.value.length > 30 || address.value == "" || address.value.length < 5 ) {
			address.style.border = "1px solid red";
			document.getElementById('address_div').style.color = "black";
			address_error.textContent = "Address must be less than 30 characters";
			address.focus();
			return false;
		}
	}

	// event handler functions
	function nameVerify() {
		if (username.value != "") {
			username.style.border = "1px solid #5e6e66";
			document.getElementById('username_div').style.color = "#5e6e66";
			name_error.innerHTML = "";
			return true;
		}
	}
	function fullnameVerify() {
		if (fullname.value != "") {
			fullname.style.border = "1px solid #5e6e66";
			document.getElementById('fullname_div').style.color = "#5e6e66";
			fullname_error.innerHTML = "";
			return true;
		}
	}
	function addressVerify() {
		if (address.value != "") {
			address.style.border = "1px solid #5e6e66";
			document.getElementById('address_div').style.color = "#5e6e66";
			address_error.innerHTML = "";
			return true;
		}
	}
		function phoneVerify() {
		if (phone.value != "") {
			phone.style.border = "1px solid #5e6e66";
			document.getElementById('phone_div').style.color = "#5e6e66";
			phone_error.innerHTML = "";
			return true;
		}
	}

	function emailVerify() {
		if (email.value != "") {
			email.style.border = "1px solid #5e6e66";
			document.getElementById('email_div').style.color = "#5e6e66";
			email_error.innerHTML = "";
			return true;
		}
	}
	function passwordVerify() {
		if (password.value != "") {
			password.style.border = "1px solid #5e6e66";
			document.getElementById('pass_confirm_div').style.color = "#5e6e66";
			document.getElementById('password_div').style.color = "#5e6e66";
			password_error.innerHTML = "";
			return true;
		}

		if (password.value === password_confirm.value) {
			password.style.border = "1px solid #5e6e66";
			document.getElementById('pass_confirm_div').style.color = "#5e6e66";
			password_error.innerHTML = "";
			return true;
		}
	}

</script>