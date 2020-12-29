package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DAO.*;
import bean.*;

public class IdentityDAO {
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	ConnectionPool cp;
	
	public IdentityDAO(){
		ConnectionPool cp=new ConnectionPool(5);
		this.cp=cp;
	}
	
	public void add(Identity identity){
		String sql="insert into Identity values(null,?)";
		try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
		){
			ps.setString(1, identity.IdentityDescription);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void delete(int IdentityID){
		String sql="delete from identity where IdentityID=?";
		try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
		){
			ps.setInt(1, IdentityID);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void addfunction(int IdentityID,int FunctionID){
		String sql="insert into identityfunction values(?,?)";
		try(
				Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				PreparedStatement ps=c.prepareStatement(sql);
			){
				ps.setInt(1, IdentityID);
				ps.setInt(2, FunctionID);
				ps.execute();
			}catch(SQLException e){
				e.printStackTrace();
			}
	}
	
	public List getall(){
		String sql="select * from Identity";
		ResultSet rs=null;
		List<Identity> identitylist=new ArrayList<Identity>();
		try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
			){
			rs=ps.executeQuery();
			while(rs.next()){
				Identity identity=new Identity();
				identity.setIdentityID(rs.getInt("IdentityID"));
				identity.setIdentityDescription(rs.getString("IdentityDescription"));
				identitylist.add(identity);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return identitylist;
	}
	
	public int[] getallfunction(int IdentityID){
		String sql="select * from identityfunction where IdentityID=?";
		ResultSet rs=null;
		List<Integer> functionlist=new ArrayList<Integer>();
		int functions[]=null;
		functions=new int[7];
		try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
			){
			ps.setInt(1, IdentityID);
			rs=ps.executeQuery();
			while(rs.next()){
				int FunctionID=rs.getInt("FunctionID");
				functionlist.add(FunctionID);
			}
			for(int i=0;i<7;i++){
				functions[i]=0;
			}
			for(int i=1;i<=6;i++){
				for(int j=0;j<functionlist.size();j++){
					if(functionlist.get(j)==i){
						functions[i]=1;
					}
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return functions;
	}
	
	public Identity get(String IdentityDescription){
		String sql="select * from Identity where IdentityDescription=?";
		Identity identity=new Identity();
			try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
			){
			ps.setString(1,IdentityDescription);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				identity.setIdentityID(rs.getInt("IdentityID"));
				identity.setIdentityDescription(rs.getString("IdentityDescription"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return identity;
	}
}
