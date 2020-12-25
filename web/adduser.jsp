<!DOCTYPE html>
<html lang="zh">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.*,bean.*,DAO.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	User user=(User)session.getAttribute("user");
	//System.out.println(flag);
	if(user==null){
		response.sendRedirect("index.jsp");
	}
	List<Teacher> searchlist=(ArrayList)request.getAttribute("searchlist");
	//System.out.println(searchlist);
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
    <script src="js/manage.js"></script>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
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
                        <li><a href="manage.jsp" target="_self">用户管理 </a></li>
                        <li><a href="rolemanage.jsp" target="_self" >角色管理 </a></li>
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
    <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				您可以在此处创建一个新的用户。
			</h3>
		</div>
	</div>
	<br>
	<div class="row clearfix">
		<div class="col-md-12 column">
				<h5>
					此处为新用户信息。
				</h5>
			</div>
		<div class="col-md-8 column">
			<form class="form-horizontal" role="form" action="backAddUser" method="post">
				<div class="form-group">
					 <label for="input1" class="col-sm-2 control-label">UserName</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input1" name="UserName" />
					</div>
				</div>
				<div class="form-group">
					 <label for="input2" class="col-sm-2 control-label" >DialNumber</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input2" name="DialNumber" />
					</div>
				</div>
				<div class="form-group">
					 <label for="input3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input  type="email" class="form-control" id="input3" name="Email" />
					</div>
				</div>
				<div class="form-group">
					 <label for="input4" class="col-sm-2 control-label" >Gender</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input4" name="Gender" >
					</div>
				</div>
				<div class="form-group">
					 <label for="input5" class="col-sm-2 control-label" >College</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input5" name="College" >
					</div>
				</div>
				<div class="form-group">
					 <label for="input6" class="col-sm-2 control-label" >Major</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="input6" name="Major" >
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" name="Password" >
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Identity</label>
					<div class="col-sm-10">
						<select class="selectpicker" name="Identity" data-style="btn-info" title="请选择" color="white"> 
							<option value="1">学生</option>
							<option value="2">老师</option>
							<option value="3">管理员</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Grade</label>
					<div class="col-sm-10">
						<select class="selectpicker" name="Grade" data-style="btn-info" title="请选择" color="white"> 
							<option value="大一">大一</option>
							<option value="大二">大二</option>
							<option value="大三">大三</option>
							<option value="大四">大四</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">创建</button>
					</div>
				</div>
			</form>
			</div>
		</div>
		</div>


</body>
<footer class="navbar-fixed-bottom">
<section class="footer-social">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p>Copyright 2020 ECUST Knowledge Share | <strong>Sun and teammates</strong></p>
                </div>
                <div class="col-md-6">
                    <div class="social-right2389"> <a href="#"><i class="fa fa-twitter-square"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-facebook"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-google-plus"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-youtube"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-skype"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-linkedin"
                                aria-hidden="true"></i></a> <a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</footer>



</html>