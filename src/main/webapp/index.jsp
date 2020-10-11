<%--
  Created by IntelliJ IDEA.
  User: c3730
  Date: 10/9/2020
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询用户信息</title>
  </head>
  <style>
    #search{
      font-size: 50px;
      color: aqua;
      /*margin-left: auto;*/
      /*margin-right: auto;*/


    }
    a{
      text-align: center;
    }
  </style>
  <body>
  <div align="center">
    <a href="${pageContext.request.contextPath}/userListServlet" id="search" >点击查询用户信息</a>
    <h2>
     ${requestScope.users}
    </h2>
<%--      用EL表达式获取当前目录 防止报错--%>
  </div>
  </body>
</html>
