<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.data.StudentData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username = request.getParameter( "username" );
 	String password = request.getParameter( "password" );
	String rememberMe = request.getParameter( "rememberMe" );
	
	String message = "";
	
	Cookie usernameCookie = new Cookie( "username" , "" );
	Cookie passwordCookie = new Cookie( "password" , "" );
	if( "zhangsan".equals( username ) ){
		if( "123456".equals( password ) ){
			if( "rememberMe".equals( rememberMe ) ){
				usernameCookie.setValue( username );
				passwordCookie.setValue( password );
			}
			List< Student> stdList = StudentData.getInitStudentList();
			application.setAttribute( "stdList" , stdList );
			response.addCookie( usernameCookie );
			response.addCookie( passwordCookie );
			session.setAttribute( "username", username );
			response.sendRedirect( "index.jsp" );
		}
		else{
			message = "密码错误";
		}
	}
	else{
		message = "找不到该用户！";
	}
	
	if( !"".equals( message ) ){
		response.addCookie( usernameCookie );
		response.addCookie( passwordCookie );
		request.setAttribute( "message" , message );
		request.setAttribute( "location" 
				, request.getContextPath() + "/login.jsp" );
		request.getRequestDispatcher( "/error.jsp" )
		 .forward( request , response );
	}
%>

</body>
</html>