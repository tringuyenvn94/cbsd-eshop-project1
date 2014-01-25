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
<html>
<head>
    <title>Nui shop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="iecss.css" />
    <![endif]-->
    <script type="text/javascript" src="js/boxOver.js"></script>
    <style>
        table {
            *border-collapse: collapse; /* IE7 and lower */
            border-spacing: 0;
            width: 100%;
        }

        .bordered {
            border: solid #ccc 1px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 1px #ccc;
            -moz-box-shadow: 0 1px 1px #ccc;
            box-shadow: 0 1px 1px #ccc;
        }

        .bordered tr:hover {
            background: #fbf8e9;
            -o-transition: all 0.1s ease-in-out;
            -webkit-transition: all 0.1s ease-in-out;
            -moz-transition: all 0.1s ease-in-out;
            -ms-transition: all 0.1s ease-in-out;
            transition: all 0.1s ease-in-out;
        }

        .bordered td, .bordered th {
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            font-size: 14px;
        }

        .bordered th {
            background-color: #dce9f9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
            background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
            -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
            -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;
            box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
            border-top: none;
            text-shadow: 0 1px 0 rgba(255,255,255,.5);
        }

        .bordered td:first-child, .bordered th:first-child {
            border-left: none;
        }

        .bordered th:first-child {
            -moz-border-radius: 6px 0 0 0;
            -webkit-border-radius: 6px 0 0 0;
            border-radius: 6px 0 0 0;
        }

        .bordered th:last-child {
            -moz-border-radius: 0 6px 0 0;
            -webkit-border-radius: 0 6px 0 0;
            border-radius: 0 6px 0 0;
        }

        .bordered th:only-child{
            -moz-border-radius: 6px 6px 0 0;
            -webkit-border-radius: 6px 6px 0 0;
            border-radius: 6px 6px 0 0;
        }

        .bordered tr:last-child td:first-child {
            -moz-border-radius: 0 0 0 6px;
            -webkit-border-radius: 0 0 0 6px;
            border-radius: 0 0 0 6px;
        }

        .bordered tr:last-child td:last-child {
            -moz-border-radius: 0 0 6px 0;
            -webkit-border-radius: 0 0 6px 0;
            border-radius: 0 0 6px 0;
        }
    </style>
    <script>
        function backToIndex(){
            window.location=('index.jsp')
        }
    </script>
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
                                <a href="logout.jsp" style="font-size: 12px;">Logout</a>
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

        <div id="logo"> <img src="images/mainlogo.png" alt="" border="0" width="182" height="85" /><a href="http://all-free-download.com/free-website-templates/"></a> </div>
    </div>
    <div id="main_content">
        <div id="menu_tab">
            <ul class="menu">
                <li><a href="index.jsp" class="nav"> Home </a></li>
                <li class="divider"></li>
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT id from producttype ORDER BY id  ASC LIMIT 0 , 1;
                </sql:query>
                <c:forEach var="producttype" items="${result.rows}" varStatus="status">
                    <li><a href="product.jsp?type=${producttype.id}" class="nav">Products</a></li>
                </c:forEach>
                <li class="divider"></li>
                <c:if test="${empty sessionScope['loginID']}" >
                    <li><a href="signup_step1.jsp" class="nav">Sign Up</a></li>
                    <li class="divider"></li>
                </c:if>
                <c:if test="${sessionScope['loginUserType'] == 'Admin'}" >
                    <li><a href="manageTable.jsp?type=Product Type" class="nav">Admin</a></li>
                    <li class="divider"></li>
                </c:if>
                <c:if test="${sessionScope['loginUserType'] == 'Customer'}" >
                    <li><a href="history.jsp" class="nav">History</a></li>
                    <li class="divider"></li>
                </c:if>
            </ul>
        </div>
        <!-- end of menu tab -->
        <div class="crumb_navigation"> Navigation: <span class="current">Home</span> </div>
 

        <div class="left_content">
            <div class="title_box">Categories</div>
            <ul class="left_menu">
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * from producttype ORDER BY id  ASC;
                </sql:query>

                    <c:forEach var="producttype" items="${result.rows}" varStatus="status">
                        <c:if test="${status.count %2 == 1}" >
                            <li class="odd"><a href="product.jsp?type=${producttype.id}">${producttype.ptname}</a></li>
                        </c:if>
                        <c:if test="${status.count %2 == 0}" >
                            <li class="even"><a href="product.jsp?type=${producttype.id}">${producttype.ptname}</a></li>
                        </c:if>
                    </c:forEach>
            </ul>
            <div class="border_box"></div>
            <div class="banner_adds"> <a href="http://all-free-download.com/free-website-templates/"></a> </div>
        </div>
        <!-- end of left content -->
     


        <div class="center_content">
          
            <div class="center_title_bar">History</div>

                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * from cart where uid=${sessionScope['loginID']} order by confirmDate asc;
                </sql:query>

                <table class="bordered" style="margin-top: 50px;">
                    <thead>
                    <tr>
                        <th colspan="1">No</th>

                        <th colspan="4">Total Price</th>
                        <th colspan="4">Status</th>
                        <th colspan="4">Date</th>                        
                    </tr>
                    </thead>                    
                 
                <c:forEach var="cart" items="${result.rows}" varStatus="status">
                    <tr>
                        <td colspan="1">${status.count}</td>

                        <sql:query dataSource="${snapshot}" var="result4">
                            SELECT amount,productPrice from cart_product where cid=${cart.cid};
                        </sql:query>
                        <c:set var="totalPrice" value="0" />
                        <c:forEach var="product" items="${result4.rows}" varStatus="status">
                            <c:set var="totalPrice" value="${totalPrice + product.amount*product.productPrice}" />
                        </c:forEach>
                        <td colspan="4">${totalPrice} $</td>
                        <c:choose>
                            <c:when test="${cart.confirmStatus == 1}">
                                <td colspan="4">Success</td>
                                <td colspan="4"><a href="historyDetail.jsp?cid=${cart.cid}&date=${cart.confirmDate}" >${cart.confirmDate}</a> </td>
                            </c:when>
                            <c:when test="${cart.confirmStatus == 0}">
                                <td colspan="4">-</td>
                                <td colspan="4"><a href="historyDetail.jsp?cid=${cart.cid}&date=${cart.confirmDate}" >-</a></td>
                            </c:when>
                        </c:choose>


                    </tr>
                </c:forEach>


            </table>
            </br> </br>
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <input type="button" value="Back" onclick="backToIndex();">

    </div>
    <!-- end of center content -->

    <!-- end of right content -->
</div>
<!-- end of main content -->
<div class="footer">
    <div class="left_footer"> <img src="images/mainlogo.png" alt="" width="89" height="42"/> </div>
    <div class="center_footer"><br />
        <img src="images/payment.gif" alt="" /> </div>
    <div class="right_footer"> <a href="http://all-free-download.com/free-website-templates/">home</a> <a href="http://all-free-download.com/free-website-templates/">about</a> <a href="http://all-free-download.com/free-website-templates/">sitemap</a> <a href="http://all-free-download.com/free-website-templates/">rss</a> <a href="http://all-free-download.com/free-website-templates/">contact us</a> </div>
</div>
</div>
<!-- end of main_container -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

