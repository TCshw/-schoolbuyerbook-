<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>教材发行人员查看书本</title>
    <rapid:block name="head"></rapid:block>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui.all.js"></script>
</head>

<body class="layui-layout-body" style="padding:10px 50px;">

<ul class="layui-nav layui-bg-blue">
    <li class="layui-nav-item"><a href="<%=basePath%>admin/adminindex" style="font-size:20px;">首页</a></li>
    <!--这里${requestScope}取不到值，需要改为${param}-->
    <li class="layui-nav-item"><a href="<%=basePath%>admin/admininfo?adminid=${sessionScope.adminid}" style="font-size:20px;">个人资料</a></li>
    <li  class="layui-nav-item" ><a  style="font-size:18px" onclick ="window.location='<%=basePath%>views/admin_querystuibbook.jsp'">查看教材预定信息</a></li>
    <li  class="layui-nav-item" ><a   style="font-size:18px" onclick ="window.location='<%=basePath%>views/admin_books.jsp'">查看库存教材</a></li>
    <li  class="layui-nav-item" ><a   style="font-size:18px" onclick ="window.location='<%=basePath%>views/admin_lackbook.jsp'">录入缺书单</a></li>


    <li class="layui-nav-item" style="float:right; "><a href="<%=basePath%>exit" style="font-size: 20px;">退出登录</a></li>
    <li class="layui-nav-item" style="float:right; font-size:20px;"><i class="layui-icon" style="font-size:18px;" >&#xe612;</i>&nbsp;${sessionScope.username}&nbsp;</li>
</ul>
<rapid:block name="content"></rapid:block>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#Btn").click(function () {
                var book_id = $("#bookid").val();
                var book_n = $("#bookname").val();
                var book_a = $("#bookauthor").val();
                var book_p = $("#bookpublisher").val();
                var book_pr = $("#bookprice").val();
                var book_quan = $("#bookquantity").val();


                $.ajax({
                    type:"post",
                    url:"<%=basePath%>admin/lackbook",
                    data:{
                        "bookid":book_id,
                        "bookname":book_n,
                        "bookauthor":book_a,
                        "bookpublisher":book_p,
                        "bookprice":book_pr,
                        "bookquantity":book_quan
                    },
                    // dataType:"post",
                    success:function (data) {
                        if (data.count > 0) {
                            alert("增加fdsf成功");
                            $("#lackbook")[0].reset();
                        }
                        else {
                            alert("增加失败");
                        }
                    }
                });
            });
        });
    </script>
</head>

<form id="lackbook"  method="post">
    <table>
        <tr>
            <td>书本编号:</td>
            <td><input type="text" name="Lackbook.bookid" id="bookid"></td>
        </tr>

        <tr>
            <td>书本名字:</td>
            <td><input type="text" name="Lackbook.bookname" id="bookname"></td>
        </tr>
        <tr>
            <td>书本作者:</td>
            <td><input type="text" name="Lackbook.bookauthor" id="bookauthor"></td>
        </tr>
        <tr>
            <td>书本出版社:</td>
            <td><input type="text" name="Lackbook.bookpublisher" id="bookpublisher"></td>
        </tr>
        <tr>
            <td>书本单价:</td>
            <td><input type="text" name="Lackbook.bookprice" id="bookprice"></td>
        </tr>

        <tr>
            <td>书本数量:</td>
            <td><input type="text" name="Lackbook.bookquantity" id="bookquantity"></td>
        </tr>

        <tr>
            <td></td>
            <td><input type="button" value="提交" id="Btn" /></td>
        </tr>
    </table>
</form>
<br><br>

</body>

</html>
