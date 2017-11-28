<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*" %>



<html>
	<head>
		<title>Home</title>
	</head>

	<body>
		<% String adminName = (String)request.getAttribute("uname"); %>
		<%= "welcome "+adminName %>
	</body>
</html>