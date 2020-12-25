package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet{

	protected void service(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		
			HttpSession session=request.getSession(false);
			if(session==null){
				response.sendRedirect("index.jsp");
			}else{
				session.removeAttribute("user");
				response.sendRedirect("index.jsp");
			}
			return;
	}
}
