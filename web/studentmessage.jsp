<%@ page  language="java" pageEncoding="UTF-8" import="bean.*,DAO.*,java.util.*,java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<%
	User user=(User)session.getAttribute("user");
	//System.out.println(flag);
	if(user==null){
		response.sendRedirect("index.jsp");
	}
	if(user!=null){
		int Identity=user.getIdentityID();
		pageContext.setAttribute("Identity",Identity);
	}
%>
<!--加了个链接jquery-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>师徒关系</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="css/dialog.css">
    <script src="js/dialog.js"></script>
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
                        <li><a href="index.jsp">主页 </a></li>ull }">
                        <li><a href="information.jsp" target="_self" >个人信息 </a></li>
                        <li><a href="studentmessage.jsp" target="_self" >拜师信息 </a></li>
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false"><%=user.getUserName()%> <span class="caret"></span></a>
                            <ul class="dropdown-menu animated zoomIn">
                                <li><a href="logout" >注销 </a></li>
                            </ul>
                        </li>
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






    <!-- ======content section/body=====-->
    <section class="main-content920">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div id="main">
                        <input id="tab1" type="radio" name="tabs" checked>
                        <label for="tab1">已提交的拜师申请</label>
                        <input id="tab2" type="radio" name="tabs">
                        <label for="tab2">已通过的拜师申请</label>

                        <section id="content1">
                            <!--Recent Question Content Section -->
                            <div class="question-type2033">
                            <% 
                            	TeacherDAO teacherDAO=new TeacherDAO();
                        		List<Teacher> teacherlist=(ArrayList)teacherDAO.getStudentCommit(user);
                            	for(int i=0;i<teacherlist.size();i++){
                           			Teacher teacher=(Teacher)teacherlist.get(i);
                           			User user2=new UserDAO().get(teacher.UserId);%>
                                <div class="row">
                                    <div class="col-md-1">
                                        <div class="left-user12923 left-user12923-repeat">
                                            <a href="#">
                                                <img src="image/images.png" alt="image"> 
                                            </a> 
                                            <a href="#">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                            </a> 
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="right-description893">
                                            <div id="que-hedder2983">
                                                <h3>
                                                    <a id="alert-window_<%=teacher.UserId %>" target="_blank" name=<%=teacher.UserId %>><%=user2.getUserName() %></a>
                                                </h3> 
                                            </div>
                                            <div class="ques-details10018">
                                                <p>电话号码：<%=user2.getDialNumber() %></p>
                                                <p>email: <%=user2.getEmail()%></p>
                                                <p>擅长的知识：<%=teacher.getKnowledgeGoodAt()%></p> 
                                                <p>学校:  <%=user2.getCollege()%></p>
                                            </div>
                                            <hr>
                                           <div class="ques-icon-info3293"> 
                                           <button  onclick="releaseorder(<%=user.UserId%>,<%=user2.UserId%>)">撤销申请</button>
                                           <button onclick = "window.location.href = 'chatbox.html'">聊天</button>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div id=<%=teacher.UserId %> class="overlay">
								    <!-- dialog：指示弹窗窗体。 -->
									  	<div class="dialog">
									  		<!-- dialog-header：指示弹窗头部。 -->
										  	<div class="dialog-header">
										  	    <!-- dialog-title：指示弹窗标题。 -->
										  		<div class="dialog-title"><%=user2.getUserName() %>详细信息</div>
										  		<!-- dialog-close-icon：指示关闭按钮样式。dialog-close：指示关闭弹窗触发器 -->
										  		<div class="dialog-close-icon dialog-close"></div>
										  	</div>
										  	<!-- dialog-content：指示弹窗内容。 -->
										  	<div class="dialog-content">                            
																		
									        <div class="col-md-9">
									             <div class="right-description893">
									                <div id="que-hedder2983">
									                    <h3>
									                        <img width=45 height=45 src="image/images.png" alt="image"><a><%=user2.getUserName() %></a>
									                    </h3>
									                </div>
									        <div class="ques-details10018">
									            <p>电话号码：<%=user2.getDialNumber() %></p>
									            <p>email: <%=user2.getEmail()%></p>
									            <p>学校:  <%=user2.getCollege()%></p>
									            <p>专业:  <%=user2.getMajor()%></p>
									            <p>年级:  <%=user2.getGrade()%></p>
									            <p>擅长的知识：<%=teacher.getKnowledgeGoodAt()%></p>
                                                <p>期待的报酬：<%=teacher.getWantedFee()%></p>
                                                <p>可行的时间：<%=teacher.getAvailableTime()%></p>
									            </div>
									            <hr>
									            <div class="ques-icon-info3293"> 
									            <!--a href="#"><i class="fa fa-check" aria-hidden="true"> 已解决</i></a> <a href="#"><i class="fa fa-star" aria-hidden="true"> 5</i> </a> <a href="#"><i class="fa fa-folder" aria-hidden="true"> 话题组 1</i></a> <a href="#"><i class="fa fa-clock-o" aria-hidden="true"> 4 分钟前</i></a> <a href="#"><i class="fa fa-comment" aria-hidden="true">  3 回答</i></a--> 
									            <a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"> 70 浏览</i> </a> </div>
									            </div>
									            </div>
														
										  	</div>
										  	<!-- dialog-footer：指示弹窗底部。 -->
										  	<div class="dialog-footer">
										  	    <!-- btn：指示普通按钮样式。-->
										  		<button onclick="sureorder(<%=user.UserId %>,<%=user2.UserId %>)" class="btn">拜师</button>
										  		<button onclick = "window.location.href = 'chatbox.html'" class="btn">聊天</button>
										  	</div>
										</div>
								  	</div>
                                <%} %>
                            </div>
                            
                        </section>
                        <!--  End of content-1------>
						<section id="content2">
                            <!--Recent Question Content Section -->
                            <div class="question-type2033">
                            <% 
                        		List<Teacher> teacherlist2=(ArrayList)teacherDAO.getStudentPass(user);
                            	for(int i=0;i<teacherlist2.size();i++){
                           			Teacher teacher=(Teacher)teacherlist2.get(i);
                           			User user2=new UserDAO().get(teacher.UserId);%>
                                <div class="row">
                                    <div class="col-md-1">
                                        <div class="left-user12923 left-user12923-repeat">
                                            <a href="#">
                                                <img src="image/images.png" alt="image"> 
                                            </a> 
                                            <a href="#">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                            </a> 
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="right-description893">
                                            <div id="que-hedder2983">
                                                <h3>
                                                    <a id="alert-window_<%=user2.UserId %>" target="_blank" name=<%=user2.UserId %>><%=user2.getUserName() %></a>
                                                </h3> 
                                            </div>
                                            <div class="ques-details10018">
                                                <p>电话号码：<%=user2.getDialNumber() %></p>
                                                <p>email: <%=user2.getEmail()%></p>
                                                <p>擅长的知识：<%=teacher.getKnowledgeGoodAt()%></p> 
                                                <p>学校:  <%=user2.getCollege()%></p>
                                            </div>
                                            <hr>
                                           <div class="ques-icon-info3293"> 
                                           <button  onclick="releaseorder(<%=user.UserId%>,<%=user2.getUserId()%>)">解除关系</button>
                                           <button onclick = "window.location.href = 'chatbox.html'">聊天</button>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="<%=user2.UserId+1000 %>" class="overlay">
								    <!-- dialog：指示弹窗窗体。 -->
									  	<div class="dialog">
									  		<!-- dialog-header：指示弹窗头部。 -->
										  	<div class="dialog-header">
										  	    <!-- dialog-title：指示弹窗标题。 -->
										  		<div class="dialog-title"><%=user2.getUserName() %>详细信息</div>
										  		<!-- dialog-close-icon：指示关闭按钮样式。dialog-close：指示关闭弹窗触发器 -->
										  		<div class="dialog-close-icon dialog-close"></div>
										  	</div>
										  	<!-- dialog-content：指示弹窗内容。 -->
										  	<div class="dialog-content">                            
																		
									        <div class="col-md-9">
									             <div class="right-description893">
									                <div id="que-hedder2983">
									                    <h3>
									                        <img width=45 height=45 src="image/images.png" alt="image"><a><%=user2.getUserName() %></a>
									                    </h3>
									                </div>
									        <div class="ques-details10018">
									            <p>电话号码：<%=user2.getDialNumber() %></p>
									            <p>email: <%=user2.getEmail()%></p>
									            <p>学校:  <%=user2.getCollege()%></p>
									            <p>专业:  <%=user2.getMajor()%></p>
									            <p>年级:  <%=user2.getGrade()%></p>
									            <p>擅长的知识：<%=teacher.getKnowledgeGoodAt()%></p>
                                                <p>期待的报酬：<%=teacher.getWantedFee()%></p>
                                                <p>可行的时间：<%=teacher.getAvailableTime()%></p>
									            </div>
									            <hr>
									            <div class="ques-icon-info3293"> 
									            <!--a href="#"><i class="fa fa-check" aria-hidden="true"> 已解决</i></a> <a href="#"><i class="fa fa-star" aria-hidden="true"> 5</i> </a> <a href="#"><i class="fa fa-folder" aria-hidden="true"> 话题组 1</i></a> <a href="#"><i class="fa fa-clock-o" aria-hidden="true"> 4 分钟前</i></a> <a href="#"><i class="fa fa-comment" aria-hidden="true">  3 回答</i></a--> 
									            <button  onclick="releaseorder(<%=user.UserId%>,<%=user2.UserId%>)">解除关系</button>
                                           		<button>聊天</button>
									            </div>
									            </div>
														
										  	</div>
										  	<!-- dialog-footer：指示弹窗底部。 -->
										  	<div class="dialog-footer">
										  	    <!-- btn：指示普通按钮样式。-->
										  		<button onclick="sureorder(<%=user.UserId %>,<%=user2.UserId %>)" class="btn">拜师</button>
										  		<button onclick = "window.location.href = 'chatbox.html'" class="btn">聊天</button>
										  	</div>
										</div>
								  	</div>
                                <%} %>
                            </div>
                            
                        </section>
                        

                        <!----end of content-2----->

                    </div>
                </div>
                <!--end of col-md-9 -->
                <!--strart col-md-3 (side bar)-->
                
            </div>
        </div>
    </section>
    <!--    footer -->
    <div class="footer-search">
        <div class="container">
            <div class="row">
                <div id="custom-search-input">
                    <div class="input-group col-md-12"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        <input type="text" class="  search-query form-control user-control30"
                            placeholder="在这里搜索......" /> <span class="input-group-btn">
                            <button class="btn btn-danger" type="button">
                                <span class=" glyphicon glyphicon-search"></span> </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="footer-social">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p>Copyright 2020 ECUST Forum | <strong>Sun and teammates</strong></p>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/npm.js"></script>
</body>

</html>