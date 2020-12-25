package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import DAO.UserDAO;
import bean.Student;
import bean.Teacher;

public class UserAddServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			
			User user=new User();	
			user.setUserName(request.getParameter("UserName"));
			System.out.println(request.getParameter("UserName"));
			user.setPassword(request.getParameter("Password"));
			System.out.println(request.getParameter("Password"));
			user.setDialNumber(request.getParameter("DialNumber"));
			System.out.println(request.getParameter("DialNumber"));
			user.setEmail(request.getParameter("Email"));
			System.out.println(request.getParameter("Email"));
			user.setGender(request.getParameter("Gender"));
			System.out.println(request.getParameter("Gender"));
			user.setCollege(request.getParameter("College"));
			System.out.println(request.getParameter("College"));
			user.setMajor(request.getParameter("Major"));
			System.out.println(request.getParameter("Major"));
			user.setGrade(request.getParameter("Grade"));
			System.out.println(request.getParameter("Grade"));
			String Identity=request.getParameter("Identity");
			System.out.println(request.getParameter("Identity"));
			int IdentityID;
			if(Identity.equals("ѧ��")){
				IdentityID=1;
			}else{
				IdentityID=2;
			}
			user.setIdentityID(IdentityID);
			
			new UserDAO().add(user);
			
			
			response.sendRedirect("login.html");
		}
}
