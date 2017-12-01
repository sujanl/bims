import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserRegister extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		RequestDispatcher rd;
		String fullName = (String)request.getParameter("fullName");
		String sex = (String)request.getParameter("sex");
		String bloodGroup = (String)request.getParameter("bloodGroup");
		String dob = (String)request.getParameter("dob");
		String address = (String)request.getParameter("address");
		String phone = (String)request.getParameter("phone");
		String email = (String)request.getParameter("email");
		String userName = (String)request.getParameter("userName");
		String password = (String)request.getParameter("password");
		String query = "insert into users(full_name, blood_group, sex, dob, address, phone, user_name, email, password) values('"+fullName+"','"+bloodGroup+"','"+sex+"','"+dob+"','"+address+"','"+phone+"','"+userName+"','"+email+"','"+password+"')";
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			stat.executeUpdate(query);
			//need to redirect to some other servlets
			//out.println("<h3>Register Completed. Thank You!!</h3><a href = "+"./login.jsp"+">Login Now</a><br>");
			rd=request.getRequestDispatcher("./login.jsp");
			request.setAttribute("alertMsg","Registration Successfull! Thank you.");
			rd.include(request,response);
		}catch(Exception e){
			//out.println("<h2>Sorry!!Register Unsuccessfull.</h3><br>Error:"+e.getMessage());
			rd=request.getRequestDispatcher("./register.jsp");
			request.setAttribute("alertMsg","Registration Unsuccess full due to "+e.getMessage());
			rd.include(request,response);
		}
	}
}