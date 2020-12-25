package servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import DAO.*;

public class SearchServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		
			request.setCharacterEncoding("UTF-8");
			String str=request.getParameter("str");
			str="%"+str+"%";
			//System.out.println(str);
			List<Teacher> list= new TeacherDAO().getbystr(str);
			//System.out.println(list);
			request.setAttribute("searchlist", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
