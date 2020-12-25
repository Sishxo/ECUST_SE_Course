package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.User;
import DAO.UserDAO;

public class UserUpdateServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession(false);
			
			User user=new User();	
			user=(User)session.getAttribute("user");
			int id=user.getUserId();
			int IdentityId=user.getIdentityID();
			user.setUserName(request.getParameter("UserName"));
			user.setPassword(request.getParameter("Password"));
			user.setDialNumber(request.getParameter("DialNumber"));
			user.setEmail(request.getParameter("Email"));
			user.setGender(request.getParameter("Gender"));
			user.setCollege(request.getParameter("College"));
			user.setMajor(request.getParameter("Major"));
			user.setGrade(request.getParameter("Grade"));
			System.out.println(user.Gender);
			
			new UserDAO().update(user);
			
			response.sendRedirect("information.jsp");
		}
}
