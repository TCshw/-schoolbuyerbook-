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
    <title>查看书本</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
</head>
<body>
<table id="demo" lay-filter="test"></table>
<script>
    layui.use('table', function(){
        var table = layui.table,
            form=layui.form;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,even:true
            ,url: '<%=basePath%>student/queryPurchasebook' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,totalRow: true //开启合计行
            ,cols: [[ //表头{type:'checkbox'}
                {field: 'bookquantity', title: '数量', width: 80, sort: true,totalRowText: '合计'}
                , {field: 'bookpublisher', title: '书本出版社', width: 80}
                , {field: 'bookauthor', title: '书本作者', width: 80}
                , {field: 'bookname', title: '书本名字', width: 80}
                , {field: 'bookprice', title: '单价', width: 80, sort: true,totalRow: true}
                , {field: 'bookid', title: 'ID', width: 80, sort: true}
                , {field: 'bookdate', title: '预定时间', width: 80, sort: true}

            ]]
        });

    });


</script>

</body>
</html>
