<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/layui.css"/>
    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/lay/modules/layer.js"></script>
</head>
<body>
<div class="layui-upload">
    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
    <input class="layui-btn" style="display: none" id="tt" value="111">
    <button type="button" class="layui-btn" id="test9">开始上传</button><br>
    <img class ="layui-upload-img" src="" id="demo1">
</div>
<script>
    layui.use(['upload', 'layer'], function () {
        var $ = layui.jquery
            , layer = layui.layer
            , upload = layui.upload;

        upload.render({
            elem: '#test8'
            , url: '<%=basePath%>student/fileImp1'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , choose: function (obj) {
                // var file = this.files = obj.pushFile();
                obj.preview(function (index, file, result) {
                    document.getElementById("tt").style.display = "inline";
                    var xx = document.getElementById("tt").value = file.name+'【'+(file.size / 1024 / 1024).toFixed(2) + 'MB'+'】';
                    $("#demo1").attr('style','width:300px;heigth:400px');
                    $("#demo1").attr('src',result);

                })

            }
            , done: function (res) {
                if(res.code==0){

                    return layer.msg('上传失败-------');
                }else {
                    return  layer.msg('上传成功-------');
                }
            }
        });

    });

</script>
</body>
</html>
