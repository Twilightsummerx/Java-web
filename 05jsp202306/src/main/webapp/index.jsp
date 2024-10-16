<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = ( String ) session.getAttribute( "username" );
	
	if( username == null || "".equals( username ) 
		|| "null".equals( username ) ){
		String message = "没有访问权限，请先登录！";
		String location = request.getContextPath() + "/login.jsp";
		request.setAttribute( "message" , message );
		request.setAttribute( "location" , location );
		request.getRequestDispatcher( "/error.jsp" )
			.forward( request , response );
		return ;
	}


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<link rel="stylesheet" type="text/css" href="font/iconfont.css"/>
</head>
<body>
	<!--1左侧菜单 -->
		<div id="menu-div">
			<!--11 左侧菜单-上方用户信息-->
			<div id="logo-div">
				<img src="img/zs.png" />
				<span>张升</span>
			</div>
			<!--12 左侧菜单-下方菜单列表-->
			<div id="menu-list-div">
				<!--一级菜单列表-->
				<ul class="menu-ul level-1">
					<!--一级菜单列表项 活动菜单-->
					<li class="menu-li active-menu">
						信息管理
						<span class="iconfont"></span>
						<!--二级菜单列表-->
						<ul class="menu-ul level-2">
							<!--二级菜单列表项 活动菜单-->
							<li class="menu-li active-menu" data-url="student/studentList.html">
								学生信息管理
							</li>
							<li class="menu-li" data-url="#">
								学生信息管理
							</li>
							<li class="menu-li" data-url="#">
								学生信息管理
							</li>
						</ul>
					</li>
					<!--一级菜单列表项-->
					<li class="menu-li">
						事务管理
						<span class="iconfont"></span>
						<!--二级菜单列表-->
						<ul class="menu-ul level-2">
							<!--二级菜单列表项-->
							<li class="menu-li" data-url="#">
								请销假申请</li>
							<li class="menu-li" data-url="#">
								助学金申请</li>
						</ul>
					</li>
					<li class="menu-li" data-url="#">
						个人设置
						<span class="iconfont"></span>
					</li>
				</ul>
			</div>
		</div>
		<!--2 右侧主体部分 -->
		<div id="body-div">
			<!--21 右侧主体部分 顶部区域（系统名称、站内信、退出）-->
			<div id="top-div">
				<span id="title-span">学生信息管理系统</span>
				<div>
					<!--站内信 -->
					<button id="message-btn" type="button" class="top-btn">
						站内信
						<span>3</span>
						<div id="message-list-div">
							<ul>
								<li>
									<span class="from-user-span">张三</span>
									<span class="send-time-span">2022-04-20 20:25:46</span>
								</li>
								<li>
									<span class="from-user-span">李思文</span>
									<span class="send-time-span">2022-04-20 10:27:21</span>
								</li>
								<li>
									<span class="from-user-span">王武文</span>
									<span class="send-time-span">2022-04-19 22:39:52</span>
								</li>
							</ul>
						</div>
					</button>
					<!--退出 -->
					<button id="logout-btn" type="button" class="top-btn">退出</button>
				</div>
			</div>
			<!--22 右侧主体部分 主页面-->
			<div id="main-div">
				<iframe src="student/studentList.jsp"></iframe>
			</div>
		</div>
</body>
<script type="text/javascript">
	var logoutBtn = document.getElementById( "logout-button" )
	logoutBtn.onclick = function(){
		window.open( "<%=request.getContextPath()%>/do_logout.jsp", "_self" )
	}
</script>




</html>