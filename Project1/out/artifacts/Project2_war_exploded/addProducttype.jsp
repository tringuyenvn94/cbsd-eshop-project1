<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/15/14
  Time: 4:35 PM
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
    insert into producttype values(null,'${param.name}','${param.description}');
</sql:update>
<c:redirect url="manageTable.jsp?type=Product Type"/>
</body>
</html>
