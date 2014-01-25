<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/15/14
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/cbsdeshop"
                   user="root" password="1234"/>
<sql:update dataSource="${ds}" var="count">
    insert into user values(null,'${param.name}','${param.surname}','${param.username}','${param.password}','${param.email}','${param.tel}','${param.address}',1);
</sql:update>

<sql:query dataSource="${ds}" var="result">
        SELECT id from user ORDER BY id  DESC LIMIT 0 , 1;
</sql:query>

<c:forEach var="user" items="${result.rows}" varStatus="status">
    <c:redirect url="signup_step2.jsp">
        <c:param name="id" value="${user.id}" />
    </c:redirect>
</c:forEach>

</body>
</html>
