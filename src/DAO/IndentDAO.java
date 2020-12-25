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
import bean.Student;
import bean.User;
import bean.Indent;

public class IndentDAO {
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	ConnectionPool cp;
	
	public IndentDAO(){
		ConnectionPool cp=new ConnectionPool(5);
		this.cp=cp;
	}
	public void add(Indent indent){
		new Thread(()->{
			/*try{
				Class.forName(DRIVER_NAME);
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}*/
			String sql="insert into indent values(0,?,?,?)";
			Connection c=cp.getConnection();
			try(//Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps= c.prepareStatement(sql);	){
			//Connection c=cp.getConnection();
				ps.setInt(1,indent.TeacherId);
				ps.setInt(2,indent.StudentId);
				ps.setInt(3, 0);
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
	
	public void accept(Indent indent){
		//new Thread(()->{
			String sql="update indent set Status=1 where TeacherId=? and StudentId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1, indent.TeacherId);
				ps.setInt(2, indent.StudentId);
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	public void refuse(Indent indent){
		//new Thread(()->{
			String sql="update indent set Status=-1 where TeacherId=? and StudentId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1, indent.TeacherId);
				ps.setInt(2, indent.StudentId);
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	public void cancel(Indent indent){
		String sql="delete from indent where TeacherId=? and StudentId=?";
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);){
			ps.setInt(1, indent.TeacherId);
			ps.setInt(2, indent.StudentId);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}