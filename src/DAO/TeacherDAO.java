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
import bean.Indent;
import bean.Teacher;
import bean.User;

public class TeacherDAO {
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	ConnectionPool cp;
	
	public TeacherDAO(){
		ConnectionPool cp=new ConnectionPool(5);
		this.cp=cp;
	}
	public void add(Teacher teacher){
		new Thread(()->{
			/*try{
				Class.forName(DRIVER_NAME);
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}*/
			String sql="insert into teacher values(?,?,?,?)";
			Connection c=cp.getConnection();
			try(//Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps= c.prepareStatement(sql);	){
			//Connection c=cp.getConnection();
				ps.setInt(1,teacher.UserId);
				ps.setString(2,teacher.KnowledgeGoodAt);
				ps.setInt(3, teacher.WantedFee);
				ps.setString(4, teacher.AvailableTime);
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
	
	public void update(Teacher teacher){
		//new Thread(()->{
			String sql="update teacher set KnowledgeWanted=?,AcceptableFee=?,AvailableTime=? where UserId=?";
			try(	Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
					PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(4,teacher.UserId);
				ps.setString(1,teacher.KnowledgeGoodAt);
				ps.setInt(2,teacher.WantedFee);
				ps.setString(3,teacher.AvailableTime);
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
	}
	
	public void delete(int id){
		new Thread(()->{
			String sql="delete from teacher where UserId=?";
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
	
	public Teacher get(int id){
		Teacher teacher=new Teacher();
		//new Thread(()->{
			String sql="select * from teacher where UserId=?";
			try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,id);	
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					String KnowledgeGoodAt=rs.getString("KnowledgeGoodAt");
					int WantedFee=Integer.parseInt(rs.getString("WantedFee"));
					String AvailableTime=rs.getString("AvailableTime");
					teacher.KnowledgeGoodAt=KnowledgeGoodAt;
					teacher.WantedFee=WantedFee;
					teacher.AvailableTime=AvailableTime;
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
		return teacher;
	}
	public List getbystr(String str){
		ResultSet rs=null;
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		//new Thread(()->{
			String sql="select * from user,teacher where UserName like ? and user.UserId=teacher.UserId";
			try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setString(1,str);	
				rs=ps.executeQuery();
				while(rs.next()){
					Teacher teacher=new Teacher();
					String KnowledgeGoodAt=rs.getString("KnowledgeGoodAt");
					int WantedFee=Integer.parseInt(rs.getString("WantedFee"));
					String AvailableTime=rs.getString("AvailableTime");
					teacher.UserId=rs.getInt("UserId");
					teacher.KnowledgeGoodAt=KnowledgeGoodAt;
					teacher.WantedFee=WantedFee;
					teacher.AvailableTime=AvailableTime;
					teacherlist.add(teacher);
					//System.out.println(teacher.UserId);
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//cp.returnConnection(c);
		//}).start();
		return teacherlist;
	}
	public List getall(){
		String sql="select * from teacher,user where user.UserId=teacher.UserId";
		ResultSet rs=null;
		List<User> userlist=new ArrayList<User>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);){
			rs=ps.executeQuery();
			while(rs.next()){
				User user=new User();
				Teacher teacher=new Teacher();
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
	public List getallTeacher(){
		String sql="select * from teacher,user where user.UserId=teacher.UserId";
		ResultSet rs=null;
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);){
			rs=ps.executeQuery();
			while(rs.next()){
				Teacher teacher=new Teacher();
				teacher.UserId=rs.getInt("user.UserId");
				teacher.KnowledgeGoodAt=rs.getString("KnowledgeGoodAt");
				teacher.WantedFee=rs.getInt("WantedFee");
				teacher.AvailableTime=rs.getString("AvailableTime");
				teacherlist.add(teacher);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}	
		//System.out.println(teacherlist);
		return teacherlist;
	}
	public List getStudentCommit(User user){
		String sql="select * from indent,teacher,user where indent.StudentId=? and Status=0 and indent.TeacherId=teacher.UserId and indent.TeacherId=user.UserId";
		ResultSet rs=null;
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.UserId);
				rs=ps.executeQuery();
				while(rs.next()){
					Teacher teacher=new Teacher();
					teacher.setUserId(rs.getInt("user.UserId"));
					teacher.KnowledgeGoodAt=rs.getString("KnowledgeGoodAt");
					teacher.WantedFee=rs.getInt("WantedFee");
					teacher.AvailableTime=rs.getString("AvailableTime");
					teacherlist.add(teacher);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		return teacherlist;
	}
	public List getStudentPass(User user){
		String sql="select * from indent,teacher,user where indent.StudentId=? and Status=1 and indent.TeacherId=teacher.UserId and indent.TeacherId=user.UserId";
		ResultSet rs=null;
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		try(Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);){
				ps.setInt(1,user.UserId);
				rs=ps.executeQuery();
				while(rs.next()){
					Teacher teacher=new Teacher();
					teacher.setUserId(rs.getInt("user.UserId"));
					teacher.KnowledgeGoodAt=rs.getString("KnowledgeGoodAt");
					teacher.WantedFee=rs.getInt("WantedFee");
					teacher.AvailableTime=rs.getString("AvailableTime");
					teacherlist.add(teacher);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		return teacherlist;
	}
	
}