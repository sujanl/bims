import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserPassword extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		String name = (String)request.getSession().getAttribute("uname");
		String query = "select password from users where user_name='"+name+"'";
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			ResultSet rs = stat.executeQuery(query);
			while(rs.next()){
				request.setAttribute("pass",rs.getString("password"));
			}
			RequestDispatcher rd = request.getRequestDispatcher("./EditUserPassword.jsp");
			rd.include(request,response);
		}catch(Exception e){
			request.setAttribute("alertMsg","Sorry, Please try again later.");
			RequestDispatcher rd = request.getRequestDispatcher("./UserProfile");
			rd.include(request,response);
		}
	}
}