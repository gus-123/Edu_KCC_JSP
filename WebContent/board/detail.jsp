<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kosa.model.Board" %>
<%@ page import="kosa.dao.BoardDao" %>

<%
    // 요청 파라미터에서 글 번호 추출(파라미터로 넘어오는 값은 다 문자열임. 그래서 정수형 값을 받아주어야 됨.)
    int seq = Integer.parseInt(request.getParameter("seq"));  //NumberFormat exception이나옴 detail부터 시작할 경우.

    // BoardDao 객체 생성 및 해당 글 조회
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.detailBoard(seq);  // 글번호를 전달 받아 보드 객체 가져옴.
%>

<!DOCTYPE html>
<html>
<head>
    <title>글 상세</title>
</head>
<body>
    <h3>글세부보기</h3>
    <table border="1">
        <tr>
            <th>글번호</th>
            <td><%= board.getSeq() %></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><%= board.getTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%= board.getWriter() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><pre><%= board.getContents() %></pre></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%= board.getRegdate() %></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%= board.getHitcount() %></td>
        </tr>
    </table>
    <br>
    <a href="list.jsp">목록으로</a>
</body>
</html>
