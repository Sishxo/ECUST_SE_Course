package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DAO.ConnectionPool;
import bean.Teacher;
import bean.User;

public class UserDAO {
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	ConnectionPool cp;
	public UserDAO(){
			ConnectionPool cp=new ConnectionPool(5);
			this.cp=cp;
	}
	
	/*public Connection getConnection() throws SQLException{
		return DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
	}*/
	
	public void add(User user){
		new Thread(()->{
			/*try{
				Class.forName(DRIVER_NAME);
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}*/
			String sql="insert into user values(null,?,?,?,?,?,?,?,?,?)";
			Connection c=cp.getConnection();
			try(//Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps= c.prepareStatement(sql);	){
			//Connection c=cp.getConnection();
				ps.setString(1,user.UserName);
				ps.setString(2,user.DialNumber);
				ps.setString(3,user.Email);
				ps.setString(4,user.Password);
				ps.setString(5,user.Gender);
				ps.setString(6,user.College);
				ps.setString(7,user.Major);
				ps.setString(8,user.Grade);
				ps.setInt(9,user.IdentityID);
				
				ps.execute();
				
				/*ResultSet rs=ps.getResultSet();
				while(rs.next()){
					int id=rs.getInt(1);
					user.UserId=id;
				}*/
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			cp.returnConnection(c);
		}).start();
	}
	public void roleupdate(User user){
		//new Thread(()->{
			String sql="update user set IdentityID=? where UserId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.IdentityID);
				ps.setInt(2,user.UserId);
				ps.execute();
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	public void update(User user){
		//new Thread(()->{
			String sql="update user set UserName=?,DialNumber=?,Email=?,Password=?,Gender=?,College=?,Major=?,Grade=? where UserId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.UserId);
				ps.setString(1,user.UserName);
				ps.setString(2,user.DialNumber);
				ps.setString(3,user.Email);
				ps.setString(4,user.Password);
				ps.setString(5,user.Gender);
				ps.setString(6,user.College);
				ps.setString(7,user.Major);
				ps.setString(8,user.Grade);
				//ps.setInt(10,user.IdentityID);
				ps.setInt(9, user.UserId);
				ps.execute();
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	
	public void delete(int id){
		new Thread(()->{
			String sql="delete from user where UserId=?";
			Connection c=cp.getConnection();
			try(PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,id);
				
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
			cp.returnConnection(c);
		}).start();
	}
	
	public User get(int id){
		User user=new User();
		//new Thread(()->{
			String sql="select * from user where UserId=?";
			try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,id);	
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					String UserName=rs.getString("UserName");
					String DialNumber=rs.getString("DialNumber");
					String Email=rs.getString("Email");
					String Password=rs.getString("Password");
					String Gender=rs.getString("Gender");
					String College=rs.getString("College");
					String Major=rs.getString("Major");
					String Grade=rs.getString("Grade");
					int IdentityID=rs.getInt("IdentityID");
					user.UserId=id;
					user.UserName=UserName;
					user.DialNumber=DialNumber;
					user.Email=Email;
					user.Password=Password;
					user.Gender=Gender;
					user.College=College;
					user.Major=Major;
					user.Grade=Grade;
					user.IdentityID=IdentityID;
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
		return user;
	}
	
	public User getByDialNumber(String DialNumber){
		User user=new User();
		//new Thread(()->{
		try{
			Class.forName(DRIVER_NAME);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
			String sql="select * from user where DialNumber=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setString(1,DialNumber);	
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					int UserId=rs.getInt("UserId");
					String UserName=rs.getString("UserName");
					String Email=rs.getString("Email");
					String Password=rs.getString("Password");
					String Gender=rs.getString("Gender");
					String College=rs.getString("College");
					String Major=rs.getString("Major");
					String Grade=rs.getString("Grade");
					int IdentityID=rs.getInt("IdentityID");
					user.UserId=UserId;
					user.DialNumber=DialNumber;
					user.UserName=UserName;
					user.DialNumber=DialNumber;
					user.Email=Email;
					user.Password=Password;
					user.Gender=Gender;
					user.College=College;
					user.Major=Major;
					user.Grade=Grade;
					user.IdentityID=IdentityID;
				}
				//System.out.println(user.DialNumber);
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
		//System.out.println(user.DialNumber);
		return user;
	}
	
	public List getall(){
		String sql="select * from user";
		ResultSet rs=null;
		List<User> userlist=new ArrayList<User>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);){
			rs=ps.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setUserId(rs.getInt("user.UserId"));
				user.setDialNumber(rs.getString("DialNumber"));
				user.setEmail(rs.getString("Email"));
				user.setGender(rs.getString("Gender"));
				user.setCollege(rs.getString("College"));
				user.setMajor(rs.getString("Major"));
				user.setGrade(rs.getString("Grade"));
				user.setUserName(rs.getString("UserName"));
				user.setPassword(rs.getString("Password"));
				user.setIdentityID(rs.getInt("IdentityID"));
				userlist.add(user);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}	
		//System.out.println(userlist);
		return userlist;
	}
}