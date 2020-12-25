<%@ page  language="java" pageEncoding="UTF-8" import="bean.*,DAO.*,java.util.Date,java.text.SimpleDateFormat,java.sql.ResultSet,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh">
<%
	User user=(User)session.getAttribute("user");
	//System.out.println(flag);
	if(user!=null){
		int Identity=user.getIdentityID();
		pageContext.setAttribute("Identity",Identity);
	}
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Find a master</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/dialog.css">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
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
                        <p>ECUST Knowledge Share</p>
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav"> </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">主页 </a></li>
                        <c:if test="${user==null }">
                        <li><a href="#" target="_self" onclick="alert('您尚未登陆！')">个人信息 </a></li>
                        </c:if>
                        <c:if test="${user!=null }">
                        <li><a href="information.jsp" target="_self" >个人信息 </a></li>
                        </c:if>
                        <c:if test="${user==null }">
                        <li><a href="#" target="_self" onclick="alert('您尚未登陆！')">拜师信息</a></li>
                        </c:if>
                        <c:if test="${user!=null }">
                        	<c:if test="${Identity==1}">
                        		<li><a href="studentmessage.jsp" target="_self" >拜师信息 </a></li>
                       	 	</c:if>
                        	<c:if test="${Identity==2}">
                        		<li><a href="teacher message.jsp" target="_self" >学生信息 </a></li>
                        	</c:if>
                        </c:if>
                        <c:if test="${user!=null}">
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false"><%=user.getUserName()%> <span class="caret"></span></a>
                            <ul class="dropdown-menu animated zoomIn">
                                <li><a href="logout" >注销 </a></li>
                            </ul>
                        </li>
                        </c:if>
                       	<c:if test="${user==null}">
                        <li><a href="login.html" target="_self">登录</a></li>
                      	</c:if>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </div>