import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BloodBank extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String query = "select * from bloodbank" ;
		try{
			Connection cn = MySqlConnector.getConnection();
			Statement stat = cn.createStatement();
			ResultSet rs = stat.executeQuery(query);
			List<BankDto> bankArr = new ArrayList<BankDto>();
			while(rs.next()){
				BankDto bank = new BankDto();
				bank.setName(rs.getString("name"));
				bank.setLocation(rs.getString("location"));
				bank.setContact(rs.getString("contact"));
				bank.setEmail(rs.getString("email"));
				bankArr.add(bank);
			}
			request.setAttribute("bblist",bankArr);
			RequestDispatcher rd = request.getRequestDispatcher("./bloodbank.jsp");
			rd.include(request,response);
		}catch(Exception e){
			//out.println("Error: "+ e.getMessage());
		}
	}
}

