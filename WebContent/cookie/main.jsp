<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String name = "";
	boolean bool = false;

	if(cookies != null) {
		for(int i=0;i<cookies.length;i++) {
			if(cookies[i].getName().equals("name")) {
				//한국어 깨지는 거 방지 Decoding
				name = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				bool = true;
				break;
			} 
		}
		
		if(bool != true) {
			response.sendRedirect("loginForm.jsp");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%= name %></b>님 반갑습니다.<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>