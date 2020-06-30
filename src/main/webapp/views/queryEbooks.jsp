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
    <title>教材发行人员查看书本</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
</head>
<body>
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delete">删   除</button>
        <button class="layui-btn layui-btn-sm" lay-event="update">编   辑</button>
    </div>
</script>

<script type="text/html" id="t">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" id='i_name' name="i_name" lay-verify="required" placeholder="请输入物品名称" autocomplete="true" class="layui-input">
            </div>
            <button class="layui-btn layui-btn-sm" lay-event="sel">查询</button>
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
            ,height: 200
            ,even:true
            ,url: '<%=basePath%>admin/queryEbooks' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,cols: [[
                    {field: 'purchasebook.bookquantity', title: '数量',fixed: 'left', templet:function(fileIng){return fileIng.purchasebook.bookquantity},width: 100, sort: true}
                    ,{field: 'purchasebook.bookpublisher', title: '书本出版社', templet:function(fileIng){return fileIng.purchasebook.bookpublisher},width: 100}
                    ,{field: 'purchasebook.bookauthor', title: '书本作者', templet:function(fileIng){return fileIng.purchasebook.bookauthor}, width: 100}
                    ,{field: 'purchasebook.bookname', title: '书本名字',templet:function(fileIng){return fileIng.purchasebook.bookname}, width: 100}
                    ,{field: 'purchasebook.bookprice', title: '单价',templet:function(fileIng){return fileIng.purchasebook.bookprice}, width: 100, sort: true}
                    ,{field: 'purchasebook.studentname', title: '订购人',templet:function(fileIng){return fileIng.purchasebook.studentname}, width: 100}
                   ,{field: 'purchasebook.bookdate', title: '预定日期',templet:function(fileIng){return fileIng.purchasebook.bookdate}, width: 100, sort: true}
                    ,{field:'id',title:'id', width: 100, sort: true}
                    ,{field: 'bookstate', title: '状态', width: 100, sort: true}
                    ,{field:'right',height:80, width:300, title: '操作', toolbar:'#toolbarDemo'}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data);
            layer.msg(data.purchasebook.bookname);
            var layEvent = obj.event; //获得 lay-event 对应的值
            switch(obj.event){
                case 'delete':
                    // layer.msg('删除');
                    layer.confirm('确定删除ID为：'+data.id+"的书籍吗?",function(index){
                        $.ajax({
                            type:"post",
                            url:"<%=basePath%>admin/deletebooksbyid",
                            data:{'id':data.id},//向服务端发送删除的id
                            // dataType:"json",
                            json:function(data){
                                if (data.count > 0) {
                                    layer.msg('删除成功');
                                    window.parent.location.reload();
                                    layer.close(index);
                                }
                            }
                        });
                        return false;
                        //layer.close(index);
                    });
                    break;
                case 'update':
                    json = JSON.stringify(data);
                    layui.use('layer', function () {
                        //layer.msg(json);
                        layer.open({
                            title: '修改书本信息',
                            maxmin: true,
                            type: 2,
                            content: 'UpdateBook.jsp',
                            area: ['500px', '400px']
                        });
                    });
                    break;
            }

        });

        table.on('toolbar(test)',function (obj) {
            switch (obj.event){
                case 'sel':
                    var i_name = $("#i_name").val();
                    table.reload('tests',{
                        page:{
                            curr:1 //从第一页开始重载
                        },
                        where:{
                            bookname:i_name
                        }
                    });
                    break;
            }
        });
    });



</script>

</body>
</html>
