<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*" %>



<html>
	<head>
		<title>Home</title>
	</head>

	<body>
		<% String adminName = (String)session.getAttribute("uname"); %>
		

		<div id="Wrap">
			<div  id="header">
				<div id="logo">
					<a href="AdminHome.jsp"><img src="images/logo.jpg" height="100px" width="200px;"></a>
				</div><!--logo-->
				<div id="navigation">
					<div class="menu">
						<ul>
							<li></li>
						</ul>
					</div><!--menu-->
				</div><!--navigation-->
				<div id="user">
						<ul>
							<li><a href = "profile.jsp"><%= adminName %></a></li>
							<li><a href="./UserLogout" class="button">Logout</a></li>
						</ul>
				</div><!--user-->	
			</div><!--header-->
			

			
			<div id="footer">
				<a href="AdminHome.jsp">BIMS</a>  @2017 Blood Info Management System 
			</div><!--footer-->
		</div><!--Wrap-->
	</body>
</html>