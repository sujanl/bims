import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserDelete extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("id");
		String query = "delete from users where user_name='"+name+"'"	;
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			stat.executeUpdate(query);
			request.setAttribute("alertMsg", "Delete successfull!");
			RequestDispatcher rd = request.getRequestDispatcher("/UserInfo");
			rd.forward(request, response);
		}catch(Exception e){
			//out.println(e.getMessage());
			request.setAttribute("alertMsg", "Delete Unsuccessfull!");
			RequestDispatcher rd = request.getRequestDispatcher("/UserInfo.jsp");
			rd.forward(request, response);
		}
	}
}