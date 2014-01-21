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

        <div id="logo"> <img src="images/top_logo.png" alt="" border="0" width="182" height="85" /><a href="index.jsp"></a> </div>
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
            <li><a href="signup.jsp" class="nav">Sign Up</a></li>
            <li class="divider"></li>
            <li><a href="shipping.jsp" class="nav">Shipping </a></li>
            <li class="divider"></li>
            <li><a href="contact.html" class="nav">Contact Us</a></li>
            <li class="divider"></li>
            <c:if test="${sessionScope['loginUserType'] == 'Admin'}" >
            <li><a href="manageTable.jsp?type=Product Type" class="nav">For Admin</a></li>
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
        <sql:query dataSource="${snapshot}" var="result3">
            SELECT * from product ORDER BY DATE ASC LIMIT 0 , 1;
        </sql:query>


        <div class="center_content">
            <c:forEach var="product" items="${result3.rows}" >
            <div class="oferta"> <img src="images/product/${product.id}.png" width="165" height="113" border="0" class="oferta_img" alt="" />
                <div class="oferta_details">
                    <div class="oferta_title">${product.pname}</div>
                    <div class="oferta_text">&nbsp; </div>
                    <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">details</a> </div>
            </div>
            </c:forEach>
            <div class="center_title_bar">Latest Products</div>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from product ORDER BY DATE ASC LIMIT 0 , 6;;
            </sql:query>
            <c:forEach var="product" items="${result.rows}" varStatus="status">
                <div class="prod_box">
                    <div class="center_prod_box">
                        <div class="product_title"><a onclick="window.open('detail.jsp?pictureType=product&id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');">${product.id} ${product.pname} (${product.date} )</a></div>
                        <div class="product_img"><a onclick="window.open('detail.jsp?pictureType=product&id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');"><img src="images/product/${product.id}.png" alt="" border="0" width="94" height="71" /></a></div>
                        <div class="prod_price"><!--<span class="reduce">350$</span> --><span class="price">${product.price} Bath.</span></div>
                    </div>
                    <div class="prod_details_tab">
                        <c:if test="${not empty sessionScope['loginID']}">
                            <a href="cart.jsp?type=addProduct&id=${product.id}" class="prod_buy"> Add to Cart</a>
                        </c:if>
                        <a onclick="window.open('detail.jsp?pictureType=product&id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');"
                           class="prod_details">
                            Details
                        </a>
                    </div>
                </div>
            </c:forEach>

        </div>
        <!-- end of center content -->
        <div class="right_content">
            <div class="title_box">Search</div>
            <div class="border_box">
                <input type="text" name="newsletter" class="newsletter_input" value="keyword"/>
                <a href="http://all-free-download.com/free-website-templates/" class="join">search</a> </div>
            <c:choose>
                <c:when test="${not empty sessionScope['cartID']}">
                    <sql:query dataSource="${snapshot}" var="result4">
                        SELECT amount,productPrice from cart_product where cid=${sessionScope['cartID']};
                    </sql:query>
                    <c:set var="totalPrice" value="0" />
                    <c:set var="totalProduct" value="0" />
                    <c:forEach var="product" items="${result4.rows}" varStatus="status">
                          <c:set var="totalPrice" value="${totalPrice + product.amount*product.productPrice}" />
                          <c:set var="totalProduct" value="${totalProduct + product.amount}" />
                    </c:forEach>
                    <div class="shopping_cart">
                        <div class="title_box">Shopping cart</div>
                        <div class="cart_details"> ${totalProduct} items <br />
                            <span class="border_cart"></span> Total: <span class="price">${totalPrice} $</span> </div>
                        <div class="cart_icon"><a href="cart.jsp?type=manageProduct"><img src="images/shoppingcart.png" alt="" width="35" height="35" border="0" /></a></div>
                    </div>
                </c:when>
            </c:choose>

            <div class="title_box">What’s new</div>

            <div class="border_box">
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * from product ORDER BY DATE ASC LIMIT 0 , 1;
                </sql:query>
                <c:forEach var="product" items="${result.rows}" varStatus="status">
                    <div class="prod_box">
                        <div class="center_prod_box">
                            <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">${product.id} ${product.pname} (${product.date} )</a></div>
                            <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="images/product/${product.id}.png"  alt="" border="0" width="94" height="71" /></a></div>
                            <div class="prod_price"><!--<span class="reduce">350$</span> --><span class="price">${product.price} Bath.</span></div>
                        </div>
                        <div class="prod_details_tab">
                            <c:if test="${not empty sessionScope['loginID']}">
                                <a href="cart.jsp?type=addProduct&id=${product.id}" class="prod_buy"> Add to Cart</a>
                            </c:if>
                            <a onclick="window.open('detail.jsp?pictureType=product&id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');"
                               class="prod_details">
                                Details
                            </a>
                        </div>
                    </div>
                </c:forEach>

            </div>


        </div>
        <!-- end of right content -->
    </div>
    <!-- end of main content -->
    <div class="footer">
        <div class="left_footer"> <img src="images/top_logo.png" alt="" width="89" height="42"/> </div>
        <div class="center_footer"><br />
            <img src="images/payment.gif" alt="" /> </div>
        <div class="right_footer"> <a href="http://all-free-download.com/free-website-templates/">home</a> <a href="http://all-free-download.com/free-website-templates/">about</a> <a href="http://all-free-download.com/free-website-templates/">sitemap</a> <a href="http://all-free-download.com/free-website-templates/">rss</a> <a href="http://all-free-download.com/free-website-templates/">contact us</a> </div>
    </div>
</div>
<!-- end of main_container -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

