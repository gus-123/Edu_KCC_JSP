<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   Cookie[] cookies = request.getCookies();
   boolean bool = false;
   
   if(cookies != null){
      for(int i=0 ; i < cookies.length; i ++){
         if(cookies[i].getName().equals("name")){
            //서버쪽 쿠키 만료시키기
            cookies[i].setMaxAge(0);
            //client에 있는  쿠키를 삭제하기 위함.
            response.addCookie(cookies[i]);
            bool = true;
            break;
         }
      }
      if(bool != true){
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

</body>
</html>