<%@ page import="kosa.model.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    before : <%= request.getAttribute("name") %><br>
    after: ${name }<br><br>

    before : <%= ((Person) request.getAttribute("person")).getName() %><br>
    after : ${person.name }<br><br>

    before : <%= request.getParameter("fruit") %><br>
    after : ${param.fruit }
</body>
</html>
