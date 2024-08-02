<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DB에서 가져온 값이라 생각 함.
   String m_id = "kosa";
   String m_pass = "1234";
   
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   
   String m_name = "홍길동";
 //한국어 깨지는 거 방지
   String name = URLEncoder.encode(m_name, "utf-8");
   
   //로그인이 성공했을 때만 cookie가 만들어진다.
   if(id.equals(m_id) && pass.equals(m_pass)){
      Cookie cookie = new Cookie("name", name);
      //cookie 클라이언트에 저장 / Session 서버에 저장(클라이언트에 전달하기 위해)
      response.addCookie(cookie);
   }else{
      response.sendRedirect("loginForm.jsp");
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href="main.jsp">메인</a>
</body>
</html>