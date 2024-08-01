<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kosa.model.Board" %>
<%@ page import="kosa.dao.BoardDao2" %>
<%@ page import="java.util.UUID" %>

<%
    // 요청 파라미터에서 글 번호 추출
    int seq = 0;
    try {
        seq = Integer.parseInt(request.getParameter("seq"));
    } catch (NumberFormatException e) {
        // 에러 페이지로 이동하거나, 에러 메시지 출력
        response.sendRedirect("list2.jsp");
        return;
    }

    // BoardDao 객체 생성 및 해당 글 조회
    BoardDao2 dao = BoardDao2.getInstance();
    Board board = dao.detailBoard(seq);

    // CSRF 토큰 생성
    String csrfToken = UUID.randomUUID().toString();
    session.setAttribute("csrfToken", csrfToken);
%>

<!DOCTYPE html>
<html>
<head>
    <title>글 수정</title>
</head>
<body>
    <h3>게시글 수정</h3>
    <form action="updateProc2.jsp" method="post">
        <input type="hidden" name="seq" value="<%= board.getSeq() %>">
        <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
        <table>
            <tr>
                <th>글번호</th>
                <td><%= board.getSeq() %></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="<%= board.getTitle() %>"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= board.getWriter() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="6" cols="70" name="contents"><%= board.getContents() %></textarea></td>
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
        <input type="submit" value="수정완료">
    </form>
</body>
</html>
