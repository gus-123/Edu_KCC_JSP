<%@page import="kosa.model.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setAttribute("name", "kosa");

   Person p = new Person("홍길동");
   request.setAttribute("person", p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:forward page="el_result.jsp"> --%>
	<%-- <jsp:param value="apple" name="fruit"/> --%>
    <jsp:forward page="jstl_exam.jsp">
      <jsp:param value="orange" name="fruit"/>
   </jsp:forward>
</body>
</html>