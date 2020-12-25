package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Indent;
import DAO.IndentDAO;

public class IndentReleaseServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		request.setCharacterEncoding("UTF-8");
		
		int TeacherId=Integer.parseInt(request.getParameter("teacherid"));
		int StudentId=Integer.parseInt(request.getParameter("studentid"));
		Indent indent=new Indent();
		indent.setTeacherId(TeacherId);
		indent.setStudentId(StudentId);
		new IndentDAO().cancel(indent);
		response.sendRedirect("studentmessage.jsp");
	}
}
