<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/21
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>修改密码</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <form class="layui-form" id="changeform" method="post"  style="margin:80px 400px; width:450px;">
        <div class="layui-form-item">
            <label class="layui-form-label">原密码</label>
            <div class="layui-input-block">
                <input type="text" name="prepass" id="pre" placeholder="请输入原密码" autocomplete="off" class="layui-input">
            </div>
            <p>${msg}</p>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="text" name="nowpass" id="now" placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="text" name="nowpassagain" id="again" placeholder="请确认新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
    <button type="button"  id="stupass" class="layui-btn layui-btn-danger layui-btn-lg" style="margin:0 550px;">
        确认修改
    </button>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            $("#stupass").click(function () {
                var pre = $("#pre").val();
                var now = $("#now").val();
                var again = $("#again").val();
                var data="pre="+pre+"&now="+ now;
                console.log("qingqiu");

                if(now == again) {
                    $.ajax({

                        type: "post",
                        url: "<%=basePath%>student/changeStuPass",
                        data: data,
                        // $("#stupassform").submit();
                        // dataType:"post",
                        success: function (data) {
                            if (data == 1) {
                                //如果服务器返回的是 ok 则进行跳转到index.jsp页面
                                window.location.href = "<%=basePath%>views/studentInfo.jsp";
                            } else if (data == 0) {
                                //反之进行弹框提示   登录失败
                                window.location.href = "<%=basePath%>views/stu_editpass.jsp";
                                //如果账户错误则清空账户

                            } else {
                                alert("修改失败！！！");
                                //如果账户和密码都错误则清空账户密码
                                $("#pre").val("");
                                $("#now").val("");
                            }
                        }
                    });
                }else{

                    //两次输入不一致，弹出错误提示

                    $.messager.alert("提示信息","两次密码输入不一致！","warning");

                }

            });
        });

    </script>
</rapid:override>
<%@ include file="buyer_base.jsp" %>
