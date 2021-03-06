import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class EditUserEmail extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String user = (String)request.getSession().getAttribute("uname");
		String mail = (String)request.getParameter("email");
		String query = "update users set email = '"+mail+"' where user_name = '"+user+"'";
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			stat.executeUpdate(query);
			request.setAttribute("alertMsg","Email Changed.");
			response.sendRedirect("./UserProfile");
			//RequestDispatcher rd = request.getRequestDispatcher("./UserProfile");
			//rd.include(request, response);
		}catch(Exception e){
			request.setAttribute("alertMsg","Sorry, please try again later.");
			RequestDispatcher rd = request.getRequestDispatcher("./UserProfile");
			rd.forward(request, response);
		}
	}
}