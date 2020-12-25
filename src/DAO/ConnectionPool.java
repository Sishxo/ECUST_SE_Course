package DAO;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class ConnectionPool {
	List<Connection> cs=new ArrayList<Connection>();
	int size;
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/se?characterEncoding=UTF-8";
	private static final String USER_NAME="root";
	private static final String USER_PASSWORD="sun20001030/*-+";
	
	public ConnectionPool(int size){
		this.size=size;
		init();
	}
	
	public void init(){
		try{
			Class.forName(DRIVER_NAME);
			for(int i=0;i<size;i++){
				Connection c=DriverManager.getConnection(URL,USER_NAME,USER_PASSWORD);
				cs.add(c);
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public synchronized  Connection getConnection(){
		while(cs.isEmpty()){
			try{
				this.wait();
			}catch(InterruptedException e){
				e.printStackTrace();
			}
		}
		Connection c=cs.remove(0);
		return c;
	}
	
	public synchronized void returnConnection(Connection c){
		cs.add(c);
		this.notifyAll();
	}
}
