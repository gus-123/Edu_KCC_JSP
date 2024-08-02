<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
       request.setCharacterEncoding("utf-8");
       String product = request.getParameter("product");

       List<String> list = (List)session.getAttribute("productList");
       
       if(list == null) { //list 처음 생성시 session안에 'productList'이름으로 리스트를 뽑았을때
          list = new ArrayList<String>();
          session.setAttribute("productList", list);
       }
       
       list.add(product);
       
       //if (list != null && !list.isEmpty()) {  //list안에 session안에 있기 때문에 pruduct를 넣은것과 같다.
       	//list.add(product);
       //}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href="javascript:history.back()">뒤로가기</a>
   <%=list %>
</body>
</html>