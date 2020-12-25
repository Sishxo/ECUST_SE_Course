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
			user.setIdentityID(IdentityId);
			
			new UserDAO().update(user);
			
			response.sendRedirect("manage.jsp");
		}
}
