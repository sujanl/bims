<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*" %>

<html>
	<head>
		<title>Home</title>
	</head>

	<body>

		<%
			String userName = (String)session.getAttribute("uname");
		%>
		<%= "welcome "+userName %>
		
	</body>
</html>