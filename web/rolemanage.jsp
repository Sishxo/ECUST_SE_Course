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
	//List<Teacher> searchlist=(ArrayList)request.getAttribute("searchlist");
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
    


<br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				此处进行角色管理
			</h3>
			<br>
			<!--div class="form-style8292">
                 <form class="input-group" action="search" method="post" id="searchform"> <span class="input-group-addon"><i class="fa fa-pencil-square"
                             aria-hidden="true"></i></span>
                     <input type="text" class="form-control form-control8392" placeholder="此处键入查询" name="str"> 
                     <span class="input-group-addon"><a href="#" onclick="document:searchform.submit()">SEARCH</a></span> 
                 </form>
            </div-->
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
				<thead>
					<tr>
						<th>
							IdentityID
						</th>
						<th>
							IdentityDescription
						</th>
						<th>
							查看拜师信息
						</th>
						<th>
							查看学生信息
						</th>
						<th>
							进行拜师
						</th>
						<th>
							收徒管理
						</th>
						<th>
							进行用户管理
						</th>
						<th>
							进行角色管理
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<%		
                          	IdentityDAO identityDAO=new IdentityDAO();
                          	List<Identity> identitylist=(ArrayList)identityDAO.getall();
                          	for(int i=0;i<identitylist.size();i++){
                         		Identity identity=(Identity)identitylist.get(i);
                         		int functions[]=identityDAO.getallfunction(identity.IdentityID);
                    %>
					<tr>
						<td>
							<%=identity.IdentityID %>
						</td>
						<td>
							<%=identity.IdentityDescription %>
						</td>
						<%
							if(functions[1]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<%
							if(functions[2]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<%
							if(functions[3]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<%
							if(functions[4]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<%
							if(functions[5]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<%
							if(functions[6]==1){
							%>
						<td>
							<input type="checkbox" checked>
						</td>
						<%
							}else{
						%>
						<td>
							<input type="checkbox" >
						</td>
						<%} %>
						<td>
						<a href="#" onclick="alert('修改成功')">修改</a>
						<a href="#" onclick="roledelete(<%=identity.IdentityID%>)">删除</a>
						</td>
						</tr>
						<%
                          	}
						%>
					
				</tbody>
			</table>
			<a href="addrole.jsp"><button type="button" class="btn btn-default">增加新角色</button></a>
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