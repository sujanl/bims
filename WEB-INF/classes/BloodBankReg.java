import java.io.*;
import javax.servlet.*; 
import javax.servlet.http.*;
import java.sql.*;

public class BloodBankReg extends HttpServlet { 
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException { 
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String Name = (String)request.getParameter("name");
		String Location = (String)request.getParameter("location");
		String Contact = (String)request.getParameter("contact");
		String Email = (String)request.getParameter("email");
		String query = "insert into bloodbank(name, location, contact, email) values('"+Name+"','"+Location+"','"+Contact+"','"+Email+"')";
		try{
			Connection cn = MySqlConnector.getConnection();
			try{
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
				request.setAttribute("alertMsg","Registration Successfull.");
			}catch(Exception e){
				request.setAttribute("alertMsg","Registration Unsuccessfull.");
				//out.println("Error: Submission Failed!!\n" + e.getMessage());
			}

		}catch(Exception e){
			request.setAttribute("alertMsg","Registration unsuccessfull.");
			//out.println("Connection Failed: \n" + e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("./AdminHome.jsp");
		rd.include(request, response);	
	} 
}
