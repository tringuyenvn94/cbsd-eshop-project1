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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/cbsdeshop"
                   user="root" password="1234"/>

<c:set var="now" value="<%=new java.util.Date()%>" />
<sql:update dataSource="${ds}" var="count">
    update cart set confirmStatus=1,paymentMethod='${param.paymentMethod}',confirmDate='<fmt:formatDate pattern="yyyy-MM-dd" value="${now}"/>' where cid=${sessionScope['cartID']};
</sql:update>

<sql:query dataSource="${ds}" var="result2">
    select pid,amount from cart_product
    where cid=${sessionScope['cartID']};
</sql:query>
<%-- Minus amount number of  product --%>
<c:forEach var="cart_product" items="${result2.rows}" >
    <sql:update dataSource="${ds}" var="count">
        update product set amount=amount-${cart_product.amount} where id=${cart_product.pid};
    </sql:update>
</c:forEach>
<%
    session.removeAttribute("cartID");
%>
<%-- Create new cart for customer to shopping more  --%>
<sql:update dataSource="${ds}" var="count">
    insert into cart values(null,${sessionScope['loginID']},0,0,'1992-03-31','1992-03-31',' ');
</sql:update>

<sql:query dataSource="${ds}" var="result2">
    select * from cart
    where uid=${sessionScope['loginID']} and confirmStatus=0;
</sql:query>
<c:forEach var="cart" items="${result2.rows}" >
    <c:set scope="session"
           var="cartID"
           value="${cart.cid}"/>
</c:forEach>
<c:redirect url="index.jsp"/>
</body>
</html>
