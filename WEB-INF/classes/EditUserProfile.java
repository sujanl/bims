import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EditUserProfile extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try{
			RequestDispatcher rd;
			//HttpSession session = request.getSession();
			String uname = (String)request.getSession().getAttribute("uname");
			String fullName = (String)request.getParameter("fullName");
			String sex = (String)request.getParameter("sex");
			String bloodGroup = (String)request.getParameter("bloodGroup");
			String dob = (String)request.getParameter("dob");
			String address = (String)request.getParameter("address");
			String phone = (String)request.getParameter("phone");
			String query = "update users set full_name = '"+fullName+"', sex = '"+sex+"', blood_group = '"+bloodGroup+"', dob = '"+dob+"', address = '"+address+"', phone = '"+phone+"'  where user_name = '"+uname+"'";
			try{
				Connection cn = MySqlConnector.getConnection();
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
				request.setAttribute("alertMsg","Saved.");
				response.sendRedirect("./UserProfile");
				//rd=request.getRequestDispatcher("./UserProfile");
				//rd.include(request,response);
			}catch(Exception e){
				request.setAttribute("alertMsg","Couldn't Save. Due to: "+e.getMessage());
				rd=request.getRequestDispatcher("./UserProfile");
				rd.include(request,response);
			}
		}catch(Exception e){
			//out.println("Error");
		}
	}
}