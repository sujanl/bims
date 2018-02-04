<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userName = (String)session.getAttribute("uname");
%>
<% 
	if(session.getAttribute("uname") == null){
		response.sendRedirect("blood.jsp");
	}
%>



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
					<h1>Edit Profile</h1>
				</div><!--heading-->
				<c:forEach items= "${urlist}" var= "gg">
					<form method="POST" action="./EditUserProfile" onsubmit="return Validate()" name="vform" >
						<div id="fullname_div">
							<label>Full Name</label><br>
							<input type = "text" name = "fullName" value = "${gg.fullName}"class="textinput" />
							<div id="fullname_error"></div>
						</div>
						<div id="blood_div">
							<label>Blood Group</label><br>
							<select name = "bloodGroup" class="textinput">
								<option value = "${gg.bloodGroup}">${gg.bloodGroup}</option>
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
							<c:if test = "${gg.sex eq 'male'}"> 
								<input type="radio" name="sex" value="male" checked = "checked">
							</c:if>
							<c:if test = "${gg.sex ne 'male'}"> 
								<input type="radio" name="sex" value="male">
							</c:if>Male 
							<c:if test = "${gg.sex eq 'female'}"> 
								<input type="radio" name="sex" value="female" checked = "checked">
							</c:if>
							<c:if test = "${gg.sex ne'female'}"> 
								<input type="radio" name="sex" value="female">
							</c:if>Female
						</div>
						<div id="dob_div">
							<label>Date Of Birth</label><br>
							<input type="date" name="dob" placeholder="DateOfBirth" value = "${gg.dob}" class="textinput">
						</div>
						<div id="address_div">
							<label>Address:</label><br>
							<input type = "text" name = "address"  value = "${gg.address}"class="textinput" />
							<div id="address_error"></div>
						</div>
						
						<div id="phone_div">
							<label>Phone number</label> <br>
							<input type="text" name="phone" value = "${gg.phone}" class="textinput">
							<div id="phone_error"></div>
						</div>
						
						<div>
						<input type="submit" name="save" value="Save" class="btn">
						</div>
					</form>
				</c:forEach>
			</div><!--main-->
			<div id="footer">
				<a href="blood.jsp">BIMS</a>  @2017 Blood Info Management System  <a href="privacy.jsp">Privacy policies</a> | <a href="dmca.jsp">DMCA</a> | <a href="contactus.jsp">Contact us</a>
			</div><!--footer-->
	</div><!--Wrap-->

</body>
</html>



<script>

	// SELECTING ALL TEXT ELEMENTS
	var fullname = document.forms['vform']['fullName'];
	var address = document.forms['vform']['address'];
	var phone = document.forms['vform']['phone'];
	
	// SELECTING ALL ERROR DISPLAY ELEMENTS
	var fullname_error = document.getElementById('fullname_error');
	var address_error = document.getElementById('address_error');
	var phone_error = document.getElementById('phone_error');

	// SETTING ALL EVENT LISTENERS
	fullname.addEventListener('blur', fullnameVerify, true);
	address.addEventListener('blur', addressVerify, true);
	phone.addEventListener('blur', phoneVerify, true);

	// validation function
	function Validate() {		
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

	
</script>