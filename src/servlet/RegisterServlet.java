package servlet;
import java.io.IOException;

import java.util.Arrays;
import java.util.Set;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("utf-8");
		System.out.println("获取单值参数name:"+request.getParameter("name"));
		
		String[] hobits=request.getParameterValues("hobits");
		System.out.println("获取具有多值的参数hobits:"+Arrays.asList(hobits));
		
		System.out.println("通过getParameterMap获取所有参数");
		Map<String,String[]> parameters=request.getParameterMap();
		
		Set<String> paramNames=parameters.keySet();
		
		for(String param : paramNames){
			String[] value=parameters.get(param);
			System.out.println(param+":"+Arrays.asList(value));
		}
		
	}

}
