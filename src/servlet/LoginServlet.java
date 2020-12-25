package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import DAO.UserDAO;
 
public class LoginServlet extends HttpServlet {
	
    protected void service(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    	String DialNumber = request.getParameter("DialNumber");
        //byte[] bytes=name.getBytes("ISO-8859-1");
        //name=new String(bytes,"UTF-8");
        String password = request.getParameter("Password");
        UserDAO userDAO=new UserDAO();
        User user=userDAO.getByDialNumber(DialNumber);
        
        String userDial=user.getDialNumber();
        String userPass=user.getPassword();
        int UserId=user.getUserId();
        //System.out.println(userDial+userPass);
        
        HttpSession session=request.getSession();
        session.setMaxInactiveInterval(24*60*60);
        if(userPass!=null){
        if(userDial.equals(DialNumber)&&userPass.equals(password)){
        	//html="<div style='color:green'>成功</div>";
        	session.setAttribute("user", user);
        	response.sendRedirect("index.jsp");
        }
        else{
        	response.setContentType("text/html;charset=UTF-8");
        	response.getWriter().write("<script> alert('用户名或密码错误！');window.location.href='login.html';</script>");
        	//request.getRequestDispatcher("fail.html").forward(request,response);
        }}else{
        	response.setContentType("text/html;charset=UTF-8");
        	response.getWriter().write("<script> alert('用户名或密码错误！');window.location.href='login.html';</script>");
        }
        //	html="<div style='color:red'>失败</div>";
        //PrintWriter pw=response.getWriter();
        //pw.println(html);*/
    }
}