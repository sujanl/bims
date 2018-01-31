import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userName = (String)request.getParameter("userName");
		String password = (String)request.getParameter("password");
		String userQuery = "SELECT * from users where user_name ='"+userName+"' and password = '"+password+"'";
		String adminQuery = "SELECT * from admins where user_name='"+userName+"'and password = '"+password+"'";
		RequestDispatcher rd;
		try{
			HttpSession session = request.getSession();
			Connection cn = MySqlConnector.getConnection();
			Statement stat1 = cn.createStatement();
			Statement stat2 = cn.createStatement();
			ResultSet rsUser, rsAdmin;
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
				request.setAttribute("alertMsg", "Username or password is incorrect");
				rd=request.getRequestDispatcher("./login.jsp");
				rd.include(request,response);
			}
		} catch(Exception e){
			request.setAttribute("alertMsg", "Sorry, something went wrong. Please try again later.");
			rd=request.getRequestDispatcher("./login.jsp");
			rd.include(request,response);
		}
	}
}