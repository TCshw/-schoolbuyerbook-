<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="buyer_base.jsp"%>
<div>
    <button type="button" onclick="insert()" class="layui-btn layui-btn-lg layui-btn-warm" style="margin-top:15px;">新增书本</button>
</div>
<script>
    function insert() {
        window.location.href="<%=basePath%>views/buyer_inbook.jsp";
    }
</script>
<table id="demo" lay-filter="test"></table>


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="update">编   辑</button>
    </div>
</script>

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
                ,{field:'right',height:80, width:200, title: '操作', toolbar:'#toolbarDemo'}




            ]]
        });
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data);
            layer.msg(data.bookname);
            var layEvent = obj.event; //获得 lay-event 对应的值
            switch(obj.event){
                case 'update':
                    json = JSON.stringify(data);
                    layui.use('layer', function () {
                        //layer.msg(json);
                        layer.open({
                            title: '修改书本信息',
                            maxmin: true,
                            type: 2,
                            content: 'buyer_updatebook.jsp',
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


