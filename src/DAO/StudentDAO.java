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
import bean.Teacher;
import bean.User;

public class StudentDAO {
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	ConnectionPool cp;
	
	public StudentDAO(){
		ConnectionPool cp=new ConnectionPool(5);
		this.cp=cp;
	}
	public void add(Student student){
		new Thread(()->{
			/*try{
				Class.forName(DRIVER_NAME);
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}*/
			String sql="insert into student values(?,?,?,?)";
			Connection c=cp.getConnection();
			try(//Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps= c.prepareStatement(sql);	){
			//Connection c=cp.getConnection();
				ps.setInt(1,student.UserId);
				ps.setString(2,student.KnowledgeWanted);
				ps.setInt(3, student.AcceptableFee);
				ps.setString(4, student.AvailableTime);
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
	
	public void update(Student student){
		//new Thread(()->{
			String sql="update Student set KnowledgeWanted=?,AcceptableFee=?,AvailableTime=? where UserId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(4,student.UserId);
				ps.setString(1,student.KnowledgeWanted);
				ps.setInt(2,student.AcceptableFee);
				ps.setString(3,student.AvailableTime);
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	
	public void delete(int id){
		new Thread(()->{
			String sql="delete from student where UserId=?";
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
	
	public Student get(int id){
		Student student=new Student();
		//new Thread(()->{
			String sql="select * from student where UserId=?";
			try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,id);	
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					String KnowledgeWanted=rs.getString("KnowledgeWanted");
					int AcceptableFee=Integer.parseInt(rs.getString("AcceptableFee"));
					String AvailableTime=rs.getString("AvailableTime");
					student.KnowledgeWanted=KnowledgeWanted;
					student.AcceptableFee=AcceptableFee;
					student.AvailableTime=AvailableTime;
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
		return student;
	}
	
	public List getTeacherCommit(User user){
		String sql="select * from indent,student,user where indent.TeacherId=? and Status=0 and indent.StudentId=student.UserId and student.UserId=user.UserId";
		ResultSet rs=null;
		List<Student> studentlist=new ArrayList<Student>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.UserId);
				rs=ps.executeQuery();
				while(rs.next()){
					Student student=new Student();
					student.setUserId(rs.getInt("user.UserId"));
					student.setKnowledgeWanted(rs.getString("KnowledgeWanted"));
					student.setAcceptableFee(rs.getInt("AcceptableFee"));
					student.setAvailableTime(rs.getString("AvailableTime"));
					studentlist.add(student);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		return studentlist;
	}
	public List getTeacherPass(User user){
		String sql="select * from indent,student,user where indent.TeacherId=? and Status=1 and indent.StudentId=student.UserId and student.UserId=user.UserId";
		ResultSet rs=null;
		List<Student> studentlist=new ArrayList<Student>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.UserId);
				rs=ps.executeQuery();
				while(rs.next()){
					Student student=new Student();
					student.setUserId(rs.getInt("user.UserId"));
					student.setKnowledgeWanted(rs.getString("KnowledgeWanted"));
					student.setAcceptableFee(rs.getInt("AcceptableFee"));
					student.setAvailableTime(rs.getString("AvailableTime"));
					studentlist.add(student);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		return studentlist;
	}
}