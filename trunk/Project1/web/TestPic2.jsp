<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/12/14
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@page import="javazoom.upload.*"%>
<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    try{
        MultipartFormDataRequest mul = new MultipartFormDataRequest(request);
        UploadFile uploadFile =(UploadFile)mul.getFiles().get("pic");
        String prefix =  getServletInfo();
        out.println(prefix+"");
        uploadFile.setFileName("20.jpg");
        UploadBean up = new UploadBean();
        up.setFolderstore("C:\\Users\\XGxYeSiSaexX\\Desktop\\Project1\\web\\images\\product");
        up.store(mul);
    }
    catch(Exception e){
        out.print(e);
    }

%>
<h1>Hello World!</h1>
</body>
</html>
