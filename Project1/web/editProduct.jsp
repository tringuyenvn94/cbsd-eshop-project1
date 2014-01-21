<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/15/14
  Time: 5:27 PM
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
    update product set pname='${param.name}',description='${param.description}',price=${param.price},amount=${param.amount},date='${param.date}',typeid=${param.typeid} where id=${param.id};
</sql:update>
<c:redirect url="manageTable.jsp?type=Product"/>
</body>
</html>
