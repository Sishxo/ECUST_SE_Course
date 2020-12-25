package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import bean.Teacher;
import DAO.TeacherDAO;

public class TeacherUpdateServlet extends HttpServlet {

		protected void service(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession(false);
			
			User user=new User();
			TeacherDAO TeacherDao=new TeacherDAO();
			
			user=(User)session.getAttribute("user");
			int id=user.getUserId();
			String KnowledgeGoodAt=request.getParameter("KnowledgeGoodAt");
			int WantedFee=Integer.parseInt(request.getParameter("WantedFee"));
			String AvailableTime=request.getParameter("AvailableTime");
			
			Teacher teacher=TeacherDao.get(id);
			if(teacher.WantedFee==0&&teacher.KnowledgeGoodAt==null&&teacher.AvailableTime==null){
				teacher.setUserId(id);
				teacher.setKnowledgeGoodAt(KnowledgeGoodAt);
				teacher.setWantedFee(WantedFee);
				teacher.setAvailableTime(AvailableTime);
				TeacherDao.add(teacher);
			}else{
				teacher.setKnowledgeGoodAt(KnowledgeGoodAt);
				teacher.setWantedFee(WantedFee);
				teacher.setAvailableTime(AvailableTime);
				TeacherDao.update(teacher);
			}
			response.sendRedirect("information.jsp");
		}
}
