import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserEmail extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		String name = (String)request.getSession().getAttribute("uname");
		String query = "select email from users where user_name='"+name+"'";
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			ResultSet rs = stat.executeQuery(query);
			while(rs.next()){
				request.setAttribute("email",rs.getString("email"));
			}
			
			
			RequestDispatcher rd = request.getRequestDispatcher("./EditUserEmail.jsp");
			rd.forward(request,response);
		}catch(Exception e){
			request.setAttribute("alertMsg","Sorry, Please try again later.");
			RequestDispatcher rd = request.getRequestDispatcher("./UserProfile");
			rd.forward(request,response);
		}
	}
}