<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에서 사용자 이름 가져오기
	//String name = (String) session.getAttribute("name");

	// 이름이 null인 경우(로그인 하지 않은 경우) 로그인 페이지로 이동
	//if (name == null) {
    //	response.sendRedirect("loginForm.jsp");
	//}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%-- <%= name %> --%></b>님 반갑습니다.<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>