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
<%@page import="javazoom.upload.*"%>

<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/cbsdeshop"
                   user="root" password="1234"/>
<sql:update dataSource="${ds}" var="count">
    insert into product values(null,'${param.name}','${param.description}',${param.price},${param.amount},'${param.date}',${param.type});
</sql:update>
<sql:query dataSource="${ds}" var="result">
    select id from product order by id DESC LIMIT 0 , 1;
</sql:query>
<c:forEach var="product" items="${result.rows}" varStatus="status">
    <c:set var="id" value="${product.id}" />

    <%
        /*try{
            MultipartFormDataRequest mul = new MultipartFormDataRequest(request);
            UploadFile uploadFile =(UploadFile)mul.getFiles().get("pic");
            String id = ParamUtil.getString(request, "fromemail");

            out.println("HH "+id);
            uploadFile.setFileName(id+".jpg");
            UploadBean up = new UploadBean();
            up.setFolderstore(getClass()+"C:\\Users\\XGxYeSiSaexX\\Desktop\\LabComponentBase\\Project2\\web\\images\\product");
            up.store(mul);
        }
        catch(Exception e){
            out.print(e);
        }
        */
    %>

</c:forEach>
<c:redirect url="manageTable.jsp?type=Product" />

</body>
</html>
