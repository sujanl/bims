import java.sql.*;
import java.util.*;

public class DBCreator{
	public static void main(String[] any){
		try{
			Statement stat = null;
			Connection cn = null;
			String com="com.mysql.jdbc.Driver";
			DBCreator.createDb(stat, cn, com);
			DBCreator.createTables(stat, cn, com);
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
		try{
			Class.forName(com);
			cn=DriverManager.getConnection(url,"root","");
			stat = cn.createStatement();

			//create user table
			try{
				stat.executeUpdate(user_table);
				System.out.println("'users' table created");
			}catch(Exception e){
				System.out.println("Filed to create table 'users'.  Error: "+e.getMessage());
			}
					
			//create admin table
			try{
				stat.executeUpdate(admin_table);
				System.out.println("'admins' table created");
			}catch(Exception e){
				System.out.println("Filed to create tablr 'admins'.  Error: "+e.getMessage());
			}
			
			//create  table for blood banks
			try{
				stat.executeUpdate(blood_bank_table);
				System.out.println("'bloodbank' table created");
			}catch(Exception e){
				System.out.println("Filed to create table 'bloodbank'.  Error: "+e.getMessage());
			}
			
			//add default admin account
			Scanner sc = new Scanner(System.in);
			System.out.println("Create Admin Account\nUsername:");
			String un = sc.nextLine();
			System.out.println("Password:");
			String pw = sc.nextLine();
			String admin_data = "INSERT into admins(user_name, password)values('"+un+"','"+pw+"');";
			stat.executeUpdate(admin_data);
			System.out.println("Account created.");
			return cn;
		}catch(Exception e){
			System.out.println("Unable to create table. Error: "+e.getMessage());
			return cn;
		}
	}
}
