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
		String sql="insert into Identity values(?,?)";
		try(
			Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
			PreparedStatement ps=c.prepareStatement(sql);
		){
			ps.setInt(1, identity.IdentityID);
			ps.setString(2, identity.IdentityDescription);
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
}
