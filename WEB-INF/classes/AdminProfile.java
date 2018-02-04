import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminProfile extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = (String)request.getSession().getAttribute("uname");
		if(name != null){
			String query = "select * from admins where user_name = '"+name+"'";
			try{
				Connection cn = MySqlConnector.getConnection();
				Statement stat = cn.createStatement();
				ResultSet rs = stat.executeQuery(query);
				while(rs.next()){
					request.setAttribute("full_name",rs.getString("full_name"));
					request.setAttribute("user_name",rs.getString("user_name"));
					request.setAttribute("password",rs.getString("password"));
					request.setAttribute("email",rs.getString("email"));
					request.setAttribute("address",rs.getString("address"));
					request.setAttribute("phone",rs.getString("phone"));
				}
				RequestDispatcher rd = request.getRequestDispatcher("./AdminProfile.jsp");
				rd.include(request,response);
			}catch(Exception e){
				request.setAttribute("alertMsg","Sorry, please try again later.");
				RequestDispatcher rd = request.getRequestDispatcher("");
				rd.include(request,response);
			}	
		}else{
			response.sendRedirect("./blood.jsp");
		}
		
	}
}