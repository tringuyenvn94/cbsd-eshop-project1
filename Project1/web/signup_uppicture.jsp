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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

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
        //String prefix =  getServletInfo();

        out.println("ID "+session.getAttribute("registerID"));
        uploadFile.setFileName(session.getAttribute("registerID")+".jpg");
        UploadBean up = new UploadBean();
        up.setFolderstore("C:\\Users\\XGxYeSiSaexX\\Desktop\\Project1\\web\\images\\user");
        up.store(mul);
        session.removeAttribute("registerID");
    }
    catch(Exception e){
        out.print(e);
    }

%>
<c:redirect url="index.jsp">
    <c:param name="msg" value="Success" />
</c:redirect>

</body>
</html>
