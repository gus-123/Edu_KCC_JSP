<%-- <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       ArrayList<String> list = (ArrayList)session.getAttribute("productList");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <%
      if(list == null) {
         
   %>
   <b>선택한 상품이 존재하지 않습니다.</b>

   <%}else { %>   

   <ul>
      <% for(String product : list) { %>
         <li> <%= product %> </li>
      <% }%>
      
   </ul>   
   <%} %>
</body>
</html>
--%>

<%-- el태그 버전 --%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
       ArrayList<String> list = (ArrayList)session.getAttribute("productList");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <ul>
        <c:choose>
            <%-- <c:when test="${empty sessionScope.productList}"> --%>
            <c:when test="${productList == null}">
                <b>선택한 상품이 존재하지 않습니다.</b>
            </c:when>
            <c:otherwise>
                <c:forEach var="product" items="${productList}">
                    <li>${product}</li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
    </ul>
</body>
</html>