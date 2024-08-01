<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 24. 7. 31.
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>글쓰기</h3>
    <hr>
    <form Action="insertAction.jsp" method="post">
        작성자: <input type="text" name="writer"> <br>
        제목 : <input type="text" name="title"> <br>
        내용: <br>
        <textarea rows="6" cols="70" name="contents"></textarea>
        <br>
        <input type="submit" value="등록">
    </form>
</body>
</html>
