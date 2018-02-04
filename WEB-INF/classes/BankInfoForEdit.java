import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BankInfoForEdit extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		try{	
			String bname = (String)request.getParameter("id");
			String query = "select * from bloodbank where name ='"+bname+"'";
			Connection cn = MySqlConnector.getConnection();
			try{
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
				request.setAttribute("bankinfo",bankArr);
				RequestDispatcher rd = request.getRequestDispatcher("./EditBank.jsp");
				rd.include(request,response);
			}catch(Exception e){
				request.setAttribute("alertMsg","Sorry, please try again later.");
				RequestDispatcher rd = request.getRequestDispatcher("./AdminBloodBank");
				rd.include(request,response);
			}
		}catch(Exception e){
			request.setAttribute("alertMsg","Sorry, please try again later. Cannont connect now.");
			RequestDispatcher rd = request.getRequestDispatcher("./AdminBloodBank");
			rd.include(request,response);
		}
	}
}
