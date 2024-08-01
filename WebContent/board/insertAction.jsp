<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 24. 7. 31.
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kosa.dao.BoardDao" %>
<%@ page import="kosa.model.Board"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="kosa.model.Board"/> <!-- Board board = new Board()와 같은 코드(Board 객체 생성) -->
<jsp:setProperty name="board" property="*"></jsp:setProperty> <!-- board.setTitle(request.getParameter("title")) - request.getParameter("title") 받은 값을 board에 넣어줌. useBean의 id와 name은 같아야함. property는 form에서 넘어오는 갯수만큼 넘어오게 하는 값 -->

<%
    BoardDao dao = BoardDao.getInstance();
    //dao.insert(board);
    
    int re = dao.insert(board);
    if(re == 1) {
    	//out.println("성공");
    	response.sendRedirect("/board/list.jsp");
    } else {
    	out.println("실패");	
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
