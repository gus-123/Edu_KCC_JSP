<%@ page import="kosa.dao.MemberDao" %>
<%@ page import="kosa.model.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="kosa.model.Member"/>
<jsp:setProperty name="member" property="*"></jsp:setProperty> 
<%
    MemberDao dao = MemberDao.getInstance();
    dao.insert(member);
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
