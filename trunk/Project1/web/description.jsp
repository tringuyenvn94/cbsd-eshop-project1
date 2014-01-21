<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/15/14
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/cbsdeshop"
                   user="root" password="1234"/>
<sql:query dataSource="${ds}" var="result">
    select description from product where id=${param.id}
</sql:query>
<c:forEach var="product" items="${result.rows}" >
    <c:set var="description" value="${product.description}"/>
</c:forEach>
<table border="1" class="bordered">
    <%
        String description = (String) pageContext.getAttribute("description");
        String [] listStr = description.split(",!");
        for(int i = 0 ; i < listStr.length ; i += 1){
            String [] columns = listStr[i].split("\\|");
            out.print("<tr>");
            for(int j = 0 ; j < columns.length ; j += 1){
                out.print("<td colspan=\"6\">" + columns[j] + "</td>");
            }
            out.print("</tr>");
        }
    %>

</table>
</body>
</html>
