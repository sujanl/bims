import java.sql.*;

public class DBCreator{
	public static void main(String[] any){
		try{
			Statement stat = null;
			Connection cn = null;
			String com="com.mysql.jdbc.Driver";
			DBCreator.createDb(stat, cn, com);
			DBCreator.createTables(stat, cn, com);
			if(cn == null){
				System.out.println("Initaial process is completed.");
			}
			else{
				System.out.println("Unable to complete initail process.");
			}
		}catch(Exception e){
			System.out.println("Unable to complete initail process.\nError: "+e.getMessage());
		}
	}
	//create database
	public static Connection createDb(Statement stat, Connection cn, String com){
		String url="jdbc:mysql://localhost:3306/mysql";
		String dbQ = "CREATE DATABASE bims";
		try{
			Class.forName(com);
			cn=DriverManager.getConnection(url,"root","");
			stat = cn.createStatement();
			stat.executeUpdate(dbQ);
			System.out.println("Database 'bims' is created");
			return cn;
		}catch(Exception e){
			System.out.println("Unable to create Database. Error: "+e.getMessage());
			return cn;
		}
	}

	//create required tables
	public static Connection createTables(Statement stat, Connection cn, String com){
		String url="jdbc:mysql://localhost:3306/bims";
		String user_table = "CREATE TABLE users(full_name VARCHAR(30), blood_group VARCHAR(30), sex VARCHAR(8), dob VARCHAR(30), address VARCHAR(30), phone VARCHAR(30), user_name VARCHAR(30), email VARCHAR(40), password VARCHAR(30), primary key(user_name));";
		String admin_table = "CREATE TABLE admins(full_name VARCHAR(30), address VARCHAR(30), phone VARCHAR(30), email VARCHAR(30), user_name VARCHAR(40), password VARCHAR(30), primary key(user_name))";
		String blood_bank_table = "CREATE TABLE bloodbank(name VARCHAR(30), location VARCHAR(30), contact VARCHAR(30), email VARCHAR(30))";
		String admin_data = "INSERT into admins(user_name, password)values('admin','admin');";
		try{
			Class.forName(com);
			cn=DriverManager.getConnection(url,"root","");
			stat = cn.createStatement();
			//crate user table
			stat.executeUpdate(user_table);
			System.out.println("'users' table created");
			
			//create admin table
			stat.executeUpdate(admin_table);
			System.out.println("'admins' table created");

			//create  table for blood banks
			stat.executeUpdate(blood_bank_table);
			System.out.println("'bloodbank' table created");
			
			//add default admin account
			stat.executeUpdate(admin_data);
			System.out.println("****************************\nNOTE: DEFAULT ADMIN ACCOUNT:\nUSERNAME:admin\nPASSWORD:admin\n****************************");

			return cn;
		}catch(Exception e){
			System.out.println("Unable to create table. Error: "+e.getMessage());
			return cn;
		}
	}
}