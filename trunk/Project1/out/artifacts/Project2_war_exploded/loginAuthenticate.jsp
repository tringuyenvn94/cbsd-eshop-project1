<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/13/14
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
</head>
<body>


    <c:if test="${ empty param.username or empty param.password}">
        <c:redirect url="index.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
        </c:redirect>

    </c:if>

    <c:if test="${not empty param.username and not empty param.password}">
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/cbsdeshop"
                     user="root" password="1234"/>


    <sql:query dataSource="${ds}" var="result">
        select * from user
        where username='${param.username}'
        and password='${param.password}'
    </sql:query>

    <c:forEach var="user" items="${result.rows}" >

        <c:set scope="session"
               var="loginID"
               value="${user.id}"/>
        <c:set scope="session"
               var="loginName"
               value="${user.uname}  ${user.surname}"/>

        <c:choose>
            <c:when test="${user.userType == 0}">
                <c:set scope="session"
                       var="loginUserType"
                       value="Admin"/>

                <c:redirect url="manageTable.jsp?type=Product Type"/>
            </c:when>

            <c:when test="${user.userType == 1}">
                <c:set scope="session"
                       var="loginUserType"
                       value="Customer"/>
                <sql:query dataSource="${ds}" var="result1">
                    select * from cart
                    where uid=${user.id} order by cid ASC LIMIT 0 , 1;
                </sql:query>
                <c:forEach var="cart" items="${result1.rows}" >
                    <c:choose>
                        <c:when test="${cart.confirmStatus == 0}">
                            <c:set scope="session"
                                   var="cartID"
                                   value="${cart.cid}"/>
                        </c:when>
                        <c:when test="${cart.confirmStatus == 1}">
                            <c:set scope="session"
                                   var="cartID"
                                   value="0"/>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:out value="${sessionScope['cartID']}" />
                <c:redirect url="index.jsp"/>
            </c:when>

        </c:choose>

        

    </c:forEach>
        <c:redirect url="index.jsp" >
            <c:param name="errMsg" value="Username/password does not match" />
        </c:redirect>
    </c:if>




</body>
</html>
