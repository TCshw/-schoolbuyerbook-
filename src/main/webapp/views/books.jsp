<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>查看书库</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
</head>
<body>
<table id="demo" lay-filter="test"></table>
<script type="text/html" id="t">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" id='i_name' name="i_name" lay-verify="required" placeholder="请输入书名" autocomplete="true" class="layui-input">
            </div>
            <button id="sel" class="layui-btn layui-btn-sm" data-type="sel" lay-event="sel">查询</button>
        </div>
    </div>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table,
            form=layui.form;

        //第一个实例
        table.render({
            elem: '#demo'
            ,toolbar: '#t'
            ,height: 312
            ,even:true
            ,url: '<%=basePath%>student/querybooks' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,id:'tests'
            ,totalRow: true //开启合计行
            ,cols: [[ //表头{type:'checkbox'}
                {field: 'bookid', title: 'ID', width: 80, sort: true,totalRowText: '合计'}
                , {field: 'bookname', title: '书本名字', width: 80}
                , {field: 'bookauthor', title: '书本作者', width: 80}
                , {field: 'bookpublisher', title: '书本出版社', width: 80}
                , {field: 'bookprice', title: '单价', width: 80, sort: true,totalRow: true}
                ,{field: 'major', title: '所属专业', width: 80, sort: true}
                ,{field: 'bookquantity', title: '数量', width: 80, sort: true}



            ]]
        });
        $("#sel").click(function (obj) {
            var data = obj.data
            console.log('1111112');
            console.info("sel");
            var bookname = $("#i_name").val();
            console.log(bookname);
            table.reload('tests', {
                url:'<%=basePath%>student/querybookbyname/'+bookname
                , page:{
                    curr:1
                },where:{
                    bookname:bookname
                }
            })

        });
    });


</script>

</body>
</html>
