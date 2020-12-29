package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import DAO.*;

public class AddRoleServlet extends HttpServlet{
	protected void service(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		
		Identity identity=new Identity();
		String IdentityDescription=request.getParameter("IdentityDescription");
		identity.setIdentityDescription(IdentityDescription);
		new IdentityDAO().add(identity);
		String[] functions=request.getParameterValues("function");
		int IdentityID=new IdentityDAO().get(IdentityDescription).IdentityID;
		System.out.println(IdentityID);
		for(int i=0;i<functions.length;i++){
			int FunctionID=Integer.parseInt(functions[i]);
			new IdentityDAO().addfunction(IdentityID, FunctionID);
		}
		response.sendRedirect("rolemanage.jsp");
	}
}
