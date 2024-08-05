<%@page import="kosa.dao.BoardDao2"%>
<%@page import="kosa.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  //UTF-8 필터 적용
	//request.setCharacterEncoding("utf-8");
%> 
<jsp:useBean id="board" class="kosa.model.Board"/><!-- Board board = new Board() -->
<jsp:setProperty property="*" name="board"/>  <!-- board.setTitle(request.getParameter("title"))  -->

 <%
 	BoardDao2 dao = BoardDao2.getInstance();
 	int re = dao.insertBoard(board);
 	if(re == 1){
 		response.sendRedirect("/board/list2.jsp");
 	}else{
 		out.println("실패");
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