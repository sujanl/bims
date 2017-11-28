import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserLogin extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userName = (String)request.getParameter("userName");
		String password = (String)request.getParameter("password");
		String userQuery = "SELECT * from users where user_name ='"+userName+"' and password = '"+password+"'";
		String adminQuery = "SELECT * from admins where user_name='"+userName+"'and password = '"+password+"'";
		try{
			HttpSession session = request.getSession();
			Connection cn = MySqlConnector.getConnection();
			Statement stat1 = cn.createStatement();
			Statement stat2 = cn.createStatement();
			ResultSet rsUser, rsAdmin;
			RequestDispatcher rd;
			rsUser = stat1.executeQuery(userQuery);
			rsAdmin = stat2.executeQuery(adminQuery);

			if(rsUser.next()){
				rd = request.getRequestDispatcher("./UserHome.jsp");
				session.setAttribute("uname",userName);
				rd.include(request , response);
			}
			else if(rsAdmin.next()){
				rd = request.getRequestDispatcher("./AdminHome.jsp");
				session.setAttribute("uname",userName);
				rd.include(request , response);
			}
			else if(!rsUser.next() && !rsAdmin.next()){
				out.println("<h3>Login UnSuccessfull. Either Username or Password is invalid. <a href = "+"./login.jsp>Please try again</a>.</h3>");		
			}
			/*
			while(rsUser.next()){
				if(userName.equals(rsUser.getString("user_name")) && password.equals(rsUser.getString("password"))){
					session.setAttribute("uName",userName);
					rd = request.getRequestDispatcher("./UserHome.jsp");
					rd.include(request, response);
					//response.sendRedirect("./UserHome.jsp");
				}
				else{
					out.println("<h3>Login UnSuccessfull. Either Username or Password is invalid. <a href = "+"./login.jsp>Please try again</a>.</h3>");
				}
			}
			while(rsAdmin.next()){
				if(userName.equals(rsAdmin.getString("user_name")) && password.equals(rsAdmin.getString("password"))){
					session.setAttribute("uName",userName);
					rd = request.getRequestDispatcher("./AdminHome.jsp");
					rd.include(request, response);
					//response.sendRedirect("./AdminHome.jsp");
				}
				else{
					out.println("<h3>Login UnSuccessfull. Either Username or Password is invalid. <a href = "+"./login.jsp>Please try again</a>.</h3>");
				}
			}
			*/
		} catch(Exception e){
			out.println("Internal Error!!"+e.getMessage());
			out.println("<br><a href = "+"./login.jsp"+">Click here to Login again<a>");
		}
	}
}