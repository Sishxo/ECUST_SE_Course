package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.User;
import DAO.*;

public class RoleDeleteServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			int id=Integer.parseInt(request.getParameter("IdentityID"));
			System.out.println("test");
			new IdentityDAO().delete(id);
			
			response.sendRedirect("rolemanage.jsp");
		}
}
