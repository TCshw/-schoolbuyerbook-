<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/19
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>首页</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <div style="width:600px; height:450px; margin:100px 350px; border:3px solid gray;">
        <h2 style="text-align: center; margin-top: 25px; margin-bottom: 25px;">教材订购系统（学生）</h2>
        <h3 style="margin-left:50px; margin-bottom: 10px;">1.登陆后请及时修改初始密码（个人资料）</h3>
        <h3 style="margin-left:50px; margin-bottom: 10px;">2.查看库寸书本，订购书籍，查看订购书籍状态</h3>
    </div>
</rapid:override>
<%@ include file="base.jsp"%>
