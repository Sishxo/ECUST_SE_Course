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
	List<Teacher> searchlist=(ArrayList)request.getAttribute("searchlist");
	System.out.println(searchlist);%>
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
                        		<li><a href="teachermessage.jsp" target="_self" >学生信息 </a></li>
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


    <!--======= welcome section on top background=====-->
    <section class="welcome-part-one">
        <div class="container">
            <div class="welcome-demop102 text-center">
                <h2>欢迎来到 Ecust Knowledge Share</h2>
                <p>Open Source,Open information,Open World.<br />
                    <!--1. 积极互助与反馈，自由负责的发言。<br />
                    2. 本网站不会透露个人隐私，没有广告。<br />
                    3. 禁止使用任何歧视性字眼。<br />
                    4. 可以与宇宙中每一个注册账号的物种交朋友。<br />
                    5. 可以出门的时候不要忘记与朋友聚餐，任何社交网络都无法取代美食。<br />-->
                </p>
                <c:if test="${user==null }">
                <div class="button0239-item">
                    <a href="login.html">
                        <button type="button" class="aboutus022">登录</button>
                    </a>
                    <a href="signup.html">
                        <button type="button" class="join92">注册</button>
                    </a>
                </div>
                </c:if>
                <c:if test="${user!=null }">
                <p>现在是<%=new SimpleDateFormat().format(new Date())%>, <%=user.getUserName() %></p>
                </c:if>
                <div class="form-style8292">
                    <form class="input-group" action="search" method="post" id="searchform"> <span class="input-group-addon"><i class="fa fa-pencil-square"
                                aria-hidden="true"></i></span>
                        <input type="text" class="form-control form-control8392" placeholder="搜索前往更大的世界。" name="str"> 
                        <span class="input-group-addon"><a href="#" onclick="document:searchform.submit()">SEARCH</a></span> 
                    </form>
                </div>
            </div>
        </div>
    </section>


    <!-- ======content section/body=====-->
    <section class="main-content920">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div id="main">
                        <input id="tab1" type="radio" name="tabs" checked>
                        <label for="tab1">教师列表</label>
                        <input id="tab2" type="radio" name="tabs">
                        <label for="tab2">搜索</label>
                      
                        <input id="tab5" type="radio" name="tabs">
                        <label for="tab5">待解决提问</label>


						
                        <section id="content1">
                            <!--Recent Question Content Section -->
                            <div class="question-type2033">
                            <% 
                            	if(searchlist==null){
                            	TeacherDAO teacherDAO=new TeacherDAO();
                            	List<User> userlist=(ArrayList)teacherDAO.getall();
                        		List<Teacher> teacherlist=(ArrayList)teacherDAO.getallTeacher();
                            	for(int i=0;i<userlist.size();i++){
                           			User user2=(User)userlist.get(i);
                           			Teacher teacher=(Teacher)teacherlist.get(i);%>
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
                                           <a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"> 70浏览</i> </a>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="<%=user2.UserId %>" class="overlay">
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
										  	    <c:if test="${user!=null }">
										  		<button onclick="sureorder(<%=user.UserId %>,<%=user2.UserId %>)" class="btn">拜师</button>
										  		</c:if>
										  		<c:if test="${user==null }">
										  		<button onclick = "alert('您尚未登录！')" class="btn">拜师</button>
										  		</c:if>
										  		<c:if test="${user!=null }">
										  		<button onclick = "window.location.href = 'chatbox.html'" class="btn">聊天</button>
										  		</c:if>
										  		<c:if test="${user==null }">
										  		<button onclick = "alert('您尚未登录！')" class="btn">聊天</button>
										  		</c:if>
										  	</div>
										</div>
								  	</div>
                                <%}} 
                                else{
                                	System.out.println(searchlist);
                                for(int i=0;i<searchlist.size();i++){
                           			Teacher teacher2=(Teacher)searchlist.get(i);
                           			User user3=(User)new UserDAO().get(teacher2.UserId);%>
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
                                                    <a id="alert-window_<%=user3.UserId %>" target="_blank" name=<%=user3.UserId %>><%=user3.getUserName() %></a>
                                                </h3> 
                                            </div>
                                            <div class="ques-details10018">
                                                <p>电话号码：<%=user3.getDialNumber() %></p>
                                                <p>email: <%=user3.getEmail()%></p>
                                                <p>擅长的知识：<%=teacher2.getKnowledgeGoodAt()%></p> 
                                                <p>学校:  <%=user3.getCollege()%></p>
                                            </div>
                                            <hr>
                                           <div class="ques-icon-info3293"> 
                                           <a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"> 70浏览</i> </a>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="<%=user3.UserId %>" class="overlay">
								    <!-- dialog：指示弹窗窗体。 -->
									  	<div class="dialog">
									  		<!-- dialog-header：指示弹窗头部。 -->
										  	<div class="dialog-header">
										  	    <!-- dialog-title：指示弹窗标题。 -->
										  		<div class="dialog-title"><%=user3.getUserName() %>详细信息</div>
										  		<!-- dialog-close-icon：指示关闭按钮样式。dialog-close：指示关闭弹窗触发器 -->
										  		<div class="dialog-close-icon dialog-close"></div>
										  	</div>
										  	<!-- dialog-content：指示弹窗内容。 -->
										  	<div class="dialog-content">                            
																		
									        <div class="col-md-9">
									             <div class="right-description893">
									                <div id="que-hedder2983">
									                    <h3>
									                        <img width=45 height=45 src="image/images.png" alt="image"><a><%=user3.getUserName() %></a>
									                    </h3>
									                </div>
									        <div class="ques-details10018">
									            <p>电话号码：<%=user3.getDialNumber() %></p>
									            <p>email: <%=user3.getEmail()%></p>
									            <p>学校:  <%=user3.getCollege()%></p>
									            <p>专业:  <%=user3.getMajor()%></p>
									            <p>年级:  <%=user3.getGrade()%></p>
									            <p>擅长的知识：<%=teacher2.getKnowledgeGoodAt()%></p>
                                                <p>期待的报酬：<%=teacher2.getWantedFee()%></p>
                                                <p>可行的时间：<%=teacher2.getAvailableTime()%></p>
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
										  	    <c:if test="${user!=null }">
										  		<button onclick="sureorder(<%=user.UserId %>,<%=user3.UserId %>)" class="btn">拜师</button>
										  		</c:if>
										  		<c:if test="${user==null }">
										  		<button onclick = "alert('您尚未登录！')" class="btn">拜师</button>
										  		</c:if>
										  		<c:if test="${user!=null }">
										  		<button onclick = "window.location.href = 'chatbox.html'" class="btn">聊天</button>
										  		</c:if>
										  		<c:if test="${user==null }">
										  		<button onclick = "alert('您尚未登录！')" class="btn">聊天</button>
										  		</c:if>
										  	</div>
										</div>
								  	</div>
                                <%}} %>
                            </div>
                            
                        </section>
                        <!--  End of content-1------>

                         

                        <!----end of content-2----->

                       


                        <section id="content5">
                            <!--Recent Question Content Section -->
                            <div class="question-type2033">
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
                                                    <a href="post-deatils.html" target="_blank">有人知道软工作业要写不完了该怎么办嘛？</a>
                                                </h3> 
                                            </div>
                                            <div class="ques-details10018">
                                                <p>多年后，坐在三流软件公司加班的Sishxo，将会想起Tian带我见识MVC的那个遥远的下午。</p>
                                            </div>
                                            <hr>
                                           <div class="ques-icon-info3293"> <a href="#"><i class="fa fa-check" aria-hidden="true"> 已解决</i></a> <a href="#"><i class="fa fa-star" aria-hidden="true"> 5</i> </a> <a href="#"><i class="fa fa-folder" aria-hidden="true"> 话题组 1</i></a> <a href="#"><i class="fa fa-clock-o" aria-hidden="true"> 4 分钟前</i></a> <a href="#"><i class="fa fa-comment" aria-hidden="true">  3 回答</i></a> <a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"> 70 浏览</i> </a> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="ques-type302">
                                            <a href="#">
                                                <button type="button" class="q-type238"><i class="fa fa-comment" aria-hidden="true"> 3 回答</i></button>
                                            </a>
                                            <a href="#">
                                                <button type="button" class="q-type23 button-ques2973"> <i class="fa fa-user-circle-o" aria-hidden="true"> 70 浏览</i> </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End of content-5-->
                        </section>

                    </div>
                </div>
                <!--end of col-md-9 -->
                <!--strart col-md-3 (side bar)-->
                <aside class="col-md-3 sidebar97239">

                    <!-- login part -->
                    <c:if test="${user==null }">
                    <div class="login-part2389">
                        <h4>登录</h4>
                        <div class="input-group300"> <span><i class="fa fa-user" aria-hidden="true"></i></span>
                            <input type="text" class="namein309" placeholder="Username"> </div>
                        <div class="input-group300"> <span><i class="fa fa-lock" aria-hidden="true"></i></span>
                            <input type="password" class="passin309" placeholder="Name"> </div>
                        <a href="#">
                            <button type="button" class="userlogin320">登录</button>
                        </a>
                        <div class="rememberme">
                            <label>
                                <input type="checkbox" checked="checked"> 记住我 </label> <a href="signup.html"
                                class="resbutton3892"> 注册 </a> </div>
                    </div>
                    </c:if>
                    <!-- tags part -->
                    <div class="tags-part2398">
                        <h4>标签</h4>
                        <ul>
                            <li><a href="#">工学 </a></li>
                            <li><a href="#">理学</a></li>
                            <li><a href="#">商学 </a></li>
                            <li><a href="#">社会科学</a></li>
                            <li><a href="#">论坛</a></li>
                        </ul>
                    </div>
                </aside>
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
    <script type="text/javascript" src="js/dialog.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/npm.js"></script>
</body>

</html>