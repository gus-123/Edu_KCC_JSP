<%@page import="kosa.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kosa.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = BoardDao.getInstance();
	List<Board> list = dao.listBoard();
	System.out.println(list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글목록</h3>
	<a href="/board/insert_form.jsp">글쓰기</a>
	<table border="1" width="800">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			for(int i=0; i<list.size();i++){
				Board board = list.get(i);
		%>
		<tr>
			<td><%= board.getSeq() %></td>
			<!-- 글 상세보기 용도 -->
			<td><a href="/board/detail.jsp?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
			<td><%= board.getWriter() %></td>
			<td><pre><%= board.getContents() %></pre></td>
			<td><%= board.getRegdate() %></td>
			<td><%= board.getHitcount() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>