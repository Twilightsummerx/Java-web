<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf8");
	String action = request.getParameter( "action" );

	String user = ( String )session.getAttribute( "username" );
	if( user == null || "".equals( user ) ){
		request.setAttribute( "message", "没有访问权限，请先登录！" );
		request.setAttribute( "location", request.getContextPath() +  "/login.jsp" );
		request.getRequestDispatcher( "/error.jsp" )
			.forward( request , response );
		return;
	}


	if( "del".equals( action ) ){
		String idStr = request.getParameter( "id" );
		if( idStr != null ){
			long id = Long.parseLong( idStr );
			List<Student> stdList = ( List<Student> )application.getAttribute( "stdList" );
			if( stdList != null ){
				for( Student std : stdList ){
					if( std.getId() == id ){
						stdList.remove( std );
						out.println( "<script type='text/javascript'>" );
						out.println( "alert('删除完成！')" );
						out.println( "window.opener.location.reload()" );
						out.println( "window.close()" );
						out.println( "</script>" );
						return;
					}
				}
				
				out.println( "<script type='text/javascript'>" );
				out.println( "alert('未找到相关学生信息！')" );
				out.println( "window.opener.location.reload()" );
				out.println( "window.close()" );
				out.println( "</script>" );
				return;
			}
		}
		out.println( "<script type='text/javascript'>" );
		out.println( "alert('参数错误！')" );
		out.println( "window.opener.location.reload()" );
		out.println( "window.close()" );
		out.println( "</script>" );
		return;
	}
	else if( "modify".equals( action ) ){
		
		String idStr = request.getParameter( "id" );
		Long id = Long.parseLong( idStr );
		List<Student> stdList = ( List<Student> )application.getAttribute( "stdList" );
		Student std = null;
		if( stdList != null ){
			for( Student s: stdList){
				if( id == s.getId() ) {
					std = s;
					break;
				}
			}
		}
		if( std == null ) {
			out.println( "<script type='text/javascript'>" );
			out.println( "alert('未找到相关学生信息！')" );
			out.println( "window.opener.location.reload()" );
			out.println( "window.close()" );
			out.println( "</script>" );
			return;
		}
		else {
			String number = request.getParameter( "number" );
			String name = request.getParameter( "name" );
			String sex = request.getParameter( "sex" );
			String department = request.getParameter( "department" );
			String [] likeArr = request.getParameterValues( "like" );
			List<String> likeList = new ArrayList();
			if( likeArr != null && likeArr.length > 0 ){
				for( int i=0; i<likeArr.length; i++ ){
					likeList.add( likeArr[i] );
				}
			}
			
			std.setName( name );
			std.setNumber( number );
			std.setDepartment( department );
			std.setSex( sex );
			std.setLike( likeList );
			if( "男".equals( sex )){
				String img = Math.random() > 0.5 ? "/img/9901.png" : "/img/9903.png";
				std.setImage( img );
			}
			else{
				String img = Math.random() > 0.5 ? "/img/9902.png" : "/img/9904.png";
				std.setImage( img );
			}
			
			out.println( "<script type='text/javascript'>" );
			out.println( "alert('修改完成！')" );
			out.println( "window.opener.location.reload()" );
			out.println( "window.close()" );
			out.println( "</script>" );
			
		}
		
	}
	else if ( "add".equals( action ) ){
		String number = request.getParameter( "number" );
		String name = request.getParameter( "name" );
		String sex = request.getParameter( "sex" );
		String department = request.getParameter( "department" );
		String [] likeArr = request.getParameterValues( "like" );
		List<String> likeList = new ArrayList();
		if( likeArr != null && likeArr.length > 0 ){
			for( int i=0; i<likeArr.length; i++ ){
				likeList.add( likeArr[i] );
			}
		}
		
		Student std = new Student();
		std.setId( Student.getMaxId() );
		std.setName( name );
		std.setNumber( number );
		std.setDepartment( department );
		std.setSex( sex );
		std.setLike( likeList );
		if( "男".equals( sex )){
			String img = Math.random() > 0.5 ? "/img/9901.png" : "/img/9903.png";
			std.setImage( img );
		}
		else{
			String img = Math.random() > 0.5 ? "/img/9902.png" : "/img/9904.png";
			std.setImage( img );
		}
		List<Student> stdList = ( List<Student> )application.getAttribute( "stdList" );
		stdList.add( 0, std );
		application.setAttribute( "stdList" ,stdList );
		
		out.println( "<script type='text/javascript'>" );
		out.println( "alert('增加完成！')" );
		out.println( "window.opener.location.reload()" );
		out.println( "window.close()" );
		out.println( "</script>" );
	}
%>







