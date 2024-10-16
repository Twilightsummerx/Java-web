<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
	href="<%=request.getContextPath() %>/css/login.css">

</head>
<%
	String username = "";
	String password = "";
	Cookie [] cookies = request.getCookies();
	if( cookies != null ){
		for( int i=0; i<cookies.length; i++){
			if( "username".equals( cookies[i].getName() ) ){
				username = cookies[i].getValue();
			}
			if( "password".equals( cookies[i].getName() ) ){
				password = cookies[i].getValue();
			}
		}
	}
%>
<body>
	<div id="form-div">
		<form action="do_login.jsp" method="post" name="msgForm">
			<h2 class="form-title">用户登录</h2>
			<input type="text" name="username" 
				placeholder="请输入用户名" value="<%=username%>" />
			<input type="password" name="password" 
				placeholder="请输入密码" value="<%=password%>"/>
			<label>
				<input type="checkbox" name="rememberMe"  
					value="rememberMe" 
					<%="".equals(password)?"":"checked" %> />
				下次自动登录
			</label>
			<input type="submit" value="登录" id="submit-button"/>
			
		</form>
	</div>

</body>
</html>