import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserInfo extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String query = "select * from users";
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			ResultSet rs = stat.executeQuery(query);
			List<UserDto> userArr = new ArrayList<UserDto>();
			while(rs.next()){
				UserDto user = new UserDto();
				user.setFullName(rs.getString("full_name"));
				user.setBloodGroup(rs.getString("blood_group"));
				user.setSex(rs.getString("sex"));
				user.setDob(rs.getString("dob"));
				user.setAddress(rs.getString("address"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("user_name"));
				user.setPassword(rs.getString("password"));
				userArr.add(user);
			}
			request.setAttribute("urlist",userArr);
			RequestDispatcher rd = request.getRequestDispatcher("./UserInfo.jsp");
			rd.include(request,response);
		}catch(Exception e){
			out.println("Error: "+ e.getMessage());
		}
	}
}