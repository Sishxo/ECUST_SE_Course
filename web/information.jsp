<!DOCTYPE html>
<html lang="zh">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.*,bean.User,bean.Student,bean.Teacher,DAO.TeacherDAO,DAO.StudentDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	User user=(User)session.getAttribute("user");
	//System.out.println(flag);
	if(user==null){
		response.sendRedirect("index.jsp");
	}
	int Identity=user.IdentityID;
	pageContext.setAttribute("Identity",Identity);
	Student student=new StudentDAO().get(user.UserId);
	Teacher teacher=new TeacherDAO().get(user.UserId);
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Information</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- ==========header mega navbar=======-->
    <div class="top-menu-bottom932">
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle
                            navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="#">
                        <p>Ecust Knowledge Share</p>
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav"> </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">主页 </a></li>
                        <li><a href="information.jsp" target="_self">个人信息 </a></li>
                        <c:if test="${user!=null }">
                        	<c:if test="${Identity==1}">
                        		<li><a href="teachermessage.jsp" target="_self" >拜师信息 </a></li>
                       	 	</c:if>
                        	<c:if test="${Identity==2}">
                        		<li><a href="studentmessage.jsp" target="_self" >学生信息 </a></li>
                        	</c:if>
                        </c:if>
                        <c:if test="${user!=null }">
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false"><%=user.getUserName()%> <span class="caret"></span></a>
                            <ul class="dropdown-menu animated zoomIn">
                                <li><a href="logout" >注销 </a></li>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </div>


    <!--======= welcome section on top background=====-->
    <!--section class="welcome-part-one">
        <div class="container">
            <div class="welcome-demop102 text-center">
                <h2>个人信息</h2>
            </div>
        </div>
    </section-->  

</body> 
<br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				您可以在此处修改、完善您的信息。
			</h3>
		</div>
	</div>
	<br>
	<div class="row clearfix">
		<div class="col-md-12 column">
				<h5>
					此处为您的账户注册信息。
				</h5>
			</div>
		<div class="col-md-8 column">
			<form class="form-horizontal" role="form" action="updateUser" method="post">
				<div class="form-group">
					 <label for="input1" class="col-sm-2 control-label">UserName</label>
					<div class="col-sm-10">
						<input readonly type="text" class="form-control" id="input1" name="UserName" value="Sishxo"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="input2" class="col-sm-2 control-label" >DialNumber</label>
					<div class="col-sm-10">
						<input readonly type="text" class="form-control" id="input2" name="DialNumber" value="18953832005"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="input3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input readonly type="email" class="form-control" id="input3" name="Email" value="10180657@mail.ecust.com"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="input4" class="col-sm-2 control-label" >Gender</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input4" name="Gender" value=<%=user.getGender() %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input5" class="col-sm-2 control-label" >College</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input5" name="College" value=<%=user.getCollege() %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input6" class="col-sm-2 control-label" >Major</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input6" name="Major" value=<%=user.getMajor() %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input7" class="col-sm-2 control-label" >Grade</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input7" name="Grade" value=<%=user.getGrade()%>>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" name="Password" value=<%=user.getPassword() %>>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">修改</button>
					</div>
				</div>
			</form>
			<c:if test="${Identity==1}">
			<div class="col-md-12 column">
				<h5>
					此处为您的学业相关信息，帮助您寻找到心仪的老师。
				</h5>
			</div>
			<form class="form-horizontal" role="form" action="updateStudent" method="post">
				<div class="form-group">
					 <label for="input8" class="col-sm-2 control-label" >Knowledge Wanted</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input8" name="KnowledgeWanted" value=<%=student.KnowledgeWanted %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input9" class="col-sm-2 control-label" >Acceptable Fee (per hour)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input9" name="AcceptableFee" value=<%=student.AcceptableFee %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input10" class="col-sm-2 control-label">Available Time</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input10" name="AvailableTime" value=<%=student.AvailableTime %>>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">修改</button>
					</div>
				</div>
			</form>
			</c:if>
			<c:if test="${Identity==2}">
			<div class="col-md-12 column">
				<h5>
					此处为您的知识背景信息，帮助您帮助更多的学生。
				</h5>
			</div>
			<form class="form-horizontal" role="form" action="updateTeacher" method="post">
				<div class="form-group">
					 <label for="input11" class="col-sm-2 control-label" >Knowledge GoodAt</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input11" name="KnowledgeGoodAt" value=<%=teacher.KnowledgeGoodAt %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input12" class="col-sm-2 control-label" >Wanted Fee (per hour)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input12" name="WantedFee" value=<%=teacher.WantedFee %>>
					</div>
				</div>
				<div class="form-group">
					 <label for="input13" class="col-sm-2 control-label">Available Time</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input13" name="AvailableTime" value=<%=teacher.AvailableTime %>>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">修改</button>
					</div>
				</div>
			</form>
			</c:if>
		</div>
		<div class="col-md-4 column">
			<img alt="140x140" src="uploaded/hello.jpg" class="img-rounded" />
		</div>
	</div>
</div>
 
 <!--%  
          
        User user = 读取函数();  //读取信息
        
         
        out.println("用户名：" + user.getUsername() + "<br>");  
        out.println("密码：" + user.getPassword());  
    %-->  
	



</html>