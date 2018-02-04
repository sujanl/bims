import java.io.*;
import javax.servlet.*; 
import javax.servlet.http.*;
import java.sql.*;

public class EditBank extends HttpServlet { 
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException {
		String bank_name = (String)request.getParameter("id");
		String name = (String)request.getParameter("name");
		String location = (String)request.getParameter("location");
		String contact = (String)request.getParameter("contact");
		String email = (String)request.getParameter("email");
		String query = "update bloodbank set name = '"+name+"', location = '"+location+"', contact = '"+contact+"', email = '"+email+"' where name = '"+bank_name+"'";
		try{
			Connection cn = MySqlConnector.getConnection();
			try{
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
				request.setAttribute("alertMsg","Saved.");
				response.sendRedirect("./AdminBloodBank");
				//RequestDispatcher rd = request.getRequestDispatcher("./AdminBloodBank");
				//rd.forward(request, response);	
			}catch(Exception e){
				request.setAttribute("alertMsg","please try again later.");
				response.sendRedirect("./AdminHome.jsp");
				//RequestDispatcher rd = request.getRequestDispatcher("./AdminHome.jsp");
				//rd.forward(request, response);	
			}

		}catch(Exception e){
			request.setAttribute("alertMsg","please try again later.");
			response.sendRedirect("./AdminHome.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("./AdminHome.jsp");
			//rd.forward(request, response);	
		}
		
	} 
}
