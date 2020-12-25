package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import bean.Student;
import DAO.StudentDAO;

public class StudentUpdateServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession(false);
			
			User user=new User();
			StudentDAO StudentDao=new StudentDAO();
			
			user=(User)session.getAttribute("user");
			int id=user.getUserId();
			String KnowledgeWanted=request.getParameter("KnowledgeWanted");
			int AcceptableFee=Integer.parseInt(request.getParameter("AcceptableFee"));
			String AvailableTime=request.getParameter("AvailableTime");
			
			Student student=StudentDao.get(id);
			if(student.AcceptableFee==0&&student.KnowledgeWanted==null&&student.AvailableTime==null){
				student.setUserId(id);
				student.setKnowledgeWanted(KnowledgeWanted);
				student.setAcceptableFee(AcceptableFee);
				student.setAvailableTime(AvailableTime);
				StudentDao.add(student);
			}else{
				student.setUserId(id);
				student.setKnowledgeWanted(KnowledgeWanted);
				student.setAcceptableFee(AcceptableFee);
				student.setAvailableTime(AvailableTime);
				StudentDao.update(student);
			}
			response.sendRedirect("information.jsp");
		}
}
