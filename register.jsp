<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="register.css">
</head>
<body>
	<div id="wrapper">
		<form method="POST" action="./UserRegister" onsubmit="return Validate()" name="vform" >
			<label>Full Name:</label><br>
						<input type = "text" name = "fullName" />
					</div>
						<div id="blood_div">
						<label>Blood Group:</label><br>
						<select name = "bloodGroup">
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
						<label>Sex:</label><br>
						<input type="radio" name="sex" value="male">Male<input type="radio" name="sex" value="female">Female
					</div>
					<div id="dob_div">
						<label>Date Of Birth:</label><br>
						<input type="date" name="dob" placeholder="DateOfBirth">
					</div>
					<div id="address_div">
						<label>Address:</label><br>
						<input type = "text" name = "address"/>
					</div>
			<div id="username_div">
				<label>Username</label> <br>
				<input type="text" name="userName" >
				<div id="name_error"></div>
			</div>
			<div id="phone_div">
				<label>Phone number</label> <br>
				<input type="text" name="phone" >
				<div id="phone_error"></div>
			</div>
			<div id="email_div">
				<label>Email</label> <br>
				<input type="email" name="email">
				<div id="email_error"></div>
			</div>
			<div id="password_div">
				<label>Password</label> <br>
				<input type="password" name="password">
			</div>
			<div id="pass_confirm_div">
				<label>Password confirm</label> <br>
				<input type="password" name="repassword" >
				<div id="password_error"></div>
			</div>
			<div>
			<input type="submit" name="register" value="Register">
			</div>
		</form>


</body>
</html>
<!-- adding Javascript -->
<script>

	// SELECTING ALL TEXT ELEMENTS
	var username = document.forms['vform']['userName'];
	var phone = document.forms['vform']['phone'];
	var email = document.forms['vform']['email'];
	var password = document.forms['vform']['password'];
	var password_confirm = document.forms['vform']['repassword'];

	// SELECTING ALL ERROR DISPLAY ELEMENTS
	var name_error = document.getElementById('name_error');
	var phone_error = document.getElementById('phone_error');
	var email_error = document.getElementById('email_error');
	var password_error = document.getElementById('password_error');

	// SETTING ALL EVENT LISTENERS
	username.addEventListener('blur', nameVerify, true);
	phone.addEventListener('blur', phoneVerify, true);
	email.addEventListener('blur', emailVerify, true);
	password.addEventListener('blur', passwordVerify, true);

	// validation function
	function Validate() {
		// validate username
		if (username.value == "") {
			username.style.border = "1px solid red";
			document.getElementById('username_div').style.color = "red";
			name_error.textContent = "Username is required";
			username.focus();
			return false;
		}
		// validate username
		if (username.value.length < 3) {
			username.style.border = "1px solid red";
			document.getElementById('username_div').style.color = "red";
			name_error.textContent = "Username must be at least 3 characters";
			username.focus();
			return false;
		}
		// validate phone
		if (phone.value == "") {
			phone.style.border = "1px solid red";
			document.getElementById('phone_div').style.color = "red";
			phone_error.textContent = "phone no. is required";
			phone.focus();
			return false;
		}
		// validate phone
		if (phone.value.length < 10) {
			phone.style.border = "1px solid red";
			document.getElementById('phone_div').style.color = "red";
			phone_error.textContent = "Phone no. must be at least 10 characters";
			phone.focus();
			return false;
		}
		// validate email
		if (email.value == "") {
			email.style.border = "1px solid red";
			document.getElementById('email_div').style.color = "red";
			email_error.textContent = "Email is required";
			email.focus();
			return false;
		}
		// validate password
		if (password.value == "") {
			password.style.border = "1px solid red";
			document.getElementById('password_div').style.color = "red";
			password_confirm.style.border = "1px solid red";
			password_error.textContent = "Password is required";
			password.focus();
			return false;
		}

		// check if the two passwords match
		if (password.value != password_confirm.value) {
			password.style.border = "1px solid red";
			document.getElementById('pass_confirm_div').style.color = "red";
			password_confirm.style.border = "1px solid red";
			password_error.innerHTML = "The two passwords do not match";
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