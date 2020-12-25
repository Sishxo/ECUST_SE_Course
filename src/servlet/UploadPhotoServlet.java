package servlet;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadPhotoServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response){
		String filename=null;
		try{
			DiskFileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(factory);
			factory.setSizeThreshold(1024*1024);
			
			List items=null;
			try{
				items=upload.parseRequest(request);
			}catch(FileUploadException e){
				e.printStackTrace();
			}
			Iterator iter=items.iterator();
			while(iter.hasNext()){
				FileItem item=(FileItem)iter.next();
				if(!item.isFormField()){
					//创建文件名，文件路径，建立完整文件对象
					filename=System.currentTimeMillis()+".jpg";
					String photoFolder=request.getServletContext().getRealPath("uploaded");
					File f=new File(photoFolder,filename);
					f.getParentFile().mkdir();
					//获取文件输入流
					InputStream is=item.getInputStream();
					//复制文件
					FileOutputStream fos=new FileOutputStream(f);
					byte b[]=new byte[1024*1024];
					int length=0;
					while(-1!=(length=is.read(b))){
						fos.write(b,0,length);
					}
					fos.close();
				}else{
					System.out.println(item.getFieldName());
					String value=item.getString();
					value=new String(value.getBytes("ISO-8859-1"),"UTF-8");
					System.out.println(value);
				}
			}
			String html="<img width='200' height='150' src='uploaded/%s' />";
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			 
			pw.format(html, filename);
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
			
			
		}
	}
}
