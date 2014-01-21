<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/12/14
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Nui shop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="iecss.css" />
    <![endif]-->
    <script type="text/javascript" src="js/boxOver.js"></script>

</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/cbsdeshop"
                   user="root"  password="1234"/>



<div id="main_container">
    <div id="header">
        <c:choose>
            <c:when test="${empty sessionScope['loginID']}">
                <div class="top_right">
                    </br>
                    </br>
                    <form method="post" action="loginAuthenticate.jsp">
                        <table>
                            <tr>
                                <td><p1>Username &nbsp; </p1></td>
                                <td>&nbsp;<input type="text" name="username" /></td>
                            </tr>
                            <tr>
                                <td><p1>Password &nbsp; </p1></td>
                                <td>&nbsp;<input type="text" name="password" /></td>
                            </tr>
                            <tr>
                                <td><p1>&nbsp; </p1></td>
                                <td><input type="submit" value=" Login " /> <a href=""><p1 class="forgot">forgot password</p1></a> </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </c:when>
            <c:when test="${not empty sessionScope['loginID']}">

                <div class="top_right">
                    </br>
                    </br>
                    <table>
                        <tr>
                            <td><img  src="images/user/${sessionScope['loginID']}.jpg" width="64" height="70"  /></td>
                            <td>&nbsp;Hi&nbsp; ${sessionScope['loginName']} </br>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="" style="font-size: 12px;">My Profile</a> </br> </br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="" style="font-size: 12px;">Logout</a>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <div>
                        <div>

                        </div>
                    </div>
                </div>

            </c:when>
        </c:choose>
        <div id="logo"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/top_logo.png" alt="" border="0" width="182" height="85" /></a> </div>
    </div>
    <div id="main_content">
        <div id="menu_tab">
            <ul class="menu">
                <li></li>
                <li class="divider"></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <!-- end of menu tab -->
        <div class="crumb_navigation"> Navigation: <span class="current">Home</span> </div>
 

        <div class="left_content">
            <div class="title_box">Menu</div>
            <ul class="left_menu">

                    
                            <li class="odd"><a href="manageTable.jsp?type=Product Type">Product Type</a></li>
                            <li class="even"><a href="manageTable.jsp?type=Product">Product</a></li>
                            <li class="odd"><a href="manageTable.jsp?type=User">User</a></li>

            </ul>
            <div class="border_box"></div>
            <div class="banner_adds"> <a href="http://all-free-download.com/free-website-templates/"></a> </div>
        </div>
        <!-- end of left content -->
        


        <div class="center_content">

            <div class="center_title_bar">Latest Products</div>
            

        </div>
        <!-- end of center content -->
        <div class="right_content">
          <div class="border_box">
                
            

          </div>


        </div>
        <!-- end of right content -->
    </div>
    <!-- end of main content -->
    <div class="footer">
        <div class="left_footer"> <img src="images/footer_logo.png" alt="" width="89" height="42"/> </div>
        <div class="center_footer"><br />
            <img src="images/payment.gif" alt="" /> </div>
        <div class="right_footer"> <a href="http://all-free-download.com/free-website-templates/">home</a> <a href="http://all-free-download.com/free-website-templates/">about</a> <a href="http://all-free-download.com/free-website-templates/">sitemap</a> <a href="http://all-free-download.com/free-website-templates/">rss</a> <a href="http://all-free-download.com/free-website-templates/">contact us</a> </div>
    </div>
</div>
<!-- end of main_container -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

