<%--
  Created by IntelliJ IDEA.
  User: XGxYeSiSaexX
  Date: 1/12/14
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Nui shop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <link rel="stylesheet" type="text/css" href="style.css" />

    <![endif]-->
    <script type="text/javascript" src="js/boxOver.js"></script>



</head>
<body>
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
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
        <div id="logo"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/top_logo.png" alt="" border="0" width="182" height="85" /></a> </div>
    </div>
    <div id="main_content">
    <div id="menu_tab">
        <ul class="menu">
            <li><a href="index.jsp" class="nav"> Home </a></li>
            <li class="divider"></li>
            <sql:query dataSource="${ds}" var="result">
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

            <div class="center_title_bar">${param.type}</div>

    <c:choose>
        <c:when test="${param.type=='Product Type'}">
            <sql:query dataSource="${ds}" var="result">
                select * from producttype order by id desc;
            </sql:query>
            <table class="bordered">
                <thead>
                <tr>
                    <th colspan="1">No</th>
                    <th colspan="6">Name</th>
                    <th colspan="6">Description</th>
                    <th colspan="6">&nbsp;</th>
                </tr>
                </thead>
                <form method="post" action="addProducttype.jsp">
                    <tr>
                        <td colspan="1">&nbsp;</td>
                        <td colspan="6"><input type="text" name="name" /></td>
                        <td colspan="6"><input type="text" name="description"/></td>
                        <td colspan="6">
                            <input type="image"
                                   src="images/button/add.png"
                            />
                        </td>
                    </tr>
                </form>
                <c:forEach var="producttype" items="${result.rows}" varStatus="status">
                    <tr>

                        <td colspan="1">${status.count}</td>
                        <c:choose>
                        <c:when test="${empty param.editid}" >
                            <td colspan="6">${producttype.ptname}</td>
                            <td colspan="6">${producttype.description}</td>
                            <td colspan="6">
                                <input type="image"
                                       src="images/button/edit2.png"
                                       onclick="onClickEditProducttype('${producttype.id}');"/>
                                <input type="image"
                                       src="images/button/del.png"
                                       onclick="deleteProducttype('${producttype.id}','${producttype.ptname}');">
                            </td>
                        </c:when>
                        <c:when test="${not empty param.editid}" >
                            <c:choose>
                                <c:when test="${param.editid==producttype.id}" >
                                    <td colspan="6"><input type="text" id="editPTName" value="${producttype.ptname}"/></td>
                                    <td colspan="6"><input type="text" id="editPTDescription" value="${producttype.description}"/></td>
                                    <td colspan="6">
                                        <input type="image"
                                               src="images/button/ok.png"
                                               onclick="editProducttype('${producttype.id}',document.getElementById('editPTName').value,document.getElementById('editPTDescription').value);" />
                                        <input type="image"
                                               src="images/button/cancel.png"
                                               onclick="onClickCancel('Product Type');"/>
                                    </td>
                                </c:when>
                                <c:when test="${param.editid!=producttype.id}" >
                                    <td colspan="6">${producttype.ptname}</td>
                                    <td colspan="6">${producttype.description}</td>
                            <td colspan="6">
                                <input type="image"
                                       src="images/button/edit2.png"
                                       onclick="onClickEditProducttype('${producttype.id}');"/>
                                <input type="image"
                                       src="images/button/del.png"
                                       onclick="deleteProducttype('${producttype.id}','${producttype.ptname}');">
                            </td>
                                </c:when>
                            </c:choose>
                        </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>

                </form>

            </table>
        </c:when>
        <c:when test="${param.type=='Product'}">
            <table class="bordered">
                <thead>
                <tr>
                    <th colspan="1">No</th>
                    <th colspan="6">Product Name</th>
                    <th colspan="6">Description</th>
                    <th colspan="6">Price</th>
                    <th colspan="6">Amount</th>
                    <th colspan="6">Date</th>
                    <th colspan="6">Type</th>
                    <th colspan="6">Picture</th>
                    <th colspan="6">&nbsp;</th>
                </tr>
                </thead>
                <form method="post" action="addProduct.jsp"  >
                    <tr>
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <td colspan="1">&nbsp;</td>
                        <td colspan="6"><input type="text" name="name" /></td>
                        <td colspan="6"><input type="text" name="description"/></td>
                        <td colspan="6"><input type="text" name="price"/></td>
                        <td colspan="6"><input type="text" name="amount"/></td>
                        <td colspan="6"><input type="text" name="date" value="<fmt:formatDate pattern="yyyy-MM-dd"
                            value="${now}" />"/></td>
                        <sql:query dataSource="${ds}" var="result2">
                            select id,ptname from producttype order by id desc;
                        </sql:query>
                        <td colspan="6">
                            <select name="type">
                            <c:forEach var="producttype" items="${result2.rows}" varStatus="status">
                                    <option value="${producttype.id}">${producttype.ptname}</option>
                            </c:forEach>
                            </select>
                        </td>
                        <td colspan="6"><input type="file" name="pic" value="Open Window" /></td>
                        <td colspan="6">
                            <input type="image"
                                   src="images/button/add.png"
                                    />
                        </td>
                    </tr>
                </form>
                <sql:query dataSource="${ds}" var="result">
                    select * from product order by id desc;
                </sql:query>
                <c:forEach var="product" items="${result.rows}" varStatus="status">
                    <tr>
                        <td colspan="1">${status.count}</td>
                        <c:choose>
                            <c:when test="${empty param.editid}" >
                                <td colspan="6">${product.pname}</td>
                                <td colspan="6"><a onclick="window.open('description.jsp?id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');">
                                    Description... </a></td>
                                <td colspan="6">${product.price}</td>
                                <td colspan="6">${product.amount}</td>
                                <td colspan="6">${product.date}</td>
                                <sql:query dataSource="${ds}" var="result3">
                                    select id,ptname from producttype where id='${product.typeid}';
                                </sql:query>
                                <c:forEach var="producttype" items="${result3.rows}" varStatus="status">
                                <td colspan="6">${producttype.ptname}</td>
                                </c:forEach>
                                <td colspan="6"><input type="button" onClick="window.open('viewPicture.jsp?pictureType=product&id=${product.id}','Ratting','width=600,height=600,left=0,top=0,toolbar=0,status=0');" value="View" /></td>
                                <td colspan="6">
                                    <input type="image"
                                           src="images/button/edit2.png"
                                           onclick="onClickEditProduct('${product.id}');"/>
                                    <input type="image"
                                           src="images/button/del.png"
                                           onclick="deleteProduct('${product.id}','${product.pname}');">
                                </td>
                            </c:when>
                            <c:when test="${not empty param.editid}" >
                                <c:choose>
                                    <c:when test="${param.editid==product.id}" >
                                        <td colspan="6"><input type="text" id="editPName" value="${product.pname}"/></td>
                                        <td colspan="6"><input type="text" id="editPDescription" value="${product.description}"/></td>
                                        <td colspan="6"><input type="text" id="editPrice" value="${product.price}"/></td>
                                        <td colspan="6"><input type="text" id="editAmount" value="${product.amount}"/></td>
                                        <td colspan="6"><input type="text" id="editDate" value="${product.date}"/></td>
                                        <td colspan="6">
                                        <select id="editPType">
                                            <sql:query dataSource="${ds}" var="result">
                                                select id,ptname from producttype;
                                            </sql:query>
                                            <c:forEach var="producttype" items="${result.rows}" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${producttype.id==product.typeid}">
                                                        <option value="${producttype.id}" selected>${producttype.ptname}</option>
                                                    </c:when>
                                                    <c:when test="${producttype.id!=product.typeid}">
                                                        <option value="${producttype.id}">${producttype.ptname}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                        </td>
                                        <td colspan="6">
                                            <input type="image"
                                                   src="images/button/ok.png"
                                                   onclick="editProduct('${product.id}',
                                                                             document.getElementById('editPName').value,
                                                                             document.getElementById('editPDescription').value,
                                                                             document.getElementById('editPrice').value,
                                                                             document.getElementById('editAmount').value,
                                                                             document.getElementById('editDate').value,
                                                                             document.getElementById('editPType').value);" />
                                            <input type="image"
                                                   src="images/button/cancel.png"
                                                   onclick="onClickCancel('Product');"/>
                                        </td>

                                    </c:when>
                                    <c:when test="${param.editid!=product.id}" >
                                        <td colspan="6">${product.pname}</td>
                                        <td colspan="6">Description</td>
                                        <td colspan="6">${product.price}</td>
                                        <td colspan="6">${product.amount}</td>
                                        <td colspan="6">${product.date}</td>
                                        <sql:query dataSource="${ds}" var="result3">
                                            select id,ptname from producttype where id='${product.typeid}';
                                        </sql:query>
                                        <c:forEach var="producttype" items="${result3.rows}" varStatus="status">
                                            <td colspan="6">${producttype.ptname}</td>
                                        </c:forEach>
                                        <td colspan="6"><input type="button" onClick="window.open('viewPicture.jsp?pictureType=product&id=${product.id}','Ratting','width=550,height=170,left=150,top=200,toolbar=0,status=0');" value="View" /></td>
                                        <td colspan="6">
                                            <input type="image"
                                                   src="images/button/edit2.png"
                                                   onclick="onClickEditProduct('${product.id}');"/>
                                            <input type="image"
                                                   src="images/button/del.png"
                                                   onclick="deleteProduct('${product.id}','${product.pname}');">
                                        </td>
                                    </c:when>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>

                </form>

            </table>
        </c:when>
        <c:when test="${param.type=='User'}">
            <sql:query dataSource="${ds}" var="result">
                select * from user order by id desc;
            </sql:query>
            <table class="bordered">
                <thead>
                <tr>
                    <th colspan="1">No</th>
                    <th colspan="6">Name</th>
                    <th colspan="6">Surname</th>
                    <th colspan="6">Username</th>
                    <th colspan="6">Password</th>
                    <th colspan="6">Email</th>
                    <th colspan="6">Tel</th>
                    <th colspan="6">Address</th>
                    <th colspan="6">User Type</th>
                    <th colspan="6">&nbsp;</th>
                </tr>
                </thead>
                <form method="post" action="addUser.jsp">
                    <tr>
                        <td colspan="1">&nbsp;</td>
                        <td colspan="6"><input type="text" name="name" /></td>
                        <td colspan="6"><input type="text" name="surname"/></td>
                        <td colspan="6"><input type="text" name="username"/></td>
                        <td colspan="6"><input type="text" name="password"/></td>
                        <td colspan="6"><input type="text" name="email"/></td>
                        <td colspan="6"><input type="text" name="tel"/></td>
                        <td colspan="6"><input type="text" name="address"/></td>
                        <td colspan="6">
                            <select name = "userType">
                                <option value="0">Admin</option>
                                <option value="1">Customer</option>
                            </select>
                        </td>
                        <td colspan="6">
                            <input type="image"
                                   src="images/button/add.png"
                                    />
                        </td>
                    </tr>
                </form>
                <c:forEach var="user" items="${result.rows}" varStatus="status">
                    <tr>

                        <td colspan="1">${status.count}</td>
                        <c:choose>
                            <c:when test="${empty param.editid}" >
                                <td colspan="6">${user.uname}</td>
                                <td colspan="6">${user.surname}</td>
                                <td colspan="6">${user.username}</td>
                                <td colspan="6">${user.password}</td>
                                <td colspan="6">${user.email}</td>
                                <td colspan="6">${user.tel}</td>
                                <td colspan="6">${user.address}</td>
                                <td colspan="6">
                                    <c:choose>
                                        <c:when test="${user.userType == 0}">
                                            Admin
                                        </c:when>
                                        <c:when test="${user.userType == 1}">
                                            Customer
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td colspan="6">
                                    <input type="image"
                                           src="images/button/edit2.png"
                                           onclick="onClickEditUser('${user.id}');"/>
                                    <input type="image"
                                           src="images/button/del.png"
                                           onclick="deleteUser('${user.id}','${user.uname}');">
                                </td>
                            </c:when>
                            <c:when test="${not empty param.editid}" >
                                <c:choose>
                                    <c:when test="${param.editid==user.id}" >
                                        <td colspan="6"><input type="text" id="editUName" value="${user.uname}"/></td>
                                        <td colspan="6"><input type="text" id="editSurname" value="${user.surname}"/></td>
                                        <td colspan="6"><input type="text" id="editUsername" value="${user.username}"/></td>
                                        <td colspan="6"><input type="text" id="editPassword" value="${user.password}"/></td>
                                        <td colspan="6"><input type="text" id="editEmail" value="${user.email}"/></td>
                                        <td colspan="6"><input type="text" id="editTel" value="${user.tel}"/></td>
                                        <td colspan="6"><input type="text" id="editAddress" value="${user.address}"/></td>
                                        <td colspan="6">
                                            <select id="editUserType">
                                                <c:choose>
                                                    <c:when test="${user.userType == 0}">
                                                        <option value="0" selected>Admin</option>
                                                        <option value="1" >Customer</option>
                                                    </c:when>
                                                    <c:when test="${user.userType == 1}">
                                                        <option value="0" >Admin</option>
                                                        <option value="1" selected>Customer</option>
                                                    </c:when>
                                                </c:choose>
                                            </select>
                                        </td>

                                        <td colspan="6">
                                            <input type="image"
                                                   src="images/button/ok.png"
                                                   onclick="editUser('${user.id}',
                                                           document.getElementById('editUName').value,
                                                           document.getElementById('editSurname').value,
                                                           document.getElementById('editUsername').value,
                                                           document.getElementById('editPassword').value,
                                                           document.getElementById('editEmail').value,
                                                           document.getElementById('editTel').value,
                                                           document.getElementById('editAddress').value,
                                                           document.getElementById('editUserType').value);" />
                                            <input type="image"
                                                   src="images/button/cancel.png"
                                                   onclick="onClickCancel('User');"/>
                                        </td>
                                    </c:when>
                                    <c:when test="${param.editid!=user.id}" >
                                        <td colspan="6">${user.uname}</td>
                                        <td colspan="6">${user.surname}</td>
                                        <td colspan="6">${user.username}</td>
                                        <td colspan="6">${user.password}</td>
                                        <td colspan="6">${user.email}</td>
                                        <td colspan="6">${user.tel}</td>
                                        <td colspan="6">${user.address}</td>
                                        <td colspan="6">
                                            <c:choose>
                                                <c:when test="${user.userType == 0}">
                                                    Admin
                                                </c:when>
                                                <c:when test="${user.userType == 1}">
                                                    Customer
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td colspan="6">
                                            <input type="image"
                                                   src="images/button/edit2.png"
                                                   onclick="onClickEditUser('${user.id}');"/>
                                            <input type="image"
                                                   src="images/button/del.png"
                                                   onclick="deleteUser('${user.id}','${user.uname}');">
                                        </td>
                                    </c:when>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>

                </form>

            </table>
        </c:when>
    </c:choose>

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

