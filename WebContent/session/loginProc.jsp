<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //DB에서 가져온 값이라 생각 함.
   String m_id = "kosa";
   String m_pass = "1234";
   
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   
   String name = "홍길동";
   //한국어 깨지는 거 방지(클라이언트에 전달되는게 아닌기 때문에 필요 없음)
   //String name = URLEncoder.encode(m_name, "utf-8");
   
   
   if(id.equals(m_id) && pass.equals(m_pass)){
      //Session과 관련된 내용(세션에 사용자 정보 저장)
      HttpSession sessions = request.getSession();
	
      //server에서만 움직이기에 encode 필요 없다.
	  session.setAttribute("name", name);
	  
      // 세션 유효 시간 설정 (예: 30분)
	  //session.setMaxInactiveInterval(30 * 60);
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