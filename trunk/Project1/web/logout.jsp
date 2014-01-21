<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/13/14
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logged out</title>
</head>
<body>
<%
    session.removeAttribute("loginID");
    session.removeAttribute("loginName");
    if( session.getAttribute("loginUserType").equals("Customer") ){
        session.removeAttribute("cartID");
    }
    session.removeAttribute("loginUserType");
%>

<c:redirect url="index.jsp"/>
</body>
</html>
