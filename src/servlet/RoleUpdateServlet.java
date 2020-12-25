package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.User;
import DAO.UserDAO;

public class RoleUpdateServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			User user=new UserDAO().get(Integer.parseInt(request.getParameter("userid")));
			int IdentityId=Integer.parseInt(request.getParameter("identityid"));
			//System.out.println(IdentityId);
			//System.out.println(user.UserName);
			user.setIdentityID(IdentityId);
			//System.out.println(user.IdentityID);
			new UserDAO().roleupdate(user);
			
			response.sendRedirect("manage.jsp");
		}
}
