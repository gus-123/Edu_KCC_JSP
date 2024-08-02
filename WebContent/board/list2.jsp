<%@page import="kosa.model.Blog"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kosa.model.Search"%>
<%@page import="kosa.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kosa.dao.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	/* 정적 SQL */
	/* 0번 방식 */	
	//BoardDao2 dao = BoardDao2.getInstance();
	//List<Board> listBoard();   

   /* 동적 SQL */
   /* 1번 방법 */
   /*
   Search search = new Search();
   search.setArea(request.getParameterValues("area"));  // 체크박스는 'getParameterValues' 로 받음
   //쿼리에서 like를 통한 검색을 할 때 편하게 이용하기 위해 "%" 같이 넣는다.
   search.setSearchKey("%" + request.getParameter("searchKey")+ "%");
   
   BoardDao2 dao = BoardDao2.getInstance();
   List<Board> list = dao.listBoard(search);
   */
   
   /* 2번 방법 */
   Map map = new HashMap();
   map.put("area", request.getParameterValues("area"));
   map.put("searchKey", "%" + request.getParameter("searchKey")+ "%");
   
   BoardDao2 dao = BoardDao2.getInstance();
   List<Board> list = dao.listBoard(map);
   
   //블로그 24.08.02
   //Blog blog = dao.selectBlog(100);
   //System.out.println(blog);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글목록</h3>
	<a href="/board/insert_form3.jsp">글쓰기</a>
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
			<td><a href="/board/detail2.jsp?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
			<td><%= board.getWriter() %></td>
			<td><pre><%= board.getContents() %></pre></td>
			<td><%= board.getRegdate() %></td>
			<td><%= board.getHitcount() %></td>
		</tr>
		<%
		}
		%>
	</table>
	<br><br>
	
	<form action="list2.jsp" method="get">
		<input type="checkbox" name="area" value="title">제목
		<input type="checkbox" name="area" value="writer">작성자
		<input type="text" name="searchKey" size="10">
		<input type="submit" value="검색">
	</form>
</body>
</html>