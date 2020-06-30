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
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>教材发行人员查看书本</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui.all.js"></script>
    <style type="text/css">
        .formdiv{
            padding:120px 500px;
        }
        /*解决Chrome下表单自动填充后背景色为黄色*/
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
    </style>

</head>


<body>

<script type="text/javascript">
    $(document).ready(function () {
        $("#login2").click(function () {
            var userid = $("#userid").val();
            var userpass = $("#userpass").val();


            $.ajax({
                type: "post",
                url: "<%=basePath%>check",
                data: {
                    "userid": userid,
                    "userpass": userpass
                },
                // dataType:"post",
                success: function (data) {
                    if (data == 2) {
                        //如果服务器返回的是 ok 则进行跳转到index.jsp页面
                        window.location.href = "views/admin_index.jsp";
                    } else if (data == 1) {
                        //反之进行弹框提示   登录失败
                        window.location.href = "views/studentIndex.jsp";
                        //如果账户错误则清空账户

                    } else if (data == 3) {
                        //反之进行弹框提示   登录失败
                        window.location.href = "views/buyer_index.jsp";
                        //如果密码错误则清空密码

                    } else {
                        alert("登录失败！！！");
                        //如果账户和密码都错误则清空账户密码
                        $("#userid").val("");
                        $("#userpass").val("");
                    }
                }
            });

        });
    });

</script>


<form id="loginform"  method="post">
    账户： <input type="text" name="userid" id="userid" /> <br />
    密码： <input type="password" name="userpass" id="userpass" /> <br />
    <input type="button"  id="login2" value="登录" />

</form>


</body>

</html>
