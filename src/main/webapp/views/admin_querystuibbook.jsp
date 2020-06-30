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

<table id="demo" lay-filter="test"></table>
    <button type="button" lay-submit="" class="layui-btn layui-btn-warm" id="exportExcel" name="exportExcel">
        <i class="layui-icon"></i>导出Excel</button>

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
            ,height: 450
            ,even:true
            ,url: '<%=basePath%>admin/adminquerystuinbook' //数据接口
            ,toolbar:true
            ,totalRow:true
            ,page: true //开启分页
            ,id:'tests'
            ,limit:10
            ,cols: [[
                 {field:'bookid',title:'书本编号',fixed: 'left', width: 100}
                ,{field: 'bookname', title: '书本名字', width: 100}
                ,{field: 'bookauthor', title: '书本作者', width: 100}
                ,{field: 'bookpublisher', title: '书本出版社',width: 100}
                ,{field: 'bookquantity', title: '数量', width: 100, sort: true}
                ,{field: 'bookprice', title: '单价',width: 100, sort: true}
                ,{field: 'studentname', title: '订购人', width: 100}
                ,{field: 'bookdate', title: '预定日期', width: 100, sort: true}
                ,{field: 'bookstate', title: '状态', width: 100, sort: true}
                ,{field: 'lackbooks', title: '缺书数量', width: 100, sort: true}
                ,{field:'right',height:80, width:200, title: '操作', toolbar:'#toolbarDemo'}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data);
            layer.msg(data.bookname);
            var layEvent = obj.event; //获得 lay-event 对应的值
            switch(obj.event){
                case 'delete':
                    // layer.msg('删除');
                    layer.confirm('确定删除ID为：'+data.bookid+"的书籍吗?",function(index){
                        $.ajax({
                            type:"post",
                            url:"<%=basePath%>admin/deletebooksbyid",
                            data:{'bookid':data.bookid},//向服务端发送删除的id
                            // dataType:"json",
                            success:function(data){
                                if (data.count > 0) {
                                    layer.msg('删除成功');
                                    window.parent.location.reload();
                                    // table.reload("demo");
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
        $("#sel").click(function (obj) {
            var data = obj.data
            console.log('1111112');
            console.info("sel");
            var bookname = $("#i_name").val();
            console.log(bookname);
            table.reload('tests', {
                url:'<%=basePath%>admin/adminqstuinbookbyname/'+bookname
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
